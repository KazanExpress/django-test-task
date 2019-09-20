# KazanExpress test for Python developer 
Here lies the solution to the test task for Python/Django Developer position applicants.

## Task goal
The goal of this test task is to develop a simple Django admin panel which purpose is to manage the content for an online store and to have multi-role support. 

## Domain description
The following image represents the class diagram that should be considered during development of your admin panel. This is the minimal requirements for classes and fields that we are expecting from you to add. You can make your own updates and add additional functional. All images fields should be represented as links on images. You are free to use any database, which seems suitable for you and for the project. 

![Class diagram](https://hb.bizmrg.com/kazanexpress/class_diagram.png)
## Requirements
<ul>
<li>
python>=3.6
</li>
<li>
Django 2.2
</li>
<li>
Pillow
</li>
<li>
django-admin-numeric-filter
</li>
</ul>

### How to run
```shell script
pip install virtualenv
virtualenv env
/env/Scripts/activate
pip install -r requirements.txt
python manage.py makemigrations
python manage.py migrate
python manage.py loaddata auth
pyhton manage.py runsever 
```

### Useful information
<a href="http://localhost:8000/admin">Admin site</a>
<pre>
<strong>
login: admin
password: demoadmin
</strong>
</pre>

