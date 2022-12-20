from rest_framework import serializers
from .models import Login
class Loginserializer(serializers.ModelSerializer):
    class Meta:
        model=Login
        fields='__all__'