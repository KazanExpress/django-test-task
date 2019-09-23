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
    search_fields = ('product__id', 'title', 'parents')
    list_display = ('id', 'title')
    empty_value_display = 'NA'

    def has_add_permission(self, request, obj=None):
        return True

    def has_change_permission(self, request, obj=None):
        return True

    def has_delete_permission(self, request, obj=None):
        return True
