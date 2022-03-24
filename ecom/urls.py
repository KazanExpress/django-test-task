from django import views
from django.urls import path
from ecom.views import addShop, addparentcategory, category, ecom, editShop, editproduct, product,success,activeProduct,nonactiveProduct,editcategory,addcategory,register_request,login_request,logout_request,addproduct

urlpatterns = [
    path('',ecom,name='ecom'),
    path('product',product,name='product'),
    path('addproduct',addproduct,name='addproduct'),
    path('register',register_request,name='register'),
    path('login',login_request,name='login'),
    path("logout", logout_request, name= "logout"),
    path('activeProduct',activeProduct,name='activeproduct'),
    path('nonactiveProduct',nonactiveProduct,name='nonactiveProduct'),
    path('category',category,name='category'),
    path('addshop/',addShop,name='addshop'),
    path('addcategory/',addcategory,name='addcategory'),
    path('addparentcategory/',addparentcategory,name='addparentcategory'),
    path('success', success, name = 'success'),
    path('editshop/<int:id>',editShop,name='editshop'),
    path('editproduct/<int:id>',editproduct,name='editproduct'),
    path('editcategory/<int:id>',editcategory,name='editcategory')

]
