# ベースイメージ（Node.js）
FROM node:18

# 作業ディレクトリ
WORKDIR /DEV_COORDINATE/frontend

# 依存関係をインストール
COPY package.json package-lock.json ./
RUN npm install

# アプリケーションコードをコピー
COPY . .

# ビルド
RUN npm run build

# 実行ポート
EXPOSE 3000

# 実行コマンド（開発用）
CMD ["npm", "start"]
