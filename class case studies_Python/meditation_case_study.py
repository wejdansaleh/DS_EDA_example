## Tidy data  set in Python

import pandas as pd # For DataFrame and handling
import numpy as np
from scipy import stats

df = pd.DataFrame({
            'name': ["John Smith", "Jane Doe", "Mary Johnson"],
            'treatment_a': [None, 16, 3], 
            'treatment_b': [2, 11, 1]})
print(df)

#Exercise 8.2 (Import data) Import Expression.txt. Save it as an object called medi
medi = pd.read_csv('data/Expression.txt', delimiter = "\t")
medi.info()



#Exercise 8.3 (Tidy data) Convert the data set to a tidy format.
medi_melt = pd.melt(medi)
medi_melt
# split up the three variables, call the .str attribute to get strings
medi_melt['treatment'], medi_melt['gene'], medi_melt['time'] = medi_melt['variable'].str.split('_').str

# %%
# Drop the variable column
medi_melt.drop('variable', axis=1)

#Exercise 8.4 (Calculate Statistics) 
# Calculate each of the following statistics for each of the unique 24 combinations of gene, treatment and time:
#the mean of the value
average = medi_melt.groupby('gene').mean()
print(average)
#the number of observations in each group
n= medi_melt['gene'].value_counts()
print(n)
#The standard error of the mean
SEM =np.std(medi_melt, ddof=1) / np.sqrt(np.size(medi_melt))
print(SEM)
#SEM= scipy.stats.sem(medi_melt)
#
# The 95% CI error defined by the t distribution
#CIerror= 
#lower95 The lower 95% CI limit
meanmedi= np.mean(medi_melt.value) ## for all value
lower95 = average - (1.96*SEM) ## for each group
lower95 = meanmedi - (1.96*SEM) 
#upper95 The upper 95% CI limit
upper95 = average + 1.96*SEM ## for each group
upper95 = meanmedi + 1.96*SEM
