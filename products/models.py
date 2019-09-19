from django.db import models
from django.utils.html import mark_safe
from django.utils.translation import gettext_lazy as _


class Category(models.Model):

    id = models.fields.BigIntegerField(primary_key=True, verbose_name=_('ID'))
    title = models.fields.TextField(max_length=100, verbose_name=_('Title'))
    description = models.fields.TextField(max_length=500, verbose_name='Description of category')
    parent_category = models.ManyToManyField('self', default=None, null=True, blank=True, symmetrical=False,
                                             related_name=_('Child categories+'),
                                             verbose_name=_('Parent categories'))

    def __str__(self):
        return f'{self.title}'

    class Meta:
        verbose_name = _('Category')
        verbose_name_plural = _('Categories')


class Product(models.Model):

    id = models.fields.BigIntegerField(primary_key=True, verbose_name=_('ID'))
    title = models.fields.TextField(max_length=100, verbose_name=_('Title'))
    description = models.fields.TextField(max_length=500, verbose_name=_('Description of product'))
    amount = models.fields.IntegerField(verbose_name=_('Amount'))
    price = models.fields.FloatField(verbose_name=_('Price'))
    categories = models.ManyToManyField('Category', verbose_name=_('Categories of product'))
    active = models.BooleanField(default=True, verbose_name=_('Active'))
    shop = models.ForeignKey('shops.Shop', on_delete=models.CASCADE, verbose_name=_('Shop'), related_name=_('Products'))

    def __str__(self):
        return f'{self.title} - {self.id}'

    def main_image_tag(self):
        main_image_obj = ProductImage.objects.filter(product=self.id).first()
        if main_image_obj:
            return mark_safe(f'<img src="{main_image_obj.image.url}" height="150" />')
        return mark_safe('No images')
    main_image_tag.short_description = _('Main image')

    class Meta:
        verbose_name = _('Product')
        verbose_name_plural = _('Products')


class ProductImage(models.Model):
    product = models.ForeignKey('Product', related_name=_('Images'), related_query_name='images',
                                on_delete=models.CASCADE)
    image = models.ImageField()

    def thumbnail(self):
        return mark_safe(f'<img src="{self.image.url}" height="150"/>')
