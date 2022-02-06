from django.shortcuts import render

# Create your views here.

from rest_framework.decorators import api_view
from rest_framework.response import Response

from .serializers import CustomerSerializer,ProductSerializer,ShoppingCartSerializer

from .models import Customer,Product,ShoppingCart



@api_view(['GET'])
def apiOverview(request):
    api_urls={
        'Customers':'/customers',
        'Add Customer':'add-customer/',
        'Customer Data':'customerData/<str:pk>/',
        'Products':'/products/',
        'Add Product':'add-product/',
        'Shopping Cart':'shopping-cart/',
        "Update Cart":'updateCart/<str:pk>/',
        # 'ToCart':'/add-to-cart/',
        # 'Cart':'/cart/'
    }

    return Response(api_urls)

@api_view(['GET'])
def customerList(request):

    customers=Customer.objects.all()

    serializer=CustomerSerializer(customers,many=True)

    return Response(serializer.data)

@api_view(['GET'])
def customerData(request,pk):

    customer=Customer.objects.get(userName=pk)

    serializer=CustomerSerializer(customer,many=False)

    return Response(serializer.data)



@api_view(['POST'])
def addCustomer(request):

    serializer1=CustomerSerializer(data=request.data)
    # print(request.data['userName'])
    print(request.data)
    # print("serializer1 =",serializer1)
    data={
        "customer":request.data['userName'],
        "cartItems":" "
        }
    print(data)
    serializer2=ShoppingCartSerializer(data=data)
    # print("serializer2=",serializer2)
    if serializer1.is_valid() and serializer2.is_valid():
        serializer1.save()
        serializer2.save()
        print('valid')
    else:
        print('not valid')
    # if serializer2.is_valid():
        
    #     print('valid cart')
    # else:
    #     print('not valid cart')
    return Response(serializer1.data)

@api_view(['GET'])
def productsList(request):

    products=Product.objects.all()
    serializer=ProductSerializer(products,many=True)

    return Response(serializer.data)


@api_view(['POST'])
def addProduct(request):

    serializer=ProductSerializer(data=request.data)

    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)

@api_view(['POST'])
def updateCart(request,pk):
    customer=ShoppingCart.objects.get(customer=pk)
    serializer=ShoppingCartSerializer(instance=customer,data=request.data)

    if serializer.is_valid():
        serializer.save()
        print('update done')
    return Response(serializer.data)
    
@api_view(['GET'])
def cartItems(request,pk):

    customer=ShoppingCart.objects.get(customer=pk)
    # customer=ShoppingCart.objects.all()
    serializer=ShoppingCartSerializer(customer,many=False)

    return Response(serializer.data)


# @api_view(['GET'])
# def carts(request):

#     carts=ShoppingCart.objects.all()
#     serializer=ShoppingCartSerializer()

#     serializer=ShoppingCartSerializer(customer,many=True)

#     return Response(serializer.data)


#     products=Product.objects.all()
#     serializer=ProductSerializer(products,many=True)

#     return Response(serializer.data)
