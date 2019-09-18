from django.db import models


# Create your models here.


class Shop(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField(null=True, blank=True)
    image = models.ImageField(upload_to="shop_images/", null=True, blank=True)

    class Meta:
        verbose_name = "Shop"
        verbose_name_plural = "Shops"

    def __str__(self):
        return self.title


class Product(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField(null=True, blank=True)
    amount = models.IntegerField()
    price = models.FloatField()

    # as can be understood from the task, product is duplicated for different shops i.e.
    # if there is a product "sock" in two shops, it would be two entities
    # => models.CASCADE
    shop = models.ForeignKey("Shop", on_delete=models.CASCADE)
    category = models.ManyToManyField(
        "Category", related_name="categories", verbose_name="category"
    )

    # added attributes
    orders = models.IntegerField(default=0, verbose_name="number of orders")
    active = models.BooleanField(default=True)

    class Meta:
        verbose_name = "Product"
        verbose_name_plural = "Products"

    def __str__(self):
        return self.title


class ProductImage(models.Model):
    product = models.ForeignKey("Product", on_delete=models.CASCADE)
    image = models.ImageField(upload_to="product_images/")

    class Meta:
        verbose_name = "Product image"
        verbose_name_plural = "Product images"


class Category(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField(null=True, blank=True)
    subcategory = models.ManyToManyField(
        to="self",
        related_name="subcategories",
        symmetrical=False,
        verbose_name="subcategory",
    )

    class Meta:
        verbose_name = "Category"
        verbose_name_plural = "Categories"

    def __str__(self):
        return self.title
