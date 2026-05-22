-- Umut Bağı Test Verileri (Jüri Testi İçin Örnek Kayıtlar)

-- 1. Örnek Kullanıcılar (Users)

-- Doğrulanmış Engelli Üye (Görme Engeli)
INSERT INTO users (id, name, email, role, is_verified, disability_summary, disability_percentage, disability_group, tc_hash, report_expiry_date)
VALUES (1, 'Ahmet Yılmaz', 'ahmet@example.com', 'disabled', 1, '%70 Görme Engeli', 70, 'Görme Engeli', NULL, NULL);

-- Doğrulanmış Donör Üye
INSERT INTO users (id, name, email, role, is_verified, disability_summary, disability_percentage, disability_group, tc_hash, report_expiry_date)
VALUES (2, 'Zeynep Kaya', 'zeynep@example.com', 'donor', 1, NULL, NULL, NULL, NULL, NULL);

-- Doğrulanmamış Engelli Üye (Doğrulanması Bekleniyor)
INSERT INTO users (id, name, email, role, is_verified, disability_summary, disability_percentage, disability_group, tc_hash, report_expiry_date)
VALUES (3, 'Kemal Sunal', 'kemal@example.com', 'disabled', 0, 'İşitme cihazı ve işaret dili eğitimi desteği arıyor.', NULL, NULL, NULL, NULL);

-- Başka Bir Doğrulanmış Engelli Üye (Ortopedik Engel)
INSERT INTO users (id, name, email, role, is_verified, disability_summary, disability_percentage, disability_group, tc_hash, report_expiry_date)
VALUES (4, 'Mehmet Demir', 'mehmet@example.com', 'disabled', 1, '%60 Ortopedik Engel', 60, 'Ortopedik Engel', NULL, NULL);

-- 2. Örnek İlanlar (Listings)

-- Açık İhtiyaç İlanı (Ahmet Yılmaz tarafından)
INSERT INTO listings (id, title, description, category, status, listing_type, city, district, contact_phone, contact_address, created_by, matched_donor_id)
VALUES (1, 'Ders Kitabı Seslendirme Desteği', 'Üniversite sınavına hazırlanıyorum. Fizik ve Matematik kitaplarımın sesli okunmasında destek olabilecek donör arıyorum.', 'Eğitim', 'open', 'need', 'İstanbul', 'Kadıköy', '05551112233', 'Kadıköy/İstanbul', 1, NULL);

-- Eşleşmiş/Üstlenilmiş İhtiyaç İlanı (Mehmet Demir tarafından oluşturuldu, Zeynep Kaya üstlendi)
INSERT INTO listings (id, title, description, category, status, listing_type, city, district, contact_phone, contact_address, created_by, matched_donor_id)
VALUES (2, 'Tekerlekli Sandalye Bakım Desteği', 'Akülü tekerlekli sandalyemin motor bakımı ve akü değişimi için teknik destek veya maddi sponsor arıyorum.', 'Erişilebilirlik', 'matched', 'need', 'Ankara', 'Çankaya', '05554445566', 'Çankaya/Ankara', 4, 2);

-- Paylaşım Merkezinde Açık Bağış İlanı (Zeynep Kaya tarafından)
INSERT INTO listings (id, title, description, category, status, listing_type, image_url, created_by, matched_donor_id)
VALUES (3, 'Temiz Az Kullanılmış Tekerlekli Sandalye', 'İhtiyacı olan birine hediye etmek istiyorum, sadece 2 ay ev içinde kullanıldı.', 'Erişilebilirlik', 'open', 'donation', NULL, 2, NULL);
