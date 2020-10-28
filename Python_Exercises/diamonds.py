## Diamonds data set in Python

# import an entire library
import math # Functions beyond the basic maths

# Import an entire library and give it an alias
import pandas as pd # For DataFrame and handling
import numpy as np # Array and numerical processing
import matplotlib.pyplot as plt # Low level plotting
import seaborn as sns # High level Plotting
import statsmodels.api as sm # Modeling, e.g. ANOVA

# Import only specific modules from a library
# we'll use this for the t-test function
from scipy import stats
from scipy.stats import zscore

# Import only specific functions from a library 
# ols is for ordinary least squares
from statsmodels.formula.api import ols
from bioinfokit.analys import stat
#Exercise 7.1 (Import and Examine) 
diamonds = pd.read_csv('data/diamonds.csv') ## import
diamonds.info() ## Examine

#Exercise 7.2 (Examine structure) type 
type(diamonds)

# Exercises for Plotting, transforming and EDA
#Exercise 7.3 (Counting individual groups) - 
# How many diamonds with a clarity of category “IF” are present in the data-set? 
diamonds[(diamonds.clarity == "IF")]
len(diamonds[(diamonds.clarity == "IF")])
# What fraction of the total do they represent?
prpo = len(diamonds[(diamonds.clarity == "IF")]) /len(diamonds)

#Exercise 7.4 (Summarizing proportions) - What proportion of the whole is made up of each category of clarity?
#Prop.describe()
#diamonds.groupby(['clarity']).describe()
n = diamonds.groupby(['clarity']).size()
Calritprop = n /len(diamonds)

Summarizing ['pro']= n /len(diamonds)
print(Summarizing)


#Exercise 7.5 (Find specific diamonds prices) 
# - What is the cheapest diamond price overall? 
min(diamonds.price)
# - What is the range of diamond prices? 
range(min(diamonds.price),max(diamonds.price) )     

# - What is the average diamond price in each category of cut and color?
diamonds.groupby(['cut','color'])['price'].mean()

#Exercise 7.6 (Basic plotting) 
# Make a scatter plot that shows the diamond price described by carat.
plt.scatter(diamonds["carat"], diamonds["price"], alpha=0.65)
plt.title('scatter plot that shows the diamond price described by carat')
plt.xlabel('carat')
plt.ylabel('price')
plt.show()


#Exercise 7.7 (Applying transformations)
#  Apply a log10 transformation to both the price and carat and store these as new columns in the DataFrame: price_log10 and carat_log10.
diamonds['price_log10'] = np.log10(diamonds['price'])
diamonds['carat_log10'] =  np.log10(diamonds['carat'])

#Exercise 7.8 (Basic plotting) 
# Redraw the scatterplot using the transformed values.
plt.scatter(diamonds["carat_log10"], diamonds["price_log10"], alpha=0.65)
plt.title('scatter plot that shows the transformed values')
plt.xlabel('carat_log10')
plt.ylabel('price_log10')
plt.show()

#Exercise 7.9 (Viewing models) 
# Define a linear model that describes the relatioship shown in the plot.
sns.lmplot(x="price_log10", y="carat_log10", data=diamonds,  line_kws={"color":"r","alpha":0.7,"lw":5})
plt.title("linear model")
plt.show()