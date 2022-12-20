from django.shortcuts import render
from django.http import HttpResponse
from potholedetails.models import PotholeDetailsid


# Create your views here.


def potholedetails(request):
    objlist = PotholeDetailsid.objects.all()
    context={
        'objval':objlist,
    }
    return render(request,'potholedetails/pothole details.html',context)


def emerpothole(request):
    objlist = PotholeDetailsid.objects.all()
    context={
        'objval':objlist,
    }
    return render(request,'potholedetails/emerpothole.html',context)


def trpothole(request):
    objlist = PotholeDetailsid.objects.all()
    context={
        'objval':objlist,
    }
    return render(request,'potholedetails/trpothole.html',context)




