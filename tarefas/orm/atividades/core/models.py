from django.db import models

class Projeto(models.Model):
    nome = models.CharField(max_length=50, unique=True)
    lider = models.CharField(max_length=100)

    def __str__(self):
        return self.nome

class Atividade(models.Model):
    descricao = models.CharField(max_length=250)
    status = models.CharField(max_length=50)
    projeto = models.ForeignKey(Projeto, on_delete=models.CASCADE, related_name='atividades')

    def __str__(self):
        return f"{self.descricao} ({self.status})"
