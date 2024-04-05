from .views import*
from rest_framework.routers import DefaultRouter
from django.urls import path
router = DefaultRouter()
router.register(r'categorias-do-serviço', C_servicoView)
router.register(r'produtos', ProdutoView)
router.register(r'produtos-comprados', CompradosView)
router.register(r'custom-user', CustomUserView)
router.register(r'automovel', AutomovelView)
router.register(r'manuteção', ManutencaoView)
router.register(r'pagamento', PagamentoView)
router.register(r'reserva', ReservaView)

urlpatterns = router.urls