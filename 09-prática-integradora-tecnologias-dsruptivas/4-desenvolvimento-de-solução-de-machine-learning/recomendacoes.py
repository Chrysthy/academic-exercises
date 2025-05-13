# importando bibliotecas
import pandas as pd
import numpy as np
from sklearn.metrics.pairwise import cosine_similarity

#Função para calcular recomendações com base no histórico do usuário
def recomendar_filmes(usuario_id, interacoes_usuario, filmes, num_recomendacoes=5):
    interacoes_usuario_especifico = interacoes_usuario[interacoes_usuario['usuario_id'] == usuario_id]

    filmes_assistidos = interacoes_usuario_especifico['filme_id'].values
    filmes_curtidos = interacoes_usuario_especifico[interacoes_usuario_especifico['interacao'] > 0]['filme_id'].values
    caracteristicas_filmes_curtidos = filmes[filmes['filme_id'].isin(filmes_curtidos)].iloc[:, 2:].values