"""
Render.com Build Script — Veritabanı tablolarını otomatik oluşturur.
Bu script render.yaml'deki buildCommand'a eklenerek çalıştırılır.
"""
from app import create_app, db

app = create_app()

with app.app_context():
    db.create_all()
    print(">>> [Build] Veritabanı tabloları başarıyla oluşturuldu.")
