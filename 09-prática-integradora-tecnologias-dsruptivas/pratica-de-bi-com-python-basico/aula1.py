# Utilizando Google Colab

import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd

# Configurações gerais de estilo

saude_df = pd.read_csv('/content/BI_saude_dados_simulados.csv', delimiter=';')

sns.set(style="whitegrid")

# Exemplo de gráfico de linha para a evolução dos usuários e conversões no setor de Saúde
plt.figure(figsize=(14, 7))
sns.lineplot(data=saude_df, x='Data', y='Usuarios', label='Usuários', marker='o')
sns.lineplot(data=saude_df, x='Data', y='Conversoes', label='Conversões', marker='o')
plt.title('Evolução Temporal de Usuários e Conversões - Saúde')
plt.xlabel('Data')
plt.ylabel('Número')
plt.xticks(rotation=45)
plt.legend()
plt.tight_layout()
plt.show()


#Exemplo de gráfico 2

plt.figure(figsize=(10, 6))
sns.scatterplot(data=saude_df, x='Custo_por_Conversao', y='Conversoes', size='Impressões', hue='CTR', sizes=(20, 200), palette='coolwarm', alpha=0.7)
plt.title('Análise de Custo por Conversão - Saúde')
plt.xlabel('Custo por Conversão (R$)')
plt.ylabel('Número de Conversões')
plt.legend(title='CTR', bbox_to_anchor=(1.05, 1), loc='upper left')
plt.tight_layout()
plt.show()

# Exemplo de gráfico 3
plt.figure(figsize=(10, 6))
sns.scatterplot(data=saude_df, x='Taxa_Rejeicao', y='Duracao_Media_Sessao', size='Usuarios', hue='Conversoes', sizes=(20, 200), palette='viridis', alpha=0.7)
plt.title('Taxa de Rejeição vs. Duração Média da Sessão - Saúde')
plt.xlabel('Taxa de Rejeição (%)')
plt.ylabel('Duração Média da Sessão (min)')
plt.legend(title='Conversões', bbox_to_anchor=(1.05, 1), loc='upper left')
plt.tight_layout()
plt.show()