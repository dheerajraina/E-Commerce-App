from django.urls import path
from .import views

urlpatterns=[
    path('',views.apiOverview,name='api-overview'),

    path('customers/',views.customerList,name='customers-list'),

    path('add-customer/',views.addCustomer,name='add-customer'),

    path('customerData/<str:pk>/',views.customerData,name='add-customer'),

    path('shopping-cart/<str:pk>/',views.cartItems,name="Shopping Cart"),
    # path('shopping-cart/<str:pk',views.cartItems,name="Shopping Cart"),

    path('updateCart/<str:pk>/',views.updateCart,name="Shopping Cart update"),

    path('products/',views.productsList,name='products-list'),

    path('add-product/',views.addProduct,name='add-product'),
]