from core.models import Projeto, Atividade

# Buscar projeto
projeto = Projeto.objects.get(nome="Projeto A")

# Inserir nova atividade
atividade = Atividade.objects.create(
    descricao="Nova Atividade Django",
    status="pendente",
    projeto=projeto
)
print("Atividade criada:", atividade)
