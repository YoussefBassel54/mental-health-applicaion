from django.db import models
from django.contrib.auth.base_user import BaseUserManager
from django.contrib.auth.models import AbstractUser
from phonenumber_field.modelfields import PhoneNumberField
from datetime import datetime

class CustomUserManager(BaseUserManager):
    def create_user(self,email,password,**extra_fields):

        if not email:
            raise ValueError(('Please enter an email address'))

        email=self.normalize_email(email)
        new_user=self.model(email=email,**extra_fields)
        new_user.set_password(password)
        new_user.save()

        return new_user


    def create_superuser(self,email,password,**extra_fields):

        extra_fields.setdefault('is_superuser',True)
        extra_fields.setdefault('is_staff',True)
        extra_fields.setdefault('is_active',True)

        if extra_fields.get('is_superuser') is not True:
            raise ValueError(('Superuser must have is_superuser=True'))

        if extra_fields.get('is_staff') is not True:
            raise ValueError(('Superuser must have is_staff=True'))


        return self.create_user(email,password,**extra_fields)


class User(AbstractUser):

    GENDER_CHOICES = (('M', 'Male'),('F', 'Female'))

    username=models.CharField(('Username'), max_length=40,unique=True)
    email=models.CharField(('Email'), max_length=80,unique=True)
    phone_number=PhoneNumberField(unique=True,null=False,blank=False)
    date_joined=models.DateTimeField(('Date'),auto_now_add=True)
    Date_of_Birth = models.DateField(default=datetime.now())
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES)

    REQUIRED_FIELDS=['username']
    USERNAME_FIELD='email'

    def __str__(self):
        return f"{self.username}"
