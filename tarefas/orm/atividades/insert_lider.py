from core.models import Projeto
projeto = Projeto.objects.get(nome="Projeto A")
projeto.lider = "Maria"
projeto.save()
print("Líder atualizado:", projeto.lider)
