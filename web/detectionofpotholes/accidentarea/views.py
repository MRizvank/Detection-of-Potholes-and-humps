from django.shortcuts import render
from django.http import HttpResponse
from accidentarea.models import AccidentArea
from rest_framework.views import APIView
from rest_framework.response import Response
from.serializer import Accidentareaserializer
# Create your views here.
# def hello(request):
#     return HttpResponse("welcome")
def postaccdntarea(request):
    if request.method == "POST":
        obj = AccidentArea()
        obj.location = request.POST.get("loc")
        obj.details = request.POST.get("det")
        obj.save()

    return render(request,'accidentarea/accident area in.html')
def viewaccidentarea(request):
    objlist = AccidentArea.objects.all()
    context = {
        'objval': objlist,
    }
    return render(request,'accidentarea/accident area out.html',context)
class Accidentview(APIView):

    def get(self,request):
        s=AccidentArea.objects.all()
        ser=Accidentareaserializer(s,many=True)
        return Response(ser.data)

    def post(self,request):
        obj =AccidentArea()
        obj.location= request.data["loc"]
        obj.details = request.data["det"]
        obj.save()
        return HttpResponse("ok")
