# Umut Bağı - Engelsiz Dayanışma Platformu

Umut Bağı, engelli bireyler ile destek olmak isteyen donörleri bir araya getiren modern, güvenli ve erişilebilir bir yardımlaşma ve sosyal dayanışma platformudur.

---

## Mimari Seçim ve Teknik Gerekçeler

Projemizde **Seçenek 1: Monolitik Mimari (Tümleşik Yapı)** tercih edilmiş ve bu doğrultuda kurumsal standartlara uygun klasör yapısı kurulmuştur.

### Mimari Tercih Gerekçeleri:
1. **Geliştirme ve Dağıtım Kolaylığı:** Projenin hızlı bir şekilde hayata geçirilmesi ve tek bir Docker konteyneri ile Google Cloud Run üzerinde kolayca host edilebilmesi için monolitik yapı en efektif çözümdür.
2. **Katmanlı Modüler Yapı:** "Spagetti kod" engellenerek kod tabanı Route'lar, Veri Servisleri ve Veri Modelleri (`models/`, `services/`, `routes/`) şeklinde katmanlara ayrılmıştır.
3. **Veri Bütünlüğü:** SQLite veri tabanı üzerinde tanımlanan kullanıcılar ve ilanlar arası ilişkiler (Foreign Keys) ve bütünlük kuralları tek bir çatı altında doğrudan ORM aracılığıyla yönetilmektedir.

---

## Teknoloji Yığını (Tech Stack)

- **Frontend:** Vanilla HTML5, premium cam efekti barındıran modern Vanilla CSS, Vanilla JavaScript (XSS korumalı, harici kitaplık bağımlılığı minimum).
- **Backend:** Python 3.9 (Flask Framework - Application Factory Pattern).
- **Veri Tabanı:** SQLite (Lokal testler için) / PostgreSQL uyumlu SQL yapısı (SQLAlchemy ORM).
- **Güvenlik Protokolü:** Flask-CORS (Cross-Origin Resource Sharing) yapılandırması.
- **Konteynerizasyon:** Docker (Google Cloud Run uyumlu `python:3.9-slim` imajı).

---

## Güvenlik ve KVKK / GDPR Uyumluluğu

Sağlık Bakanlığı ve e-Devlet entegrasyonu simülasyonumuzda **KVKK kurallarına sıfır toleransla** uyulmaktadır:
- Yüklenen engelli e-Rapor PDF'leri RAM üzerinde anlık okunur.
- Çıkarılan 11 haneli **T.C. Kimlik Numarası hiçbir şekilde loglanmaz veya veri tabanına kaydedilmez**.
- Sadece belgenin doğruluğu (Barkod) ve üyenin hak sahipliği derecesi (% oran ve engel grubu) veri tabanına işlenerek üyeye **"Onaylı Engelli Üye"** rozeti atanır.

---

## Proje Klasör Yapısı

```text
📁 umut_bagi/
│
├── 📁 app/                           # Flask Uygulama Kökü
│   ├── 📁 static/                    # Arayüz dosyaları (CSS, JS, Görseller)
│   │   ├── 📁 css/
│   │   └── 📁 js/
│   ├── 📁 templates/                 # HTML şablonları (Jinja2)
│   ├── 📁 routes/                    # Sayfa yönlendirmeleri ve API rotaları
│   │   ├── 📄 auth.py                # Kimlik doğrulama API'leri
│   │   ├── 📄 main.py                # İlan API'leri
│   │   ├── 📄 pages.py               # HTML Şablon servis rotaları
│   │   └── 📄 __init__.py            # API Blueprint tanımlayıcı
│   ├── 📁 services/                  # İş mantığı ve algoritmalar
│   │   └── 📄 pdf_verifier.py        # Akıllı e-Rapor analiz servisi
│   ├── 📁 models/                    # SQL ORM modelleri
│   │   ├── 📄 user.py
│   │   ├── 📄 listing.py
│   │   └── 📄 __init__.py
│   └── 📄 __init__.py                # Uygulama başlatıcı (App Factory)
│
├── 📄 Dockerfile                     # GCP Cloud Run uyumlu Docker dosyası
├── 📄 requirements.txt               # Bağımlılık listesi
├── 📄 .env.example                   # Çevre değişkeni şablonu
├── 📄 schema.sql                     # Boş veritabanı şeması
├── 📄 seed.sql                       # Jüri için hazır test verileri
├── 📄 run_app.py                     # Lokal çalıştırma betiği
└── 📄 README.md                      # Proje dokümantasyonu
```

---

## Kurulum ve Lokal Çalıştırma

### 1. Bağımlılıkların Kurulması
```bash
pip install -r requirements.txt
```

### 2. Veri Tabanını İlklendirme
Sistem ilk çalıştırıldığında `umut_bagi.db` dosyasını otomatik oluşturacak ve tabloları kuracaktır. Jüri testleri için örnek verileri yüklemek isterseniz SQLite aracı ile `seed.sql` dosyasını çalıştırabilirsiniz:
```bash
sqlite3 umut_bagi.db < schema.sql
sqlite3 umut_bagi.db < seed.sql
```

### 3. Uygulamayı Başlatma
```bash
python run_app.py
```
Uygulama lokalde `http://127.0.0.1:5000` adresinde çalışacaktır.