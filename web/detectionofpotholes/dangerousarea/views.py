from django.shortcuts import render
from django.http import  HttpResponse
from dangerousarea.models import DangerousArea
from rest_framework.views import APIView
from rest_framework.response import Response
from.serializer import Dangerousareaserializer
# Create your views here.
def postdangerousarea(request):
    if request.method == "POST":
        obj = DangerousArea()
        obj.location = request.POST.get("NM")
        obj.details = request.POST.get("det")
        obj.save()
    return render(request,'dangerousarea/dangerous area in.html')
def viewdangerousarea(request):
    objlist=DangerousArea.objects.all()
    context={
        'objval':objlist,
    }
    return render(request,'dangerousarea/trafficdangerous.html',context)
class Dangview(APIView):

    def get(self,request):
        s=DangerousArea.objects.all()
        ser=Dangerousareaserializer(s,many=True)
        return Response(ser.data)
