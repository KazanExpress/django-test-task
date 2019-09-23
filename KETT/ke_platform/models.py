from typing import Dict

from django.db.models import Model, CharField, TextField, IntegerField, FloatField, BooleanField, ImageField, \
    ManyToManyField, ForeignKey, CASCADE
from django.utils.safestring import mark_safe, SafeText


class Shop(Model):
    """

    """
    title = CharField(max_length=126)
    description = TextField(validators=())
    image = ImageField(upload_to='shop_images/', null=True, blank=True, default=None)

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
    categories = ManyToManyField(to='Category', related_name='products',
                                 related_query_name='product', symmetrical=False, )

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
    product_ref = ForeignKey(to='Product', related_name='images', related_query_name='image', on_delete=CASCADE)
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

    def dfs_paths(self, origin: 'Category'):
        """
        Deep-first search over `CATEGORIES_GRAPH`...
        Generator-like method...
        :param origin: Starting Category-node
        :return: 
        """
        stack = [(origin, [origin])]
        while stack:
            (vertex, path) = stack.pop()
            sa = set(CATEGORIES_GRAPH[vertex]['parents'])
            new_ss = sa - set(path)
            for next in new_ss:
                if not next.parent_category.all():
                    yield path + [next]
                else:
                    stack.append((next, path + [next]))

    def get_paths(self) -> SafeText:
        """
        Iterates (DFS) over categories to extract the full hierarchy for the current category...
        :return: Stringified version of the extracted paths...
        """
        self._refresh_graph()

        paths_data = list(self.dfs_paths(self))
        paths = ['.'.join(ss.title for ss in path_data) for path_data in paths_data]
        return mark_safe(f'<br>'.join(paths))

    def _refresh_graph(self) -> None:
        """
        Refreshes `CATEGORIES_GRAPH`, iterating over all the objects...
        :return: Nothing...
        """
        global CATEGORIES_GRAPH
        CATEGORIES_GRAPH = {}

        for cat in Category.objects.all():
            CATEGORIES_GRAPH[cat] = cat.as_dict

    class Meta:
        db_table = 'categories'
        verbose_name = "Category"
        verbose_name_plural = "Categories"
