from django.db import models

# Create your models here.
class Registration(models.Model):
    name = models.CharField(max_length=20)
    address = models.CharField(max_length=50)
    email = models.CharField(max_length=25)
    date = models.DateField()
    time = models.CharField(max_length=20)
    phone = models.CharField(max_length=20)
    lid = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'registration'


class EmergencysRegistration(models.Model):
    service_name = models.CharField(max_length=60)
    contact = models.CharField(max_length=25)
    email = models.CharField(max_length=50)
    address = models.CharField(max_length=100)
    date = models.DateField()
    time = models.TimeField()
    lid = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'emergencys_registration'




class TrafficRegistration(models.Model):
    control_room = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    telephone_no = models.CharField(max_length=25)
    location = models.CharField(max_length=100)
    date = models.DateField()
    time = models.TimeField()
    lid = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'traffic_registration'


