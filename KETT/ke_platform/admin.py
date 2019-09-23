from django.contrib import admin
from django.contrib.admin import ModelAdmin, TabularInline
from django.utils.safestring import mark_safe, SafeText

from .models import Shop, Product, Category, ProductImage


class ProductImageInline(TabularInline):
    model = ProductImage
    extra = 3
    readonly_fields = ['thumbnail']

    def thumbnail(self, obj) -> SafeText:
        """

        :param obj:
        :return:
        """
        thumb_width = 128 if obj.image.width > 128 else obj.image.width
        thumb_height = 128 if obj.image.height> 128 else obj.image.height
        return mark_safe(f'<img src="{obj.image.url}" width="{thumb_width}" height="{thumb_height}"/>')


@admin.register(Shop)
class ShopAdmin(ModelAdmin):
    """
    ✓ Navigate through the shops list.
    ✓ Make a search by title.
    ✓ Edit everything except shop id.
    ✓ Upload image as shop pic.
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
    ✓ Navigate through product list.
    ✓ Search by id or product title.
    ✓ Edit everything except product id.
    4. First image should be displayed as main image in both list view and product view.
    5. Sort products in product list by number of orders and by price.
    6. Filter list of products by active flag.
    7. Filter by price range.
    ✓ Attach product to one or more categories.
    """
    search_fields = ('id', 'title')
    list_display = ('id', 'title', 'description', 'get_categories', 'amount')
    empty_value_display = 'NA'

    inlines = [ProductImageInline]

    def get_categories(self, obj) -> SafeText:
        """

        :param obj:
        :return:
        """
        return mark_safe(", ".join([category.title for category in obj.categories.all()]))

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
    2. Search by product id, title and parent category.
    ✓ Add one or more parent categories.
    ✓ Display all possible paths to chosen category.
    """
    search_fields = ('product__id', 'title', 'parents')
    list_display = ('id', 'title', 'get_parent_categories', 'get_paths')
    empty_value_display = 'NA'

    def get_parent_categories(self, obj) -> SafeText:
        return mark_safe(', '.join([category.title for category in obj.parent_category.all()]))

    def has_add_permission(self, request, obj=None):
        return True

    def has_change_permission(self, request, obj=None):
        return True

    def has_delete_permission(self, request, obj=None):
        return True
