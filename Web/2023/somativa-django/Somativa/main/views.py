
from .models import *
from .serializers import *

from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
from rest_framework.views import APIView

from restfw_composed_permissions.base import BaseComposedPermission
from rest_framework.permissions import IsAuthenticatedOrReadOnly, IsAuthenticated, DjangoModelPermissionsOrAnonReadOnly, SAFE_METHODS

from datetime import datetime
from rest_framework import filters
from django_filters.rest_framework import DjangoFilterBackend
from .customFilters import*

def strToDate(strDate):
   return  datetime.strftime(strDate, '%d-%m-%y').date()

class CustomView(ModelViewSet):
    def create(self, request, *args, **kwargs):
     meuSerializer =  self.get_serializer(data=request.data, many=isinstance(request.data, list))
     meuSerializer.is_valid(raise_exception=True)
     self.perform_create(meuSerializer)
     headers = self.get_success_headers(meuSerializer.data)
     return Response(meuSerializer.data, status=201,headers=headers)
    

#thiago durante a aula, me mostrou essa biblioteca e me mostrou como usar

class UserApenasLer(BaseComposedPermission):
   def has_permissions(self, request, view):
      if request.user.is_authenticated:
         return request.method in SAFE_METHODS
      return False
   def has_object_permissions(self, request,view, obj):
      if request.user.is_superuser:
         return True
      return False
   
class AutorEAdminOuApenasLer(BaseComposedPermission):   
   def has_permissions(self, request, view):
      if request.user.is_authenticated:
         return request.method in SAFE_METHODS
      return False

   def has_object_permissions(self, request,view, obj):
      if request.user.is_superuser:
         return True
      if obj.userFk.user == request.user.id:
         return True
      return False
      
class AdminOuApenasLer(BaseComposedPermission):
   def has_permissions(self, request, view):
         return request.method in SAFE_METHODS
   def has_object_permissions(self, request,view, obj):
      if obj.userFk.classificacao == "A":
         return True
      return False
   
class C_servicoView(CustomView):
    queryset = C_servico.objects.all()
    serializer_class = C_servicoSerializer
    permission_classes = (DjangoModelPermissionsOrAnonReadOnly,)
    filter_backends = [DjangoFilterBackend, filters.OrderingFilter]
    filterset_class = C_servicoFilter
    ordering_fields = '__all__'

class ProdutoView(ModelViewSet):
   queryset = Produto.objects.all()
   serializer_class = ProdutoSerializer
   permission_classes = (DjangoModelPermissionsOrAnonReadOnly,)
   filter_backends = [DjangoFilterBackend, filters.OrderingFilter]
   filterset_class = ProdutoFilter
   ordering_fields = '__all__'


class CompradosView(CustomView):
   queryset = Produtos_comprados.objects.all()
   serializer_class = Produtos_compradosSerializer
   permission_classes = (AutorEAdminOuApenasLer,)
   filter_backends = [DjangoFilterBackend, filters.OrderingFilter]
   filterset_class = CompradoFilter
   ordering_fields = '__all__'

class CustomUserView(ModelViewSet):
   queryset = CustomUser.objects.all()
   serializer_class = CustomUserSerializer
   filter_backends = [DjangoFilterBackend, filters.OrderingFilter]
   filterset_class = CustomUserFilter
   ordering_fields = '__all__'

class AutomovelView(CustomView):
   queryset = Automovel.objects.all()
   serializer_class = AutomovelSerializer
   permission_classes = (AutorEAdminOuApenasLer,)
   filter_backends = [DjangoFilterBackend, filters.OrderingFilter]
   filterset_class = AutomovelFilter
   ordering_fields = '__all__'


class ManutencaoView(CustomView):
   queryset = Manutencao.objects.all()
   serializer_class = ManutencaoSerializer
   permission_classes = (AutorEAdminOuApenasLer,)
   filter_backends = [DjangoFilterBackend]
   filterset_class = ManutencaoFilter


class PagamentoView(ModelViewSet):
   queryset = Pagamento.objects.all()
   serializer_class = PagamentoSerializer
   permission_classes = (IsAuthenticated,)
   filter_backends = [DjangoFilterBackend]
   filterset_class = PagamentoFilter

   def get_queryset(self):
      user = self.request.user
      queryset = None
      if user.is_superuser:
         queryset = Pagamento.objects.all()
      else:
         queryset = Pagamento.objects.filter(manutencaoFk__CustomFK__user__username = user.username)
      return queryset
   

class DisponibilidaView(ModelViewSet):
   queryset = Disponibilidade.objects.all()
   serializer_class = DisponibilidadeSerializer
   permission_classes = (AdminOuApenasLer,)
   filter_backends = [DjangoFilterBackend]
   filterset_class = DisponibilidadeFilter

class ReservaView(CustomView):
   queryset = Reserva.objects.all()
   serializer_class = ReservaSerializer
   filter_backends = [DjangoFilterBackend, filters.OrderingFilter]
   permission_classes = (IsAuthenticatedOrReadOnly,)
   filterset_class = ReservaFilter
   ordering_fields = '__all__'

   def create(self, request, *args, **kwargs):
      data = request.data
      disponibilidades = []
      data_reserva = strToDate(data['dia_reserva'])

      availability = Disponibilidade.objects.filter(manutencaoFK=data['manutencaoFK']).filter(data = data_reserva).filter(disponibilidadeFK_Disponivel = 'I').first()
      if availability == 'I':
            Response(status=409, data='A data escolhida ' + data['dia_reserva'] + "está indisponivel")
      disponibilidades.append(availability)

      SalvandoReservaResponse = super(ReservaView, self).create(request, *args, **kwargs)

      if SalvandoReservaResponse.status_code == 201:
         salvarReserva =  Reserva.objects.filter(id=SalvandoReservaResponse.data['id']).update(disponibilidadeFK_Disponivel = 'I')
         for availability in disponibilidades:
            availability.disponibilidadeFK = salvarReserva
            availability.save()
            return Response(status=201, data=SalvandoReservaResponse.data)
      else: 
         return Response(status=500, data = 'Erro ao salvar reserva')
      
