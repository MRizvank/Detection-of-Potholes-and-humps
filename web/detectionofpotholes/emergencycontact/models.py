from django.db import models

# Create your models here.
class EmergencyContact(models.Model):
    e_id = models.AutoField(primary_key=True)
    contact = models.CharField(max_length=15)
    name = models.CharField(max_length=20)
    place = models.CharField(max_length=25)

    class Meta:
        managed = False
        db_table = 'emergency_contact'
