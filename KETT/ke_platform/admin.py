from django.contrib import admin
from django.contrib.admin import ModelAdmin, TabularInline

from .models import Shop, Product, Category, ProductImage


class ProductImageInline(TabularInline):
    model = ProductImage
    extra = 3


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
    list_display = ('id', 'title', 'description', 'amount')
    empty_value_display = 'NA'

    inlines = [ProductImageInline]

    def has_add_permission(self, request, obj=None):
        return True

    def has_change_permission(self, request, obj=None):
        return True

    def has_delete_permission(self, request, obj=None):
        return True


@admin.register(Category)
class CategoryAdmin(ModelAdmin):
    search_fields = ('id', 'title', 'parents')
    list_display = ('id', 'title')
    empty_value_display = 'NA'

    def has_add_permission(self, request, obj=None):
        return True

    def has_change_permission(self, request, obj=None):
        return True

    def has_delete_permission(self, request, obj=None):
        return True
