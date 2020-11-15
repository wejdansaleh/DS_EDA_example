
# import an entire library
import math # Functions beyond the basic maths

# Import an entire library and give it an alias
import pandas as pd # For DataFrame and handling
import numpy as np # Array and numerical processing
import matplotlib.pyplot as plt # Low level plotting
import seaborn as sns # High level Plotting
import statsmodels.api as sm # Modeling, e.g. ANOVA



#Exercise 5.1 Using foo_df, what commands would I use to get:
foo1 = [True, False, False, True, True, False]
foo2 = ["Liver", "Brain", "Testes", "Muscle", "Intestine", "Heart"]
foo3 = [13, 88, 1233, 55, 233, 18]

# Collect list into a dataframe
foo_df = pd.DataFrame({'healthy': foo1, 'tissue': foo2, 'quantity': foo3})
foo_df
type(foo_df)

#The 2nd to 3rd rows?
foo_df.iloc[[1,2],]

#The last 2 rows?
foo_df[-2:]

#A random row in foo_df?
 foo_df.sample(n=3)
#From the 4th to the last row? But without hard-coding, i.e. regardless of how many rows my data frame contains
foo_df.iloc[3:,:]

#Exercise 5.3 (Indexing at intervals) Use indexing to obtain all the odd and even rows only from the foo_df data frame.
foo_df.iloc[::2]  ## odd star from the first row
foo_df.iloc[1::2]    # even row start from the second row

#Exercise 5.4 Subset for boolean data:
foo_df[(foo_df.healthy)] # 
foo_df[(foo_df.healthy) == "False"]


#Exercise 5.4 Subset for boolean data:
#Only “healthy” samples.
foo_df[(foo_df.healthy)]
#Only “unhealthy” samples.
foo_df[(foo_df.healthy!=True)]

#Exercise 5.5 Subset for numerical data:
#Only low quantity samples, those below 100.
foo_df[foo_df.quantity < 100]
#Quantity between 100 and 1000,
foo_df[(foo_df.quantity > 100) & (foo_df.quantity < 1000)]
#Quantity below 100 and beyond 1000.
foo_df[(foo_df.quantity < 1000) & (foo_df.quantity < 100)]


#Exercise 5.6 Subset for strings:

#Only “heart” samples.
foo_df[(foo_df.tissue == "Heart")]
#“Heart” and “liver” samples

foo_df[(foo_df.tissue == "Heart") | (foo_df.tissue == "Liver")]

#Everything except “intestines”

foo_df[foo_df.tissue != 'Intestine']

