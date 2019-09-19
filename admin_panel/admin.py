from admin_numeric_filter.admin import RangeNumericFilter
from django.contrib import admin
from django.contrib.admin import SimpleListFilter

from .models import Product, ProductImage, Shop, Category


# Register your models here.
class ShopAdmin(admin.ModelAdmin):
    search_fields = ('title',)
    readonly_fields = ('thumbnail', 'id')


class ProductImageInline(admin.TabularInline):
    model = ProductImage
    extra = 0
    readonly_fields = ('thumbnail',)


class ProductAdmin(admin.ModelAdmin):
    search_fields = ("id", "title")
    list_display = ('__str__', 'price', 'amount', 'main_image',)
    inlines = (ProductImageInline,)
    readonly_fields = ('id', 'main_image')
    ordering = ('price', 'amount')
    list_filter = (("price", RangeNumericFilter), "active")


class ByProductListFilter(SimpleListFilter):
    """
    Given a product, looks for categories it might fall into
    """

    # Human readable title
    title = "product"

    # Parameter for the filter that will be used in the URL query.
    parameter_name = "product"

    def lookups(self, request, model_admin):
        return [(i.title, i.title) for i in Product.objects.all()]

    def queryset(self, request, queryset):
        product = self.value()

        # can't be done in one query, reverse foreign key
        category_ids = Product.objects.filter(title=product).values_list(
            "category", flat=True
        )
        return queryset.filter(id__in=category_ids) if product is not None else queryset


class CategoryAdmin(admin.ModelAdmin):
    search_fields = ("title",)
    list_filter = ("parent", ByProductListFilter)


admin.site.register(Shop, ShopAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(Category, CategoryAdmin)
