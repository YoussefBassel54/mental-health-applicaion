from django.urls import path,include
from doctors import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('booking', views.book_session)

# router.register('mood', viewsets_mood,basename='Mood')

urlpatterns = [
    path('doctorslist/', views.FBV_List),
    path('docindv/<int:pk>', views.doc_indv),
    path('usersession/user/', views.sessions),
    path('history/user/', views.Historysessions),
    path('booksession/', include(router.urls))
]