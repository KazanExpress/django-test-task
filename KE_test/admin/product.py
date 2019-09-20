from django.contrib import admin
from django.contrib.admin import SimpleListFilter
from django.utils.safestring import mark_safe
from jet.admin import CompactInline


from KE_test.models import ProductImage, Product, Category


class RecursiveSubcategoryListFilter(SimpleListFilter):
    """
    Given a category to search products in, searches also in subcategories of the category.
    """

    # Human readable title
    title = "category"

    # Parameter for the filter that will be used in the URL query.
    parameter_name = "category"

    def lookups(self, request, model_admin):
        return [(i.title, i.title) for i in Category.objects.all()]

    def queryset(self, request, queryset):
        # inefficient operation, at least use prefetches.
        prefetch_qs = Category.objects.prefetch_related("subcategory")

        category = self.value()
        categories = list(
            prefetch_qs.filter(title=category).values_list("id", flat=True)
        )
        subcategories = categories
        while True:
            subcategories = prefetch_qs.filter(
                subcategories__in=subcategories
            ).values_list("id", flat=True)
            if subcategories:
                categories.extend(subcategories)
            else:
                return (
                    queryset.filter(category__id__in=categories)
                    if category
                    else queryset
                )


def display(pic, width):
    """
    Displays an image in the admin panel (inserts HTML code)
    :param pic: ImageField attribute of any object
    :param width: width of the image (height will be propotional)
    :return: HTML insert for an image if it exists, "-" else
    """
    if pic:
        try:
            return mark_safe(
                '<img src="{url}" width="{width}" />'.format(url=pic.url, width=width)
            )
        except FileNotFoundError:
            return "-"
    else:
        return "-"


class ImagesInline(CompactInline):
    """
    Compact inline with purpose of displaying multiple images of product.
    """

    verbose_name = "Product image"
    verbose_name_plural = "Product images"
    model = ProductImage
    fields = ("image", "image_display")
    readonly_fields = ("image_display",)

    def image_display(self, obj):
        return display(pic=obj.image, width=300)


class ProductAdmin(admin.ModelAdmin):
    inlines = (ImagesInline,)
    search_fields = ("id", "title")

    list_display = ("title", "price", "orders", "list_image")
    readonly_fields = ("product_image",)

    # by default everything is editable except for id
    # it is better to not explicitly set them because new editable fields may
    # appear in the future

    sortable_by = ("price", "orders")
    list_filter = ("price", "active", RecursiveSubcategoryListFilter)

    def list_image(self, obj: Product):
        if obj.productimage_set.first():
            return display(pic=obj.productimage_set.first().image, width=50)
        else:
            return "-"

    def product_image(self, obj: Product):
        if obj.productimage_set.first():
            return display(pic=obj.productimage_set.first().image, width=300)
        else:
            return "-"
