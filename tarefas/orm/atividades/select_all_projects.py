from core.models import Projeto
for projeto in Projeto.objects.all():
    print(f"\nProjeto: {projeto.nome} (Líder: {projeto.lider})")
    for atividade in projeto.atividades.all():
        print(f"  - {atividade.descricao} ({atividade.status})")
