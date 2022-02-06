from django.db import models

# Create your models here.

from django.contrib.auth.models import User




    

    
    # @property
    # def createCart(user,cart=''):
    #     print ()
    #     customer=user
    #     cartItems=cart

    # @property
    # def addToCart(updatedCart):
    #     cartItems=updatedCart



# Table for customer data i.e fields that need to be stored
class Customer(models.Model):
    

    # CASCADE delete all the other data in all the other tables depending 
    # on this data
    # user=models.OneToOneField(User,null=True,blank=True, on_delete=models.CASCADE) 

    email=models.CharField(max_length=200)
    userName=models.CharField(max_length=100,primary_key=True,default=email)

    password=models.CharField(max_length=100,null=False,default=userName)
    name=models.CharField(max_length=200,null=True)

    
    # ob1=ShoppingCart()
    # ob1.createCart(userName)


    def __str__(self):

        return self.name



class Product(models.Model):

    name=models.CharField(max_length=200)
    price= models.FloatField()
    image=models.URLField()


    def __str__(self):
        return self.name


class ShoppingCart(models.Model):
    customer=models.CharField(max_length=100,primary_key=True,default='')
    cartItems=models.CharField(max_length=10000,default='',null=True,blank=True)

    def __str__(self):
        return self.customer