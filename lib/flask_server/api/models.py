# api/models.py
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# Exemplo de modelo de dados
class Comando(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(100), nullable=False)
    descricao = db.Column(db.Text, nullable=True)

    def __repr__(self):
        return '<Comando {}>'.format(self.nome)
