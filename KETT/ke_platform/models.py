from typing import Dict

from django.db.models import Model, CharField, TextField, IntegerField, FloatField, BooleanField, ImageField, \
    ManyToManyField, ForeignKey, CASCADE, SET_NULL
from django.utils.safestring import mark_safe, SafeText


class Shop(Model):
    """

    """
    title = CharField(max_length=126)
    description = TextField(validators=())
    image = ImageField(upload_to='shop_images/', null=True, blank=True, default=None)
    product = ForeignKey(to='Product', on_delete=SET_NULL, related_name='shops', related_query_name='shop',
                         null=True, blank=True)

    class Meta:
        db_table = 'shops'
        verbose_name = 'Shop'

    def __str__(self):
        return self.title


class Product(Model):
    """

    """
    title = CharField(max_length=126)
    description = TextField(validators=())
    amount = IntegerField(default=0)
    price = FloatField(default=0.0)
    orders_num = IntegerField(default=0)
    active = BooleanField()
    categories = ManyToManyField(to='Category', related_name='products', related_query_name='product',
                                 symmetrical=False)

    def __str__(self):
        return self.title

    class Meta:
        db_table = 'products'
        verbose_name = "Product"
        verbose_name_plural = "Products"


class ProductImage(Model):
    """
    For Many-to-One Product-Images support...
    """
    product_ref = ForeignKey(to='Product', on_delete=CASCADE, related_name='images', related_query_name='image')
    image = ImageField(null=True, blank=True, upload_to='product_imgs')


# For constant paths retrieval...
# TODO: Use Memcached or Redis instead, while updating the graph upon changes in either ORM or DB...
CATEGORIES_GRAPH = {}


class Category(Model):
    """

    """
    title = CharField(max_length=126)
    description = TextField()
    parent_category = ManyToManyField(to='self', blank=True, related_name='children', related_query_name='child',
                                      symmetrical=False, verbose_name='Parent Categories')

    def __str__(self):
        return self.title

    @property
    def as_dict(self) -> Dict:
        return {
            'title': self.title,
            'description': self.description,
            'parents': self.parent_category.all()
        }

    def _get_paths_dfs(self, origin: 'Category'):
        """
        Depth-First Search over `CATEGORIES_GRAPH`...
        Generator-like method...
        :param origin: Starting Category-node
        :return: 
        """
        stack = [(origin, [origin])]
        while stack:
            (vertex, path) = stack.pop()
            for next in set(CATEGORIES_GRAPH[vertex]['parents']) - set(path):
                if not next.parent_category.all():
                    yield path + [next]
                else:
                    stack.append((next, path + [next]))

    def get_paths(self) -> SafeText:
        """
        Iterates (DFS) over categories to extract the full hierarchy for the current category...
        :return: Stringified version of the extracted paths...
        """
        def _refresh_graph() -> None:
            """
            Refreshes `CATEGORIES_GRAPH`, iterating over all the objects...
            :return: Nothing...
            """
            global CATEGORIES_GRAPH
            CATEGORIES_GRAPH = {}

            for cat in Category.objects.all():
                CATEGORIES_GRAPH[cat] = cat.as_dict
        _refresh_graph()

        paths_data = list(self._get_paths_dfs(self))
        paths = ['.'.join(category.title for category in categories) for categories in paths_data]

        return mark_safe(f"<br>".join(paths))
    get_paths.short_description = "Full Paths"

    class Meta:
        db_table = 'categories'
        verbose_name = "Category"
        verbose_name_plural = "Categories"
