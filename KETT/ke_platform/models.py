from django.db.models import Model, CharField, TextField, IntegerField, FloatField, BooleanField, ImageField, \
    ManyToManyField, ForeignKey, CASCADE
from django.utils.safestring import mark_safe


class Shop(Model):
    """

    """
    title = CharField(max_length=126)
    description = TextField(validators=())
    image = ImageField(upload_to='shop_images/', null=True, blank=True, default=None)

    class Meta:
        db_table = 'shops'
        verbose_name = 'Shop'

    def __str__(self):
        return self.title


class Product(Model):
    """

    """
    title = CharField(max_length=126)
    description = TextField(validators=())
    amount = IntegerField()
    price = FloatField()
    active = BooleanField()
    categories = ManyToManyField(to='Category', related_name='product_categories',
                                 related_query_name='product_categories', symmetrical=False, )

    def __str__(self):
        return self.title

    class Meta:
        db_table = 'products'
        verbose_name = "Product"
        verbose_name_plural = "Products"


class ProductImage(Model):
    product_ref = ForeignKey(to='Product', related_name='Images', related_query_name='images', on_delete=CASCADE)
    image = ImageField(null=True, blank=True, upload_to='product_imgs')


class Category(Model):
    """

    """
    title = CharField(max_length=126)
    description = TextField()
    parent_category = ManyToManyField(to='self', default=None, blank=True, related_name='parents',
                                      related_query_name='parents', symmetrical=False,
                                      verbose_name='Parent Categories')

    def __str__(self):
        return self.title

    class Meta:
        db_table = 'categories'
        verbose_name = "Category"
        verbose_name_plural = "Categories"
