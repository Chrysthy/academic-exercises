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

    # Perfil do usuário
    perfil_usuario = np.mean(caracteristicas_filmes_curtidos, axis=0).reshape(1, -1)
    filmes_nao_assistidos = filmes[~filmes['filme_id'].isin(filmes_assistidos)]
    similaridades = cosine_similarity(perfil_usuario, filmes_nao_assistidos.iloc[:, 2:].values).flatten()

    # Ordenando os filmes com base na similaridade
    indices_recomendados = np.argsort(similaridades)[-num_recomendacoes:][::1]
    filmes_recomendados = filmes_nao_assistidos.iloc[indices_recomendados]

    return filmes_recomendados, filmes_curtidos, perfil_usuario 

    categorias = ['Ação', 'Drama', 'Comédia', 'Romance', 'Suspense', 'Ficção Científica', 'Fantasia', 'Histórico', 'Terror', 'Documentário']

    temas = ['Mistério', 'Amor proibido', 'Criaturas místicas', 'Biografias', 'Horror psicológico', 'Superação', 'Inteligência artificial', 'Triângulo amoroso', 'Sobrevivência']

    num_filmes = 1000
    num_usuarios = 100


    filmes  = pd.DataFrame({
        'filme_id': range(1, num_filmes + 1),
        'titulo': [f'Filme {i}' for i in range(1, num_filmes + 1)],
        **{f'categoria_{categoria.lower()}': np.random.randint(0, 2, num_filmes) for categoria in categorias},
        **{f'tema_{tema.lower().replace(" ", "_")}': np.random.randint(0, 2, num_filmes) for tema in temas}
    })
    

    # Gerando interações do usuário
    interacoes_usuario = pd.DataFrame({
        'usuario_id': np.random.randint(1, num_usuarios + 1, num_filmes * 10),
        'filme_id': np.random.randint(1, num_filmes + 1, num_filmes * 10),
        'interacao': np.random.randint(0, 2, num_filmes * 10)
    })

    def gerar_interacoes(num_usuarios, num_filmes, interacoes_por_usuario):
        interacoes_usuarios = []
    for usuario_id in range(1, num_usuarios + 1):
        filmes_ids = np.random.choice(filmes['filme_id'], interacoes_por_usuario, replace=False)
    interacoes = np.random.choice([1,2,-1], interacoes_por_usuario, replace=True)
    for filme_id, interacao in zip(filmes_ids, interacoes):
            interacoes_usuarios.append({
                'usuario_id': usuario_id, 
                'filme_id': filme_id, 
                'interacao': interacao
            })

