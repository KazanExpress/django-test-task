from django.db import models
from django.utils.safestring import mark_safe
from django.utils.translation import gettext_lazy as _


# Create your models here.

class Category(models.Model):
    id = models.BigAutoField(primary_key=True, verbose_name=_('ID'))
    title = models.TextField(verbose_name=_("Title of category"))
    description = models.TextField(verbose_name=_("Description of category"))
    parent = models.ManyToManyField(to='self', blank=True, symmetrical=False,
                                    related_name='children', verbose_name=_('parent'))

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = _('Category')
        verbose_name_plural = _('Categories')


class Product(models.Model):
    id = models.BigAutoField(primary_key=True, verbose_name=_('ID'))
    description = models.TextField(verbose_name=_("Description of product"))
    title = models.TextField(verbose_name=_("Title of product"))
    amount = models.IntegerField(verbose_name=_('Amount'))
    price = models.FloatField(verbose_name=_('Price'))
    categories = models.ManyToManyField('Category', verbose_name=_('Categories of product'))
    active = models.BooleanField(default=True, verbose_name=_('Active'))

    def __str__(self):
        return self.title

    def main_image(self):
        main_image_obj = ProductImage.objects.filter(product=self.id).first()
        if main_image_obj:
            return mark_safe(f'<img src="{main_image_obj.image.url}" height="150" />')
        return mark_safe('No images')

    class Meta:
        verbose_name = _('Product')
        verbose_name_plural = _('Products')


class ProductImage(models.Model):
    id = models.BigAutoField(primary_key=True, verbose_name=_('ID'))
    product = models.ForeignKey('Product', related_name=_('Images'), related_query_name='images',
                                on_delete=models.CASCADE)
    image = models.ImageField(upload_to='product_images/')

    def thumbnail(self):
        return mark_safe(f'<img src="{self.image.url}" height="150"/>')

    class Meta:
        verbose_name = _('ProductImage')
        verbose_name_plural = _('ProductImages')


class Shop(models.Model):
    id = models.BigAutoField(primary_key=True, verbose_name=_('ID'))
    title = models.TextField(verbose_name=_("Title of shop"))
    description = models.TextField(verbose_name=_("Description of shop"))
    image = models.ImageField(upload_to='shop_images/', verbose_name=_('Shop image'), blank=True, default=None)

    def __str__(self):
        return self.title

    def thumbnail(self):
        return mark_safe(f'<img src="{self.image.url}" height="150"/>')

    class Meta:
        verbose_name = _('Shop')
        verbose_name_plural = _('Shops')
