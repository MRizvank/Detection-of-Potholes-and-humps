from django.conf.urls import url
from dangerousarea import views
urlpatterns=[
    url('^postdangerousarea/',views.postdangerousarea),
    url('^viewdangerousarea/',views.viewdangerousarea),
    url('^android/',views.Dangview.as_view()),
]