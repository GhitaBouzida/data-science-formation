#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from keras.models import Sequential
from keras.layers import Dense


# In[2]:


data = pd.read_csv("bank.csv")
print(data.head())
print(data.describe())
sns.countplot(x='deposit', data=data)
plt.show()


# In[3]:


print(data.isnull().sum())
data.drop_duplicates(inplace=True)


# In[5]:


X = data.drop('deposit', axis=1)
y = data['deposit']

label_encoder = LabelEncoder()
X['education'] = label_encoder.fit_transform(X['education'])

X_encoded = pd.get_dummies(X)
y_encoded = pd.get_dummies(y)['yes']

X_train, X_test, y_train, y_test = train_test_split(X_encoded, y_encoded, test_size=0.2, random_state=42)

model = Sequential()
model.add(Dense(32, activation='relu', input_dim=X_train.shape[1]))
model.add(Dense(16, activation='relu'))
model.add(Dense(1, activation='sigmoid'))

model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])

history = model.fit(X_train, y_train, epochs=20, batch_size=32, validation_data=(X_test, y_test))


# In[ ]:
