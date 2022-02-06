# Generated by Django 4.0 on 2022-02-06 12:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0004_shoppingcart'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='shoppingcart',
            name='id',
        ),
        migrations.AlterField(
            model_name='shoppingcart',
            name='customer',
            field=models.CharField(default='', max_length=100, primary_key=True, serialize=False),
        ),
    ]