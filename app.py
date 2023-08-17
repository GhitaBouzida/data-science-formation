import streamlit as st
from sklearn.datasets import load_iris
from sklearn.ensemble import RandomForestClassifier


# Load the iris dataset
iris = load_iris()
X = iris.data
Y = iris.target

# Set up a Random Forest Classifier
rf_classifier = RandomForestClassifier()
rf_classifier.fit(X, Y)

# Create a Streamlit app
st.title("Iris Flower Type Prediction")
st.header("Enter the Sepal and Petal Measurements")

# Add input fields for sepal and petal measurements
sepal_length = st.slider("Sepal Length", min_value=X[:, 0].min(), max_value=X[:, 0].max(), value=X[:, 0].mean())
sepal_width = st.slider("Sepal Width", min_value=X[:, 1].min(), max_value=X[:, 1].max(), value=X[:, 1].mean())
petal_length = st.slider("Petal Length", min_value=X[:, 2].min(), max_value=X[:, 2].max(), value=X[:, 2].mean())
petal_width = st.slider("Petal Width", min_value=X[:, 3].min(), max_value=X[:, 3].max(), value=X[:, 3].mean())

# Define a prediction button
if st.button("Predict"):
    input_data = [[sepal_length, sepal_width, petal_length, petal_width]]
    prediction = rf_classifier.predict(input_data)
    predicted_class = iris.target_names[prediction][0]
    st.write(f"Predicted Iris Flower Type: {predicted_class}")
