# ベースイメージ（Python）
FROM python:3.10

# 作業ディレクトリ
WORKDIR /DEV_COORDINATE/backend

# 依存関係をインストール
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# .env ファイルをコピー
COPY .env ./

# アプリケーションコードをコピー
COPY . .

# 実行ポート
EXPOSE 5000

# 実行コマンド
CMD ["python", "app.py"]
