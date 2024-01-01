from typing import List
from fastapi import FastAPI, File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
import numpy as np
from joblib import load
import pandas as pd

print("Hello from Python script!")
model = load("heart_disease_model2.joblib")

app = FastAPI()
origins = [
    "http://localhost",
    "http://localhost:3000",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allow all origins during development
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
async def ping():
    return "Hello,ayoub, hamza and yassir from FastAPI!"


@app.post("/predict/")
async def read_items(q: List[float]):
    my_array = np.array([q])
    list_of_parameters = ['age', 'sex', 'cp', 'trestbps', 'chol', 'fbs', 'restecg', 'thalach', 'exang', 'oldpeak',
                          'slope', 'ca', 'thal']

    df_to_predict = pd.DataFrame(my_array, columns=list_of_parameters)

    result = model.predict_proba(df_to_predict)[0][0]
    result = float(1 - result)

    return {"value": result}


if __name__ == "__main__":
    uvicorn.run(app, host='localhost', port=8000)
