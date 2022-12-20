from django.conf.urls import url
from detectionalert import views
urlpatterns =[
    url('^postdetectionalert/',views.postdetectionalert),
    url('^android/',views.Alertview.as_view()),
]