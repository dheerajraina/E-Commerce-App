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
# "email":"dheerajraina@gmail.com",
# "userName":"Dheeraj",
#     "password":"Rainadheeraj55",
#     "name":"Dheeraj Raina"
# }


# {
# "customer":"D",
# "cartItems" : "[id:,id:2]"
# }



# https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvLI6DpKAPblGqxG0KRsXeBUpCsaIzs1r1Iw&usqp=CAU


# {
# "name":"Bose QuietComfort ",
#     "price":300,
#     "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvLI6DpKAPblGqxG0KRsXeBUpCsaIzs1r1Iw&usqp=CAU"
# }


# https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-pro-family-hero?wid=940&hei=1112&fmt=png-alpha&.v=1631220221000


# {
# "name":"Apple Iphone 13 Pro",
#     "price":1500,
#     "image":"https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-pro-family-hero?wid=940&hei=1112&fmt=png-alpha&.v=1631220221000"
# }

# https://m.media-amazon.com/images/I/71an9eiBxpL._SL1500_.jpg



# {
# "name":"Apple Macbook Pro 2020",
#     "price":1900,
#     "image":"https://m.media-amazon.com/images/I/71an9eiBxpL._SL1500_.jpg"
# }