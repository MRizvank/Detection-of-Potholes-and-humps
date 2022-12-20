from django.conf.urls import url
from potholealert import views
urlpatterns=[
    url('^potholealert/',views.potholealert),
    url('^andriod/',views.Poholeview.as_view()),

]