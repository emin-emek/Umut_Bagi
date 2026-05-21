# Hafiflik ve hız için alpine veya slim imajı tercih edilmelidir
FROM python:3.9-slim

# Çalışma dizinini sabitle
WORKDIR /app

# Katman önbellekleme (layer caching) avantajı için önce bağımlılıkları kurun
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kalan tüm kaynak kodları container içine aktar
COPY . .

# Google Cloud Run dinamik port yönetimi
ENV PORT 8080
EXPOSE 8080

# Production seviyesi bir WSGI sunucusu olan Gunicorn ile uygulamayı ayağa kaldır
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 "app:create_app()"
