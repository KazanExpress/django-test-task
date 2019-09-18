# Generated by Django 2.2.5 on 2019-09-17 18:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0002_category_parent_category'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='parent_category',
            field=models.ManyToManyField(blank=True, default=None, null=True, related_name='_category_parent_category_+', to='products.Category', verbose_name='Parent categories'),
        ),
    ]
