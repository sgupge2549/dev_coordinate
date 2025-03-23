from flask import Flask
from dotenv import load_dotenv
import os

load_dotenv()

# 環境変数の取得
postgres_user = os.getenv('POSTGRES_USER')
postgres_password = os.getenv('POSTGRES_PASSWORD')
postgres_db = os.getenv('POSTGRES_DB')

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello, Flask!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
