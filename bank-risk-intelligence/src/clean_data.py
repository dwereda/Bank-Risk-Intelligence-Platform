# Import bibliotek
import pandas as pd
from pathlib import Path

# Ścieżki projektu
BASE_DIR = Path(__file__).resolve().parent.parent

input_path = (
    BASE_DIR
    / "data"
    / "raw"
    / "credit_risk_dataset.csv"
)

output_path = (
    BASE_DIR
    / "data"
    / "processed"
    / "credit_risk_dataset.csv"
)

#Wgranie csv
df = pd.read_csv(input_path)

# Usunięcie błędów i braków danych

df = df.dropna(subset=['loan_int_rate', 'person_emp_length'])
invalid_rows = df[(df['person_age'] >= 80) |
                (df['person_age'] < df['person_emp_length'])].index
df = df.drop(index=invalid_rows)

# Zapisanie wyczyszczonych danych
df.to_csv(path_or_buf=output_path, index=False)