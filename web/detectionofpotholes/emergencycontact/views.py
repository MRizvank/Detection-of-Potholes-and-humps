from django.shortcuts import render
from django.http import HttpResponse
from emergencycontact.models import EmergencyContact
from rest_framework.views import APIView
from rest_framework.response import Response
from.serializer import Emergencycontactserializer
# Create your views here.
def postemergencycontact(request):
    if request.method == "POST":
        obj = EmergencyContact()
        obj.contact = request.POST.get("con")
        obj.name = request.POST.get("nm")
        obj.place = request.POST.get("pl")
        obj.save()

    return render(request,'emergencycontact/emergencyservicecntct.html')
def viewemergencycontact(request):
    objlist = EmergencyContact.objects.all()
    context={
        'objval':objlist,
    }
    return render(request,'emergencycontact/emergency contact out.html',context )




def postemergencycontact_ad(request):
    if request.method == "POST":
        obj = EmergencyContact()
        obj.contact = request.POST.get("con")
        obj.name = request.POST.get("nm")
        obj.place = request.POST.get("pl")
        obj.save()

    return render(request,'emergencycontact/emergency contact in.html')
class Emgview(APIView):
    def get(self,request):
        s=EmergencyContact.objects.all()
        ser=Emergencycontactserializer(s,many=True)
        return Response(ser.data)
