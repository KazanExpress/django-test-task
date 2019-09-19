# KazanExpress test for Python developer Solution
Here lies the solution to the test task for Python/Django Developer position applicants.

## Task goal
The goal of this test task is to develop a simple Django admin panel which purpose is to manage the content for an online store and to have multi-role support. 

## DB schema
![Class diagram](https://i.imgur.com/RMGTq9h.png)

## Prerequisites
1. Docker
## Launching the project
1. Clone the repository
2. `docker-compose up --build`
3. The admin panel will be at http://127.0.0.1:8080/admin/
4. Log in
    -  There are three users in the database: admin, director and manager.
    - Admin: 
      - Can do everything, including changing logs and sessions.
      - Login: admin
      - Password: admin
    - Director:
      - Can do everything related to the system itself (including adding and deleting new users).
      - Login: director
      - Password: director
    - Manager: 
      - Can only moderate products.
      - Login: manager
      - Password: manager
      
(for convenience of the checker, the test database (created by me) is restored on first `docker-compose up` call)

## Packages used
1. Django
2. Django-Jet
3. Pillow (for ImageField)
4. Psycopg2
5. PostgreSQL (Database, in separate container)
