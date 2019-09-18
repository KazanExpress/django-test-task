from django.contrib import admin
from django.utils.html import mark_safe
from admin_numeric_filter.admin import RangeNumericFilter, NumericFilterModelAdmin
from django_admin_listfilter_dropdown.filters import RelatedOnlyDropdownFilter

from products.models import Product, Category, ProductImage


class ProductImageInline(admin.TabularInline):
    model = ProductImage
    extra = 0
    readonly_fields = ('thumbnail',)


class ProductAdmin(NumericFilterModelAdmin):
    search_fields = ('title', 'id',)
    list_display = ('__str__', 'price', 'amount', 'main_image_tag',)
    list_filter = (
        ('price', RangeNumericFilter),
        ('active', admin.filters.BooleanFieldListFilter),
    )
    ordering = ('price', 'amount')
    readonly_fields = ('main_image_tag',)
    inlines = (ProductImageInline, )

    # To be able enter ID value during adding and read-only during editing
    def get_readonly_fields(self, request, obj=None):
        if obj:
            return self.readonly_fields + ('id', )
        return self.readonly_fields


class CategoryAdmin(admin.ModelAdmin):
    search_fields = ('product__id', 'title')
    list_filter = (
        ('parent_category', RelatedOnlyDropdownFilter),
    )
    readonly_fields = ('all_paths_to_category', )

    def get_all_paths(self, category, coming_paths):
        if category.parent_category.all():
            for parent_cat in category.parent_category.all():
                coming_paths[parent_cat.id] = []
                for path in coming_paths[category.id]:
                    coming_paths[parent_cat.id].append(str(parent_cat) + ' -> ' + path)
            coming_paths.pop(category.id, None)
            for parent_cat in category.parent_category.all():
                return self.get_all_paths(parent_cat, coming_paths)
        else:
            return coming_paths

    def all_paths_to_category(self, obj):
        coming_paths = {obj.id: [str(obj), ]}
        self.get_all_paths(obj, coming_paths)
        paths_html = ''
        for array_of_paths in coming_paths.values():
            for path in array_of_paths:
                paths_html += f'{path}<br>'
        return mark_safe(paths_html)


admin.site.register(Product, ProductAdmin)
admin.site.register(Category, CategoryAdmin)
