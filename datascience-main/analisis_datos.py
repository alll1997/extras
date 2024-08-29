# -*- coding: utf-8 -*-
"""Analisis_datos.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/158NsQq37b7B3IEZmq2K_SebiflB6jT5f
"""

import pandas as pd

data = pd.read_csv("credit_card.csv", sep=",")
data.head()

data.info()

data.columns

nombre_columns = {
  'LIMIT_BAL':'limite',
  'CHECKING_ACCOUNT' : 'cuenta_corriente',
  'EDUCATION': 'nivel_educativo',
  'MARRIAGE' : 'estado_civil',
  'AGE': 'edad',
  'BILL_AMT': 'valor_factura',
  'PAY_AMT': 'valor_pago',
  'DEFAULT': 'moroso',
}

cuentas = data.rename(columns= nombre_columns)

cuentas.head()

cuentas.cuenta_corriente.unique()

dict_cuenta_corriente = {
    'Yes': 'Si',
    'No' : "No",
}

cuentas.cuenta_corriente.map(dict_cuenta_corriente)

cuentas.head()

cuentas.cuenta_corriente = cuentas.cuenta_corriente.map(dict_cuenta_corriente)

cuentas.head()

cuentas.nivel_educativo.unique()

dict_nivel_educativo = {
  '2.University':'2.Univesitario',
  '3.Graduate School':'3.Posgrado',
  '1.High School':'1.Bachillerato'
}

cuentas.nivel_educativo = cuentas.nivel_educativo.map(dict_nivel_educativo)

cuentas.head()

cuentas.estado_civil.unique()

dict_estado_civil ={
    'Married': 'Casada/o',
    'Single':'Soltera/o'
}

cuentas.estado_civil = cuentas.estado_civil.map(dict_estado_civil)

cuentas.head()

"""#**Seaborn**"""

!pip install seaborn

import seaborn as sns

!pip show seaborn

cuentas.shape

sns.distplot(cuentas.limite);

sns.displot(data=cuentas, x = "limite");

sns.displot(data=cuentas, x="limite", hue="nivel_educativo");
# Los bachilleres tiene un limite más bajo en sus cuentas, respecto a los demás niveles de escolaridad
# las personas con mayor limete en sus cuentas son los usarios con posgrados
#Sin embargo se ve una constante de personas sin escolaridad definida, presente a lo largo de los diferente rangos de limite creditisio

cuentas["iu"] = (cuentas['valor_factura']/cuentas['limite']).round(2)

cuentas.head(3)

sns.displot(data=cuentas, x="iu");

sns.set_style("whitegrid")

sns.displot(data=cuentas, x="limite", hue="nivel_educativo", palette="inferno_r");

"""#Graficos categoricos"""

cuentas.head(3)

#Grafico countplot
sns.countplot(data=cuentas, x="cuenta_corriente", hue="moroso", palette="magma")

#Grafico catplot
sns.catplot(data = cuentas, x="cuenta_corriente",  y="limite", hue="estado_civil", dodge=True, palette="cool")

#Grafico swarmplot
sns.swarmplot(data=cuentas, x="nivel_educativo", y="limite", hue="moroso", dodge=True, palette="rainbow")

#Grafico boxplot
sns.boxplot(data=cuentas, x="nivel_educativo", y="limite", hue="estado_civil", palette="Set3");

#Grafico violin
sns.violinplot(data=cuentas, x="estado_civil", y="edad", hue="cuenta_corriente", palette="Accent")

cuentas.edad.unique()

#Grafico por cortes de edad
rango = [20,30,40,50,60,70,100]
nombres = ["20-30","30-40","40-50","50-60","60-70","+70"]
cuentas["rangos_edad"] = pd.cut(cuentas["edad"], bins=rango, labels=nombres)
cuentas.head(3)

sns.boxplot(data=cuentas, x="rangos_edad", y="limite", hue="moroso", palette="bwr")

"""#Graficos numéricos


"""

cuentas.head(2)

sns.displot(data=cuentas, x="limite", col="nivel_educativo")

sns.displot(data=cuentas, x="limite",hue="rangos_edad", col="nivel_educativo", kind="kde");

sns.scatterplot(data=cuentas, x="iu", y="valor_factura");

sns.lmplot(data=cuentas, x="iu", y="valor_factura", col="moroso")

from scipy.stats import ranksums

"""H<sup>null<sup>

La distribucion de los grupos morosos es igual a los no morosos

H<sup>alt<sup>

La distribucion de los grupos morosos es diferente a los no morosos
"""

morosos = cuentas.query("moroso == 1").moroso

no_morosos = cuentas.query("moroso == 0").moroso

resultado =ranksums(morosos, no_morosos)

print("El p_value del test es: {}".format(resultado.pvalue))

#Grafico Jointplot
sns.jointplot(data=cuentas, x="edad", y="iu")

sns.jointplot(data=cuentas, x="edad", y="iu", kind="scatter", hue="estado_civil")

sns.jointplot(data=cuentas, x="edad", y="iu", kind="hex")

sns.jointplot(data=cuentas, x="edad", y="iu", kind="kde", hue="nivel_educativo")

sns.jointplot(data=cuentas, x="edad", y="iu", kind="kde")

"""#**Revisión global**"""

cuentas.describe()

sns.pairplot(data=cuentas)

sns.pairplot(data=cuentas, hue="moroso")

