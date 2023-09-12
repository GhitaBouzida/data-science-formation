#!/usr/bin/env python
# coding: utf-8

# In[6]:


# Import necessary libraries
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import os

# Read the CSV file into a DataFrame
df = pd.read_csv("bluebikes-tripdata.csv")


# In[7]:


df.head()


# In[8]:


df.info()


# In[9]:


df.describe()


# In[10]:


df.dropna(inplace=True) 


# In[20]:


# Convert 'started_at' and 'ended_at' columns to datetime objects
df['started_at'] = pd.to_datetime(df['started_at'])
df['ended_at'] = pd.to_datetime(df['ended_at'])

# Calculate trip duration in seconds
df['Trip Duration (seconds)'] = (df['ended_at'] - df['started_at']).dt.total_seconds()

# Optional: Convert trip duration to minutes
df['Trip Duration (minutes)'] = df['Trip Duration (seconds)'] / 60

# Now, you have trip duration in seconds and minutes as new columns


# In[21]:


print(df.head())


# In[22]:


summary_stats = df.describe()
print(summary_stats)


# In[25]:


ride_id_counts = df['ride_id'].value_counts()
print(ride_id_counts)


# In[ ]:




