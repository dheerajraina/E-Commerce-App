from rest_framework import serializers
from .models import Customer,Product,ShoppingCart

class CustomerSerializer(serializers.ModelSerializer):

    class Meta:
        model=Customer

        fields="__all__"

class ProductSerializer(serializers.ModelSerializer):

    class Meta:
        model=Product

        fields="__all__"

class ShoppingCartSerializer(serializers.ModelSerializer):

    class Meta:
        model=ShoppingCart

        fields="__all__"