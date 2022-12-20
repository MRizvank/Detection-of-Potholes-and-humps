from django.db import models

# Create your models here.
class DetectionAlert(models.Model):
    alert = models.CharField(max_length=50)
    area = models.CharField(max_length=50)
    details = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'detection_alert'

