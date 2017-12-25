import json
from django.shortcuts import render
from app.parser import get_debt_by_latlng
# Create your views here.
def index(request):
    context = json.dumps(get_debt_by_latlng())
    return render(request, 'index.html', {'debts': context})