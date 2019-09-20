from django.contrib import admin
from django.contrib.admin import SimpleListFilter
from KE_test.models import Product


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
    list_filter = ("subcategories", ByProductListFilter)
