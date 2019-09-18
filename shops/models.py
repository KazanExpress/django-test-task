from django.db import models
from django.utils.html import mark_safe
from django.utils.translation import gettext_lazy as _


class Shop(models.Model):

    id = models.fields.BigIntegerField(primary_key=True, verbose_name=_('ID'))
    title = models.fields.TextField(max_length=100, verbose_name=_('Title'))
    description = models.fields.TextField(max_length=500, verbose_name=_('Description of shop'))
    image = models.ImageField(upload_to='shop_images/', verbose_name=_('Shop image'), blank=True, default=None)

    def __str__(self):
        return f'{self.title} - {self.id}'

    def thumbnail(self):
        return mark_safe(f'<img src="{self.image.url}" height="150"/>')

    class Meta:
        verbose_name = _('Shop')
        verbose_name_plural = _('Shops')
