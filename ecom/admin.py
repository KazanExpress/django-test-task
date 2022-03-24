from django.contrib import admin
from .models import Category, ParentCategory, Product, Shop
# Register your models here.
admin.site.register(Shop)
admin.site.register(Product)
admin.site.register(Category)
admin.site.register(ParentCategory)