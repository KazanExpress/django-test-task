from math import prod
from django.http import HttpResponse
from django.shortcuts import redirect, render,HttpResponse
from ecom.forms import CategoryRegistration, CategoryUpdate, ParentCategoryRegistration, ProductRegistration, ShopRegistration, ShopUpdate, ProductUpdate,NewUserForm
from ecom.models import Category, ParentCategory, Product, Shop
from django.contrib.auth import login
from django.contrib import messages
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import login, authenticate
from django.contrib.auth import login, authenticate, logout
# Create your views here.

def register_request(request):
	if request.method == "POST":
		form = NewUserForm(request.POST)
		if form.is_valid():
			user = form.save()
			login(request, user)
			messages.success(request, "Registration successful." )
			return redirect("/")
		messages.error(request, "Unsuccessful registration. Invalid information.")
	form = NewUserForm()
	return render (request=request, template_name="ecom/register.html", context={"register_form":form})

def login_request(request):
	if request.method == "POST":
		form = AuthenticationForm(request, data=request.POST)
		if form.is_valid():
			username = form.cleaned_data.get('username')
			password = form.cleaned_data.get('password')
			user = authenticate(username=username, password=password)
			if user is not None:
				login(request, user)
				messages.info(request, f"You are now logged in as {username}.")
				return redirect("/")
			else:
				messages.error(request,"Invalid username or password.")
		else:
			messages.error(request,"Invalid username or password.")
	form = AuthenticationForm()
	return render(request=request, template_name="ecom/login.html", context={"login_form":form})

def logout_request(request):
	logout(request)
	messages.info(request, "You have successfully logged out.") 
	return redirect("/")



def ecom(request):
    if 'q' in request.GET:
        q = request.GET['q']       
        shop = Shop.objects.filter(title__icontains=q)
        category = Category.objects.filter(title__icontains=q)
        products = Product.objects.filter(title__icontains=q)

    else:
        shop = Shop.objects.all()
        products = Product.objects.all()
        category = Category.objects.all()
    
    context = {'shop':shop,'products':products,'category':category}

    return render(request,'ecom/ecom.html',context)

def product(request):
    
    if 'q' in request.GET:
        q = request.GET['q']
        products = Product.objects.filter(title__icontains=q) or Product.objects.filter(id__icontains=q)
    
    else:
        products = Product.objects.order_by("pricee")

    context = {'products':products}

    return render(request,'ecom/products.html',context)

def category(request):
    if 'q' in request.GET:
        q = request.GET['q']
        category = Category.objects.filter(title__icontains=q) or ParentCategory.objects.filter(title__icontains=q)
        

    else:
        category = Category.objects.all() 
        
    
    
    context = {'category':category}
    return render(request,'ecom/category.html',context)


def addShop(request):

    if request.method == 'POST':
        form = ShopRegistration(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/') 
    else:
        form = ShopRegistration()
    context = {'form':form}
    return render(request, 'ecom/addshop.html', context)


def addproduct(request):
    if request.method == 'POST':
        form = ProductRegistration(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('product') 
    else:
        form = ProductRegistration()
    context = {'form':form}
    return render(request, 'ecom/addshop.html', context)

def addcategory(request):

    if request.method == 'POST':
        form = CategoryRegistration(request.POST)
        if form.is_valid():
            form.save()
            return redirect('category') 
    else:
        form = CategoryRegistration()
    context = {'form':form}
    return render(request, 'ecom/addcategory.html', context)



def addparentcategory(request):

    if request.method == 'POST':
        form = ParentCategoryRegistration(request.POST)
        if form.is_valid():
            form.save()
            return redirect('category') 
    else:
        form = ParentCategoryRegistration()
    context = {'form':form}
    return render(request, 'ecom/addparentcategory.html', context)



def success(request):
    return HttpResponse('successfully uploaded') 

    
def editShop(request,id):
    if request.method=='POST':
        pi = Shop.objects.get(pk=id)
        form = ShopUpdate(request.POST,request.FILES,instance=pi)
        if form.is_valid():
            form.save()
            return redirect('/')
    else:
        pi = Shop.objects.get(pk=id)
        form = ShopUpdate(instance=pi)   
    context = {'form':form,'id':id}
    return render(request,'ecom/editShop.html',context)


def editproduct(request,id):
    if request.method=='POST':
        pi = Product.objects.get(pk=id)

        form = ProductUpdate(request.POST,request.FILES,instance=pi)
        if form.is_valid():
            form.save()
            return redirect('product')
    else:
        pi = Product.objects.get(pk=id)
        form = ProductUpdate(instance=pi)   
    context = {'form':form,'id':id,'img':pi}
    return render(request,'ecom/editProduct.html',context)

def editcategory(request,id):
    if request.method=='POST':
        pi = Category.objects.get(pk=id)

        form = CategoryUpdate(request.POST,instance=pi)
        if form.is_valid():
            form.save()
            return redirect('category')
    else:
        pi = Category.objects.get(pk=id)
        form = CategoryUpdate(instance=pi)   
    context = {'form':form,'id':id}
    return render(request,'ecom/editcategory.html',context)


def activeProduct(request):
    products = Product.objects.filter(active=True)
    return render(request,'ecom/activeProduct.html',{'products':products})

def nonactiveProduct(request):
    products = Product.objects.filter(active=False)
    return render(request,'ecom/nonactiveProduct.html',{'products':products})