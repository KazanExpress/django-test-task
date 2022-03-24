from tkinter.messagebox import NO
from django.db import models

# Create your models here.
class Shop(models.Model):
    id = models.PositiveIntegerField(primary_key=True)
    title = models.CharField(max_length=30)
    desc = models.CharField(max_length=100)
    image = models.ImageField(upload_to='uploads/images/Shop',null=False,blank=False)

    def __str__(self):
        return self.title

class ParentCategory(models.Model):
    id = models.PositiveIntegerField(primary_key=True)
    title = models.CharField(max_length=40)

    def __str__(self):
        return self.title

    
class Category(models.Model):
    id = models.PositiveIntegerField(primary_key=True)
    title = models.CharField(max_length=40)
    shop = models.ForeignKey(Shop,on_delete=models.CASCADE)
    desc = models.CharField(max_length=50)
    parent = models.ManyToManyField(ParentCategory,null = False)

    def __str__(self):
        return self.title


class Product(models.Model):
    id = models.PositiveIntegerField(primary_key=True)
    desc = models.CharField(max_length=100)
    title = models.CharField(max_length=30)
    amount = models.IntegerField(default=0)
    pricee = models.FloatField()
    shop = models.ForeignKey(Shop,on_delete=models.CASCADE,null=True)
    category = models.ManyToManyField(Category,null=True)
    image = models.ImageField(upload_to='uploads/images/Product',null =False,blank=False)
    active = models.BooleanField(default=False)

    def __str__(self):
        return self.title


