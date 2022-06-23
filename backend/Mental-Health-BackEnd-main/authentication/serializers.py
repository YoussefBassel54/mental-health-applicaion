from .models import User
from rest_framework import serializers,status
from rest_framework.validators import ValidationError
from django.contrib.auth.hashers import make_password
from phonenumber_field.serializerfields import PhoneNumberField
from datetime import datetime


class UserCreationSerializer(serializers.ModelSerializer):
    
    class Meta:
        model=User
        fields=['id','username', 'email', 'phone_number','password','Date_of_Birth','gender']

    def validate(self,attrs):

        email=User.objects.filter(username=attrs.get('username')).exists()
        if email:
            raise ValidationError(detail="User with email exists",code=status.HTTP_403_FORBIDDEN)

        username=User.objects.filter(username=attrs.get('username')).exists()
        if username:
            raise ValidationError(detail="User with username exists",code=status.HTTP_403_FORBIDDEN)

        return super().validate(attrs)


    def create(self,validated_data):

        new_user=User(**validated_data)
        new_user.password=make_password(validated_data.get('password'))
        new_user.save()

        return new_user

