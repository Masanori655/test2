FROM nginx:alpine

# Cloud Run は PORT 環境変数 (既定 8080) で待ち受ける必要がある。
# nginx 公式イメージは /etc/nginx/templates/*.template を起動時に envsubst して
# /etc/nginx/conf.d/ に展開するため、そこでポートを注入する。
ENV PORT=8080
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

COPY *.html /usr/share/nginx/html/

EXPOSE 8080
