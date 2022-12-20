from django.conf.urls import url
from potholedetails import views
urlpatterns=[
    url(r'^potholedetails/',views.potholedetails),
    url(r'emerpothole/',views.emerpothole),
    url(r'trpothole/',views.trpothole),
]