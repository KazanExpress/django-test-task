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


class CategoryAdmin(admin.ModelAdmin):
    search_fields = ("title",)
    list_filter = ("parent",)


admin.site.register(Shop, ShopAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(Category, CategoryAdmin)
