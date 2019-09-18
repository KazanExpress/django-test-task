# Setup 
To setup database - there is the psql.yml file for docker-compose within psql.env for environement variables

All necessary libraries are in 'requirements.txt'

Do not forget to run:

python manage.py collectstatic
python manage.py migrate

# Shop administration

All shops are listed in /admin/shops/shop/, there are possibility to search through the shops by title in the search box above list.

Administrator is able to set an ID of shop during adding, but is not able to do it during shop editing. Also there is a possibility to upload file for shop as image thumbnail which is displayed on editing page.

# Product administration 

All products are listed in /admin/products/product, you can search products by ID or title, order them by clicking price or amount columns. Also there is a filter by range of price. On edit page you are able to fix all information except ID. You can assign or unset categories to a product by clicking ‘control’ button (butterfly button on MacBook) in correspondent field. You can add many images of product.

# Category administration 

Categories are listed in /admin/products/category, you can search categories by title and product id in search box and by parent categories in filter window with dropdown list. On edit page all possible paths to the category are listed.

# Management 

Management things can be implemented using default Django tool such as groups. You can assign rights to group and during user creating assign groups to the user. 

For product moderator rights should be:

Add/Delete/Change/View products and products’ images and View on categories

For all page moderator they are:

Add/Delete/Change/View on Shops, Products, Categories, Products’ 



TODO: Forgot to add Product -> Shop dependency 
