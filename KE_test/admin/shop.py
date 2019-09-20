from django.contrib import admin
from django.utils.safestring import mark_safe

from KE_test.admin.product import display


class ShopAdmin(admin.ModelAdmin):
    search_fields = ("title",)
    list_display = ("title", "id")
    readonly_fields = ("shop_image",)

    # by default everything is editable except for id
    # it is better to not explicitly set them because new editable fields may
    # appear in the future

    def shop_image(self, obj):
        return display(obj.image, width=300)
