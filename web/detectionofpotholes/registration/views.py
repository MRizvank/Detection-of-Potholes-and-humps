import datetime
from login.models import Login

from django.shortcuts import render
from django.http import HttpResponse
from registration.models import Registration
from registration.models import TrafficRegistration,EmergencysRegistration
from rest_framework.views import APIView
from rest_framework.response import Response
from.serializer import Registrationserializer
import datetime

# Create your views here.
def registration(request):
    if request.method == "POST":
        obj=Registration()
        obj.name=request.POST.get("ph")
        obj.address=request.POST.get("addr")
        obj.gender=request.POST.get("gen")
        obj.email=request.POST.get("mail")
        obj.date=request.POST.get("dat")
        obj.time=request.POST.get("tt")
        obj.save()
    return render(request,'registration/registration.html')
def traffic_registration(request):


    if request.method == "POST":
        ob=Login()
        ob.username=request.POST.get("user")
        ob.password=request.POST.get("pass")
        ob.type='traffic'
        ob.save()



        obj=TrafficRegistration()
        obj.lid=ob.id
        obj.control_room = request.POST.get("conr")
        obj.date = datetime.date.today()
        obj.time = request.POST.get("tt")
        obj.email = request.POST.get("email")
        obj.telephone_no = request.POST.get("ph")
        obj.location = request.POST.get("loc")
        obj.save()



    return render(request,'registration/trafficregistration.html')


def emergency_reg(request):
    if request.method == "POST":
        ob = Login()
        ob.username = request.POST.get("user")
        ob.password = request.POST.get("pass")
        ob.type = 'emergency'
        ob.save()

        obj= EmergencysRegistration()
        obj.lid=ob.id
        obj.service_name=request.POST.get("conr")
        obj.date=request.POST.get("dat")
        obj.time=request.POST.get("tt")
        obj.email=request.POST.get("email")
        obj.contact=request.POST.get("ct")
        obj.address=request.POST.get("addr")
        obj.save()
    return render(request,'registration/emrgncyserviceregistration.html')


class Postview(APIView):

    def get(self,request):
        s=Registration.objects.all()
        ser=Registrationserializer(s,many=True)
        return Response(ser.data)
    def post(self, request):


        ob=Login()
        ob.username=request.data["unm"]
        ob.password=request.data["pass"]
        ob.type="user"
        ob.save()

        obj = Registration()
        obj.lid = ob.id
        obj.name = request.data["name"]
        obj.address = request.data["add"]
        obj.email = request.data["email"]
        obj.date = datetime.date.today()
        obj.time= ""
        obj.phone = request.data["ph"]
        obj.save()


        return HttpResponse("ok")

