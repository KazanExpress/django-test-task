from django.contrib import admin
from django.contrib.admin import ModelAdmin, TabularInline, SimpleListFilter, BooleanFieldListFilter
from django.utils.safestring import mark_safe, SafeText

from .models import Shop, Product, Category, ProductImage


class IsVeryBenevolentFilter(SimpleListFilter):
    title = 'is_very_benevolent'
    parameter_name = 'is_very_benevolent'

    def lookups(self, request, model_admin):
        return (
            ('Yes', 'Yes'),
            ('No', 'No'),
        )

    def queryset(self, request, queryset):
        value = self.value()
        if value == 'Yes':
            return queryset.filter(benevolence_factor__gt=75)
        elif value == 'No':
            return queryset.exclude(benevolence_factor__gt=75)
        return queryset


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
    4.* First image is displayed as a main image in both list view and product view...
    5. Sorts products in the products list by the `number of orders` and `price`...
    ✓ Filters list of the products by `active` flag...
    7. Filters by a `price` range...
    ✓ Attaches a product to one or more `categories`...
    """
    search_fields = ('id', 'title')
    list_display = ('id', 'title', 'description', 'get_categories', 'amount')
    list_filter = (
        ('active', BooleanFieldListFilter),
    )
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
    ✓ Search by product id, title and parent category.
    ✓ Add one or more parent categories.
    ✓ Display all possible paths to chosen category.
    """
    search_fields = ('product__id', 'title', 'parent_category__title')
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
