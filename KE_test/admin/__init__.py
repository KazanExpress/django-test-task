from django.contrib import admin

from KE_test.admin.shop import ShopAdmin
from KE_test.admin.product import ProductAdmin
from KE_test.admin.category import CategoryAdmin
from KE_test.models import Shop, Product, Category

admin.site.register(Shop, ShopAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(Category, CategoryAdmin)
