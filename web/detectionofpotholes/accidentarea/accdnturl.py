from django.conf.urls import url
from accidentarea import views
urlpatterns =[
    url('^postaccdtarea/',views.postaccdntarea),
    url('^viewaccidentarea/',views.viewaccidentarea),
    url('^android/',views.Accidentview.as_view())

]
