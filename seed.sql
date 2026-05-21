-- Umut Bağı Test Verileri (Jüri Testi İçin Örnek Kayıtlar)

-- 1. Örnek Kullanıcılar (Users)

-- Doğrulanmış Engelli Üye (Görme Engeli)
INSERT INTO users (id, name, email, role, is_verified, disability_summary, disability_percentage, disability_group)
VALUES (1, 'Ahmet Yılmaz', 'ahmet@example.com', 'disabled', 1, '%70 Görme Engeli', 70, 'Görme Engeli');

-- Doğrulanmış Donör Üye
INSERT INTO users (id, name, email, role, is_verified, disability_summary, disability_percentage, disability_group)
VALUES (2, 'Zeynep Kaya', 'zeynep@example.com', 'donor', 1, NULL, NULL, NULL);

-- Doğrulanmamış Engelli Üye (Doğrulanması Bekleniyor)
INSERT INTO users (id, name, email, role, is_verified, disability_summary, disability_percentage, disability_group)
VALUES (3, 'Kemal Sunal', 'kemal@example.com', 'disabled', 0, 'İşitme cihazı ve işaret dili eğitimi desteği arıyor.', NULL, NULL);

-- Başka Bir Doğrulanmış Engelli Üye (Ortopedik Engel)
INSERT INTO users (id, name, email, role, is_verified, disability_summary, disability_percentage, disability_group)
VALUES (4, 'Mehmet Demir', 'mehmet@example.com', 'disabled', 1, '%60 Ortopedik Engel', 60, 'Ortopedik Engel');

-- 2. Örnek İlanlar (Listings)

-- Açık İlan (Ahmet Yılmaz tarafından)
INSERT INTO listings (id, title, description, category, status, created_by, matched_donor_id)
VALUES (1, 'Ders Kitabı Seslendirme Desteği', 'Üniversite sınavına hazırlanıyorum. Fizik ve Matematik kitaplarımın sesli okunmasında destek olabilecek donör arıyorum.', 'Eğitim', 'open', 1, NULL);

-- Eşleşmiş/Üstlenilmiş İlan (Mehmet Demir tarafından oluşturuldu, Zeynep Kaya üstlendi)
INSERT INTO listings (id, title, description, category, status, created_by, matched_donor_id)
VALUES (2, 'Tekerlekli Sandalye Bakım Desteği', 'Akülü tekerlekli sandalyemin motor bakımı ve akü değişimi için teknik destek veya maddi sponsor arıyorum.', 'Erişilebilirlik', 'matched', 4, 2);

-- Diğer Açık İlan (Mehmet Demir tarafından)
INSERT INTO listings (id, title, description, category, status, created_by, matched_donor_id)
VALUES (3, 'Kamu Kurumu Refakat Talebi', 'Haftaya çarşamba günü Ankara Valiliği''ndeki resmi işlerim için bana eşlik edebilecek yol arkadaşı arıyorum.', 'Refakat', 'open', 4, NULL);
