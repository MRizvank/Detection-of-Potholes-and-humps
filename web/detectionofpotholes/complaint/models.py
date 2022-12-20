from django.db import models

# Create your models here.
class Complaint(models.Model):
    user_id = models.IntegerField()
    replay = models.CharField(max_length=30)
    date = models.DateField()
    complaint = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'complaint'


class Trafficcomplaint(models.Model):
    traffic_id = models.IntegerField()
    complaint = models.CharField(max_length=100)
    user_id = models.IntegerField()
    reply = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'trafficcomplaint'