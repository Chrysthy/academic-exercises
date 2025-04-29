#previsão de dados

import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error

saude_df = pd.read_csv('/content/BI_saude_dados_simulados.csv', delimiter=';')

X = saude_df[['Impressões', 'CTR', 'Lat', 'Long']]
y = saude_df['Custo_por_Conversao']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)


#criando o modelo
model = LinearRegression()
model.fit(X_train, y_train)
y_pred = model.predict(X_test)
mse = mean_squared_error(y_test, y_pred)

print(mse)