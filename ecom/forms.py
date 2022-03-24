from dataclasses import fields
from statistics import mode
from django import forms
from .models import Category, ParentCategory, Product, Shop
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

class NewUserForm(UserCreationForm):
	email = forms.EmailField(required=True)

	class Meta:
		model = User
		fields = ("username", "email", "password1", "password2")

	def save(self, commit=True):
		user = super(NewUserForm, self).save(commit=False)
		user.email = self.cleaned_data['email']
		if commit:
			user.save()
		return user


class ShopRegistration(forms.ModelForm):
    class Meta:
        model = Shop
        fields = "__all__"

class CategoryRegistration(forms.ModelForm):
    class Meta:
        model = Category
        fields = "__all__"

class ProductRegistration(forms.ModelForm):
    class Meta:
        model = Product
        fields = "__all__"

class ParentCategoryRegistration(forms.ModelForm):
    class Meta:
        model = ParentCategory
        fields = "__all__"

class ShopUpdate(forms.ModelForm):
    class Meta:
        model = Shop
        exclude = ['id']
    
class ProductUpdate(forms.ModelForm):
    class Meta:
        model = Product
        exclude = ['id']

class CategoryUpdate(forms.ModelForm):
    class Meta:
        model = Category
        fields = '__all__'



    

