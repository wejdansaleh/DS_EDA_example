## mtcars data set in Python

# import an entire library
import math # Functions beyond the basic maths
# Import an entire library and give it an alias
import pandas as pd # For DataFrame and handling
import numpy as np # Array and numerical processing
import matplotlib.pyplot as plt # Low level plotting
import seaborn as sns # High level Plotting
import statsmodels.api as sm # Modeling, e.g. ANOVA
import pingouin as pg
# Import only specific modules from a library
# we'll use this for the t-test function
from scipy import stats
from scipy.stats import pearsonr


#Import the data set and assign it to the variable mtcars
mtcars = pd.read_csv('data/mtcars.csv')

#Calculate the correlation between mpg and wt and test if it is significant.

mpgcolumn = mtcars['mpg']
wtcolumn = mtcars['wt']
correlation = mpgcolumn.corr(wtcolumn)
#### other way
pg.corr(x=mtcars['mpg'], y=mtcars['wt'])

#Visualize the relationship in an XY scatter plot.
sns.lmplot(x="wt", y="mpg", data=mtcars,  line_kws={"color":"r","alpha":0.7,"lw":5})
plt.title("Relationship in an XY (mpg and wt) scatter plot")
plt.show()


#Convert weight from pounds to kg.
pounds = mtcars.wt
kilograms = pounds * 0.4536




