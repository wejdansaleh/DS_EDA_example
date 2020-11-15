## Chick Weights data set in Python

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

# Import the data set
Chick_Weights = pd.read_csv('data/Chick Weights.txt', delimiter = "\t")

# Calculate the mean and standard deviation for each group.
df1 = Chick_Weights.groupby(['feed']).mean()
df2 = Chick_Weights.groupby(['feed']).std()

#Calculate the number of chicks in each group.
Chick_Weights['feed'].value_counts()

#Calculate a within-group z-score
Chick_Weights['s_z'] = Chick_Weights.groupby('feed')['weight'].transform(lambda x: (x-x.mean())/x.std())

#Produce a strip chart showing each chick as an individual data point
SC = sns.stripplot(x="feed", y="weight", data=Chick_Weights, jitter=0.05)

#Calculate a 1-way ANOVA
lm = ols('weight ~ feed', data=Chick_Weights).fit()
anovatest = sm.stats.anova_lm(lm)

#Calculate Tukey’s post-hoc test (i.e. p-values for all pair-wise t-tests)

from statsmodels.stats.multicomp import (pairwise_tukeyhsd,
                                         MultiComparison)
tukey = pairwise_tukeyhsd(endog=Chick_Weights,groups=weight, alpha=0.05)    
p1_tukey_test = pairwise_tukeyhsd(Chick_Weights["feed"], Chick_Weights["weight"] )


MultiComp = MultiComparison(Chick_Weights['weight'],
                            Chick_Weights['feed'])

print(MultiComp.tukeyhsd().summary())