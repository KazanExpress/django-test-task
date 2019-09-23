from typing import Optional

from admin_numeric_filter.admin import RangeNumericFilter
from django.contrib import admin
from django.contrib.admin import ModelAdmin, TabularInline, BooleanFieldListFilter
from django.utils.safestring import mark_safe, SafeText

from .models import Shop, Product, Category, ProductImage


IMG_DEFAULT_WIDTH = 128
IMG_DEFAULT_HEIGHT = 128


class ProductImageInline(TabularInline):
    """
    For multiple images input support...
    """
    model = ProductImage
    extra = 3
    readonly_fields = ['get_thumbnail']

    def get_thumbnail(self, obj) -> SafeText:
        """
        Taking ProductImage object, transforms it into a safe [string] HTML-snippet...
        :param obj:
        :return: HTML-snippet with the image...
        """
        thumb_width = IMG_DEFAULT_WIDTH if obj.image.width > IMG_DEFAULT_WIDTH else obj.image.width
        thumb_height = IMG_DEFAULT_HEIGHT if obj.image.height > IMG_DEFAULT_HEIGHT else obj.image.height
        return mark_safe(f'<img src="{obj.image.url}" width="{thumb_width}" height="{thumb_height}"/>')
    get_thumbnail.short_description = 'Thumbnail'


@admin.register(Shop)
class ShopAdmin(ModelAdmin):
    """
    ✓ Navigates through the shops list...
    ✓ Makes a search by `title`...
    ✓ Edits everything except shop's `id`...
    ✓ Uploads an image as shop's picture...
    """
    search_fields = ('title',)
    list_display = ('id', 'title', 'description')
    empty_value_display = 'NA'

    def has_add_permission(self, request, obj=None):
        return True

    def has_change_permission(self, request, obj=None):
        return True

    def has_delete_permission(self, request, obj=None):
        return True


@admin.register(Product)
class ProductAdmin(ModelAdmin):
    """
    ✓ Navigates through the products list...
    ✓ Searches by `id` and product's `title`...
    ✓ Edits everything except for product's `id`...
    ✓ First image is displayed as a main image in both list view and product view...
    ✓ Sorts products in the products list by the `number of orders` and `price`...
    ✓ Filters list of the products by `active` flag...
    ✓ Filters by a `price` range...
    ✓ Attaches a product to one or more `categories`...
    """
    search_fields = ('id', 'title')
    list_display = ('id', 'title', 'description', 'price', 'get_categories', 'amount', 'orders_num', 'get_first_img')
    readonly_fields = ('get_first_img',)
    list_filter = (
        ('active', BooleanFieldListFilter),
        ('price', RangeNumericFilter)
    )
    ordering = ('price', 'orders_num')
    empty_value_display = 'NA'

    inlines = [ProductImageInline]

    def get_categories(self, obj) -> SafeText:
        """
        Retrieves parent categories and transforms them into a safe string (comma-separated)...
        :param obj:
        :return:
        """
        return mark_safe(", ".join([category.title for category in obj.categories.all()]))
    get_categories.short_description = 'Categories'

    def get_first_img(self, obj) -> Optional[SafeText]:
        """
        Tries to retrieve the first Product's image and transforms it into a safe [string] HTML-snippet...
        :param obj:
        :return: Either HTML-snippet with the image or None if there are no images in the field...
        """
        first_img = ProductImage.objects.filter(product_ref_id=obj.id).first()
        if not first_img:
            return None
        thumb_width = IMG_DEFAULT_WIDTH if first_img.image.width > IMG_DEFAULT_WIDTH else first_img.image.width
        thumb_height = IMG_DEFAULT_HEIGHT if first_img.image.height > IMG_DEFAULT_HEIGHT else first_img.image.height
        return mark_safe(f"<img src=\"{first_img.image.url}\" width=\"{thumb_width}\" height=\"{thumb_height}\"/>")
    get_first_img.short_description = 'Cover'

    def has_add_permission(self, request, obj=None):
        return True

    def has_change_permission(self, request, obj=None):
        return True

    def has_delete_permission(self, request, obj=None):
        return True


@admin.register(Category)
class CategoryAdmin(ModelAdmin):
    """
    ✓ Navigate through categories list.
    ✓ Search by product id, title and parent category.
    ✓ Add one or more parent categories.
    ✓ Display all possible paths to chosen category.
    """
    search_fields = ('product__id', 'title', 'parent_category__title')
    list_display = ('id', 'title', 'get_parent_categories', 'get_paths')
    empty_value_display = 'NA'

    def get_parent_categories(self, obj) -> SafeText:
        return mark_safe(", ".join([category.title for category in obj.parent_category.all()]))

    def has_add_permission(self, request, obj=None):
        return True

    def has_change_permission(self, request, obj=None):
        return True

    def has_delete_permission(self, request, obj=None):
        return True
