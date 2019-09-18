from django.contrib import admin
from shops.models import Shop


class ShopAdmin(admin.ModelAdmin):
    search_fields = ('title',)
    readonly_fields = ('thumbnail',)

    def get_readonly_fields(self, request, obj=None):
        if obj:
            return self.readonly_fields + ('id', )
        return self.readonly_fields


admin.site.register(Shop, ShopAdmin)
