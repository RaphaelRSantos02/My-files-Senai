import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.preprocessing import FunctionTransformer #importar metodo para realizar a transformação dos dados
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression #importa o modelo de regressão linear
from sklearn.metrics import r2_score

dados = pd.read_json(path_or_buf="imoveis.json", orient='columns')
dados
dados.ident[0] #Exiba a primeira linha do dataframe
dados.listing[0]#Exiba a primera linha do dataframe

#pré processamento dos dados
#função normalize
dados_lista1 = pd.json_normalize(dados.ident)
dados_lista1.head()#Exibe as primeiras linhas

dados_lista2 = pd.json_normalize(dados.listing, sep='_')
dados_lista2.head()#Exibe as primeiras linhas


dados_imoveis = pd.concat([dados_lista1,dados_lista2], axis=1) # Junta os dataframe

dados_imoveis.head()#Exibe as 4 primeiras linhas do dataframe

print(dados_imoveis.shape)

for coluna in dados_imoveis:
    print("----"*10)
    print(dados_imoveis[coluna].value_counts())
    
#criar um diltro no dataset

filtro = (dados_imoveis['types_usage'] == 'Residencial') & (dados_imoveis['address_city'] == 'Rio de Janeiro')

dados_imoveis = dados_imoveis[filtro] # arnazena o dataset dados_imoveis o filtro cirado na celula de cima

print(dados_imoveis.head())
print(dados_imoveis.info())#retorna as informaçoes do dataset

# Reset do index
dados_imoveis.reset_index(drop=True, inplace=True)
dados_imoveis.info(verbose=False)

dados_imoveis = dados_imoveis.astype({
    'prices.price': 'float64',
    'prices.tax.iptu':'float64',
    'prices.tax.condo':'float64',
    'features.usableAreas':'int64',
    'features.totalAreas': 'int64'
})

dados_imoveis.infos()

#Lidando com dados nulos
dados_imoveis['address.zone'] = dados_imoveis['address.zone'].replace('', np.nan)#substitui o espaço vazio por nan
dados_imoveis['address.zone'].value_counts()
dados_imoveis['address.zone'].isnull().value_counts()

dados_imoveis.info()
dados_imoveis.head()

dici = dados_imoveis[~dados_imoveis['address.zone'].isna()].drop_duplicates(subset=['address.neighborhood']).to_dict('records')# Remove valores duplicados
print(dici)

dados_imoveis['address.zone'].isnull().sum()
dic_zonas = {dic['address.neighborhood']:dic['address.zone'] for dic in dici} #criando dicionario para associar
print(dic_zonas)

for bairro, zona in dic_zonas.items():
    dados_imoveis.loc[dados_imoveis['address.neighborhood']==bairro,'address.zone'] == zona

dados_imoveis.head()

dados_imoveis['address.zone'].isnull().sum()
dados_imoveis['prices.tax.condo'].isnull().sum()
dados_imoveis['prices.tax.iptu'].isnull().sum()

dados_imoveis['prices.tax.condo'].fillna(0,inplace = True)
dados_imoveis['prices.tax.iptu'].fillna(0,inplace = True)

print(f"Todal de valores nulos tax condo:{dados_imoveis['prices.tax.condo'].isnull().sum()}")
print(f"Todal de valores nulos tax iptu:{dados_imoveis['prices.tax.iptu'].isnull().sum()}")

dados_imoveis.drop(['customerID','source', 'types.usage','address.city',
                    'address.location.lon','address.location.lat','address.neighbothood'], axis=1, inplace= True)

#criando dicionario para renomear as colunas
dic_colunas={
    'types.unit':'unit','address.zone': 'zone','prices.price':'price',
    'prices.tax.condo':'tax.condo','prices.tax.iptu':'tax.iptu','features.bedrooms':'bedrooms',
    'features.bathrooms':'bathrooms','features.suites':'suites','features.parkingSpaces':'parkingSpaces',
    'features.usableAreas':'usableAreas', 'features.totalAreas':'totalAreas', 'features.floors':'floors',
    'features.unitsOnTheFloor': 'unitsOnTheFloor','features.unitFloor':'unitFloor'
}

col_n = dados_imoveis.select_dtypes(include=['number']) #seleciona apenas colunas com numero

correlacao = col_n.corr()

#Visualização das correlações
cores = sns.color_palette('light:salmon', as_cmap = True) # personalização das cores
mask = np.zeros_like(correlacao)
mask[np.triu_indices_from(mask)] = True
with sns.axes_style('white'):
    f,ax= plt.subplots(figsize=(13,8))
    ax = sns.heatmap(correlacao, cmap=cores, mask = mask, square = True, fmt = '.2f',annot = True)
    
sns.heatmap(correlacao, cmap='crest')

plt.figure(figsize=(13,8))
mask = np.zeros_like(correlacao)
mask[np.triu_indices_from(mask)] = True
sns.heatmap(correlacao,cmap='crest', mask = mask, square = True,fmt = '.2f', arrot = True)

ax = sns.histplot(data = dados_imoveis, x = 'price', kde = True)
ax.figure.set_size_inches(20,10)
ax.set_title('histograma de preços')
ax.set_xlabel('Preços')
ax.set_ylabel('Preço');

transformer = FunctionTransformer(np.log1p, validate= True)
dados_transformados = transformer.transform(dados_imoveis.select_dtypes(exclude=['object']))

colunas_dados_tranformados = dados_imoveis.select_dtypes(exclude=['object']).columns

df_transformado = pd.concat([dados_imoveis.select_dtypes(include=['object']), pd.DataFrame(dados_transformados, columns=colunas_dados_tranformados)], axis=1)
df_transformado.head()

#depois da transformação
col_n = dados_imoveis.select_dtypes(include=['number'])
correlacao_transformado = col_n.corr()
mask = np.zeros_like(correlacao_transformado)
mask[np.triu_indices_from(mask)] = True
with sns.axes_style("white"):
    f,ax = plt.subplots(figsize=(13,8))
    ax = sns.heatmap(correlacao, cmap = cores, mask = mask, square =True, fmt='.2f', annot=True)
    ax.set_title('Correlação entre variáveis - Tranformação Log', fontsize=20)
    
#depois(distrib. simetrica)

ax= sns.histplot(data=df_transformado, x='price', kde= True)
ax.figure.set_size_inches(20,10)
ax.set_title('histograma de preços')
ax.set_xlabel('Preço');

variaveis_categoricas = df_transformado.select_dtypes(include=['object']).columns #variaveis categóricas

df_dummies = pd.get_dummies(df_transformado[variaveis_categoricas]) # cria uma nova coluna com variaveis categóricas
df_dummies.head()

dados_imoveis_dummies = pd.concat([df_transformado.drop(variaveis_categoricas, axis=1), df_dummies], axis=1) 
dados_imoveis_dummies.head()

dados_imoveis.head()
#Ajuste e previsão
#variaveis explanatorias (idependentes)
x= dados_imoveis_dummies.drop('Price', axis=1)

#variavel dependente 
y = dados_imoveis_dummies['price']

#divisão em conjulto de treino e teste
#random_state - estado de aleatoriedade
x_treino, x_teste, y_treino, y_teste =  train_test_split(x,y,test_size=0.3,random_state=42)#função para dividir o conjunto de dados

#Instanciando o modelo
lr = LinearRegression()
lr.fit(x_treino,y_treino) # treino do modelo

#Teste
previsao_lr = lr.predict(x_teste)
x_teste[0:4]

np.expm1(7.49)

dados_imoveis.head(5)

#resultados da previsão
previsao_lr

np.expm1(13.13161073)

#transformação inversa
np.expm1(13.25768024)

r2_lr = r2_score(y_teste, previsao_lr)
r2_lr

y_true = [3, -0.5,2,7]
y_pred = [2.5,0.0,2,8]
