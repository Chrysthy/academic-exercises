import pandas as pd
import numpy as np
from sklearn.metrics.pairwise import cosine_similarity

# Função para calcular recomendações com base no histórico do usuário
def recomendar_filmes(usuario_id, interacoes_usuario, filmes, num_recomendacoes=5):
    # Filtrar interações do usuário específico
    interacoes_usuario_especifico = interacoes_usuario[interacoes_usuario['usuario_id'] == usuario_id]

    # Identificar filmes assistidos e curtidos
    filmes_assistidos = interacoes_usuario_especifico['filme_id'].values
    filmes_curtidos = interacoes_usuario_especifico[interacoes_usuario_especifico['interacao'] > 0]['filme_id'].values

    # Obter características dos filmes curtidos
    caracteristicas_filmes_curtidos = filmes[filmes['filme_id'].isin(filmes_curtidos)].iloc[:, 2:].values

    # Criar perfil do usuário com média das características dos filmes curtidos
    perfil_usuario = np.mean(caracteristicas_filmes_curtidos, axis=0).reshape(1, -1)

    # Selecionar filmes ainda não assistidos
    filmes_nao_assistidos = filmes[~filmes['filme_id'].isin(filmes_assistidos)]

    # Calcular similaridade com o perfil
    similaridades = cosine_similarity(perfil_usuario, filmes_nao_assistidos.iloc[:, 2:].values).flatten()

    # Selecionar os filmes mais similares
    indices_recomendados = np.argsort(similaridades)[-num_recomendacoes:][::-1]
    filmes_recomendados = filmes_nao_assistidos.iloc[indices_recomendados]

    return filmes_recomendados, filmes_curtidos, perfil_usuario

# Categorias e temas
categorias = ['Ação', 'Drama', 'Comédia', 'Romance', 'Suspense', 'Ficção Científica',
              'Fantasia', 'Histórico', 'Terror', 'Documentário']
temas = ['Mistério', 'Amor proibido', 'Criaturas místicas', 'Biografias', 'Horror psicológico',
         'Superação', 'Inteligência artificial', 'Triângulo amoroso', 'Sobrevivência']

# Parâmetros
num_filmes = 1000
num_usuarios = 100

# Geração de dados dos filmes
filmes = pd.DataFrame({
    'filme_id': range(1, num_filmes + 1),
    'titulo': [f'Filme {i}' for i in range(1, num_filmes + 1)],
    **{f'categoria_{categoria.lower()}': np.random.randint(0, 2, num_filmes) for categoria in categorias},
    **{f'tema_{tema.lower().replace(" ", "_")}': np.random.randint(0, 2, num_filmes) for tema in temas}
})

# Função para gerar interações simuladas
def gerar_interacoes(num_usuarios, num_filmes, interacoes_por_usuario):
    interacoes_usuarios = []
    for usuario_id in range(1, num_usuarios + 1):
        filmes_ids = np.random.choice(filmes['filme_id'], interacoes_por_usuario, replace=False)
        interacoes = np.random.choice([1, 2, -1], interacoes_por_usuario, replace=True)  # 1 e 2 = curtiu, -1 = não gostou
        for filme_id, interacao in zip(filmes_ids, interacoes):
            interacoes_usuarios.append({
                'usuario_id': usuario_id,
                'filme_id': filme_id,
                'interacao': interacao
            })
    return pd.DataFrame(interacoes_usuarios)

# Gerar dataset de interações
interacoes_usuario = gerar_interacoes(num_usuarios, num_filmes, interacoes_por_usuario=50)

# Entrada do usuário
usuario_id_input = int(input("Digite o ID do usuário para qual deseja fazer recomendação (1 a 100): "))
if not 1 <= usuario_id_input <= num_usuarios:
    raise ValueError(f"ID do usuário deve estar entre 1 e {num_usuarios}.")

# Obter recomendações
filmes_recomendados, filmes_curtidos, perfil_usuario = recomendar_filmes(usuario_id_input, interacoes_usuario, filmes)

# Exibir recomendações
print(f"\nFilmes curtidos pelo usuário {usuario_id_input}:")
print(filmes_recomendados[['titulo']])

# Mostrar categorias e temas de cada filme recomendado
print("\nCaracterísticas dos filmes recomendados (em comparação com os filmes curtidos):")
for index, row in filmes_recomendados.iterrows():
    print(f"\n🎬 Filme: {row['titulo']}")
    for categoria in categorias:
        if row[f'categoria_{categoria.lower()}'] == 1:
            print(f" - Categoria: {categoria}")
    for tema in temas:
        if row[f"tema_{tema.lower().replace(' ', '_')}"] == 1:
            print(f" - Tema: {tema}")

# Comparação percentual
print("\n📊 Comparação percentual de similaridade com o perfil do usuário:")
for idx, row in filmes_recomendados.iterrows():
    caracteristicas_filme = row.iloc[2:].values
    percent_match = (np.dot(perfil_usuario.flatten(), caracteristicas_filme) / np.sum(perfil_usuario.flatten())) * 100
    print(f"\nFilme: {row['titulo']} - {percent_match:.2f}% de Similaridade com filmes curtidos")
