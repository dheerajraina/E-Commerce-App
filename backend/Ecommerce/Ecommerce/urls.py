"""Ecommerce URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include

urlpatterns = [
    path('admin/', admin.site.urls),

    path('',include('store.urls')),

    
]



# {
# "name":"Nike Airmax",
#     "price":5000,
#     "image":"https://image.shutterstock.com/image-photo/white-nike-air-max-2017-260nw-1407241322.jpg"
# }


# {
# "email":"dheerajraina@gmail.com",
# "userName":"Dheeraj",
#     "password":"Rainadheeraj55",
#     "name":"Dheeraj Raina"
# }


# {
# "customer":"D",
# "cartItems" : "[id:,id:2]"
# }