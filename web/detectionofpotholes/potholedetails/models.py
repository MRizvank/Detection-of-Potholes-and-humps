from django.db import models

# Create your models here.
class PotholeDetailsid(models.Model):
    area = models.CharField(max_length=25)
    details = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'pothole_detailsid'
