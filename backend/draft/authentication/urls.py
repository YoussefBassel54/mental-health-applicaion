from django.urls import path
from . import views

urlpatterns = [
    path('sign-up/',views.UserSerializer.as_view()),
    path('login/',views.MyTokenObtainPairView.as_view()),
]