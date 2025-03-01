-- Active: 1739938912855@@153.92.15.57@3306@u241792908_ssymu
select * from product WHERE id_series_name="icy-series";

SELECT * FROM product WHERE id_product_name = 'oceanic-lip-protection-treatment' AND status = 'active';

ALTER TABLE article
MODIFY COLUMN description TEXT;

INSERT INTO article (id, id_title, title, creator, day, date, link_img, public_id, caption_img, description, place, status, created_at, updated_at, deleted_at) VALUES
(UUID(), 'the-rise-of-ai', 'The Rise of AI', 'John Doe', 'Monday', '2024-06-01', 'https://res.cloudinary.com/dixxtnquz/image/upload/v1703846013/SSG/sskinbgfix_h2nabn.png', 'ai-001', 'AI Image', 'An in-depth look at the rise of artificial intelligence in modern society.', 'New York', 'pending', '2024-06-01 10:00:00', NULL, NULL),
(UUID(), 'climate-change-effects', 'Climate Change Effects', 'Jane Smith', 'Wednesday', '2024-06-02', 'https://res.cloudinary.com/dixxtnquz/image/upload/v1703833379/SSG/bglevelupb_juz5hg.png', 'climate-002', 'Climate Image', 'Exploring the effects of climate change on our environment and daily lives.', 'San Francisco', 'pending', '2024-06-02 12:00:00', NULL, NULL),
(UUID(), 'advancements-in-biotechnology', 'Advancements in Biotechnology', 'Alice Johnson', 'Friday', '2024-06-03', 'https://res.cloudinary.com/dixxtnquz/image/upload/v1704338307/SSG/levelup-589_1_lah4jd.svg', 'bio-003', 'Biotech Image', 'Latest advancements in biotechnology and their potential impact on healthcare.', 'Boston', 'pending', '2024-06-03 14:00:00', NULL, NULL);


DROP TABLE article;

CREATE TABLE article (
    id VARCHAR(255) PRIMARY KEY,
    id_title VARCHAR(255),
    title VARCHAR(255),
    creator VARCHAR(255),
    day VARCHAR(255),
    date VARCHAR(255),
    link_img VARCHAR(255),
    public_id VARCHAR(255),
    caption_img VARCHAR(255),
    description VARCHAR(100000),
    place VARCHAR(255),
    status VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at VARCHAR(255),
    deleted_at VARCHAR(255)
);

CREATE TABLE users (
    id VARCHAR(255) PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    role VARCHAR(255),
    notelp INT(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE product (
    id VARCHAR(255) PRIMARY KEY,
    id_title VARCHAR(255),
    name_product VARCHAR(255),
    description TEXT,
    ingredients TEXT,
    htu TEXT, 
    usp TEXT, 
    price VARCHAR(255),
    link_ecommerce VARCHAR(255), 
    category VARCHAR(255),
    product_varian1 VARCHAR(255),
    product_varian2 VARCHAR(255),
    product_varian3 VARCHAR(255),
    product_varian4 VARCHAR(255),
    product_varian5 VARCHAR(255),
    asset_varian1 VARCHAR(255),
    asset_varian2 VARCHAR(255),
    asset_varian3 VARCHAR(255),
    asset_varian4 VARCHAR(255),
    asset_varian5 VARCHAR(255),
    poster VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

INSERT INTO product (id, id_title, name_product, price, link_ecommerce, category, product_varian1, product_varian2, product_varian3, product_varian4, product_varian5, poster)
VALUES
(UUID(), 'loose-powder', 'Loose Powder', 129000, 'https://example.com/loose-powder', 'face', NULL, NULL, NULL, NULL, NULL, NULL),

(UUID(), 'luxe-aura-baked-blush', 'Luxe Aura Baked Blush', 139000, 'https://example.com/luxe-aura-baked-blush', 'face', 'Aura Dusk', 'Aura Peach', 'Aura Pink', NULL, NULL, NULL),

(UUID(), 'luxe-contour-lip-liner', 'Luxe Contour Lip Liner', 99000, 'https://example.com/luxe-contour-lip-liner', 'lip', 'Dusty Pink', 'Nutty Nude', 'Peachy Nude', 'Pink Punch', 'Ruby Red', NULL),

(UUID(), 'luxe-eyeliner-black', 'Luxe Eyeliner', 89000, 'https://example.com/luxe-eyeliner-black', 'eye', 'Black', NULL, NULL, NULL, NULL, NULL),

(UUID(), 'luxe-matte-lip-cream', 'Luxe Matte Lip Cream', 119000, 'https://example.com/luxe-matte-lip-cream', 'lip', 'Dusty Pink', 'Nutty Nude', 'Peachy Nude', 'Pink Punch', 'Ruby Red', NULL),

(UUID(), 'luxe-moisture-lip-gloss', 'Luxe Moisture Lip Gloss', 99000, 'https://example.com/luxe-moisture-lip-gloss', 'lip', NULL, NULL, NULL, NULL, NULL, NULL),

(UUID(), 'perfect-brown-definer', 'Perfect Brown Definer', 89000, 'https://example.com/perfect-brown-definer', 'eye', 'Dark Brown', 'Ash Brown', 'Brown', NULL, NULL, NULL),

(UUID(), 'royal-perfect-matte-cushion', 'Royal Perfect Matte Cushion', 179000, 'https://example.com/royal-perfect-matte-cushion', 'face', 'Ivory', 'Natural', NULL, NULL, NULL, NULL),

(UUID(), 'mascara', 'Mascara', 99000, 'https://example.com/mascara', 'eye', NULL, NULL, NULL, NULL, NULL, NULL),

(UUID(), 'eye-curler', 'Eye Curler', 59000, 'https://example.com/eye-curler', 'beauty-tools', NULL, NULL, NULL, NULL, NULL, NULL),

(UUID(), 'tinted-lip-balm', 'Tinted Lip Balm', 79000, 'https://example.com/tinted-lip-balm', 'lip', 'Berry Mauve', 'Hazelnude', 'Golden Peach', NULL, NULL, NULL),

(UUID(), 'eyeshadow-palette', 'Eyeshadow Palette', 129000, 'https://example.com/loose-powder', 'eye', NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO product (id, id_title, name_product, price, link_ecommerce, category, product_varian1, product_varian2, product_varian3, product_varian4, product_varian5)
VALUES
(UUID(), 'eyeshadow-palette', 'Eyeshadow Palette', 129000, 'https://example.com/loose-powder', 'Eye', NULL, NULL, NULL, NULL, NULL);

SELECT * FROM product;

ALTER TABLE product 
ADD COLUMN poster VARCHAR(255) AFTER asset_varian5;

DROP TABLE product;

INSERT INTO product (id, id_title, name_product, price, link_ecommerce, category, description, ingredients, htu, usp, product_varian1, product_varian2, product_varian3, product_varian4, product_varian5, poster)
VALUES
(UUID(), 'loose-powder', 'Loose Powder', '129000', 'https://example.com/loose-powder', 'face', 
'Royal Satin Loose Powder provides a lightweight formula that gives a matte finish and smooth skin appearance.', 
'Portulaca Oleracea Extract: Moisturizes and acts as an antioxidant. Centella Asiatica Extract: Keeps skin hydrated and prevents dryness. Gold: Enhances skin radiance and provides natural antioxidant properties.', 
'Apply using a powder brush or puff to achieve a long-lasting matte finish.', 
'Long-wear. Soft powdery particles. Matte finish. Blends flawlessly, builds easily. Lightweight. Buildable coverage', 
NULL, NULL, NULL, NULL, NULL, NULL),

(UUID(), 'luxe-aura-baked-blush', 'Luxe Aura Baked Blush', '139000', 'https://example.com/luxe-aura-baked-blush', 'face', 
'A blush with a soft texture that provides a natural velvet finish and long-lasting effect.', 
'Squalane: Provides intense moisture and hydration. Gold: Natural antioxidant with anti-aging properties that enhance skin radiance.', 
'Use a brush and apply gently to the cheek area.', 
'Soft powdery texture. Velvet finish. Weightless, easy to glide. Blends flawlessly, builds easily. Long-lasting. Natural finish', 
'Aura Dusk', 'Aura Peach', 'Aura Pink', NULL, NULL, NULL),

(UUID(), 'luxe-contour-lip-liner', 'Luxe Contour Lip Liner', '99000', 'https://example.com/luxe-contour-lip-liner', 'lip', 
'A long-lasting lip liner with a creamy formula that gives a soft matte finish and easy application.', 
'Tocopheryl Acetate (Vitamin E): Moisturizes and acts as an antioxidant. Shea Butter: Hydrates and soothes the lips.', 
'Apply along the lip line to define the shape before applying lipstick.', 
'Soft matte finish. Creamy formula. Glides on smoothly. Waterproof, smudge-proof. One swipe application. Includes sharpener', 
'Dusty Pink', 'Nutty Nude', 'Peachy Nude', 'Pink Punch', 'Ruby Red', NULL),

(UUID(), 'luxe-eyeliner-black', 'Luxe Eyeliner', '89000', 'https://example.com/luxe-eyeliner-black', 'eye', 
'A high-pigment eyeliner that is long-lasting and easy to apply for a defined eye look.', 
'Tocopheryl Acetate (Vitamin E): Moisturizes and acts as an antioxidant. Acrylates Copolymer: Provides long-lasting and waterproof properties.', 
'Apply along the lash line for a sharp eye look.', 
'Lightweight. High pigment with smudge-proof. Transfer-proof. Blends flawlessly, builds easily', 
'Black', NULL, NULL, NULL, NULL, NULL),

(UUID(), 'luxe-matte-lip-cream', 'Luxe Matte Lip Cream', '119000', 'https://example.com/luxe-matte-lip-cream', 'lip', 
'A matte-finish lip cream that is lightweight, non-sticky, and provides long-lasting color.', 
'Tocopherol (Vitamin E): Moisturizes, acts as an antioxidant, and prevents chapped lips. Gold: Provides intense moisture, brightens lips, and acts as an antioxidant. Grapeseed Oil: Reduces the appearance of lip lines and keeps lips soft.', 
'Apply on the lips with the applicator and let it dry.', 
'Matte finish. Lightweight feel, non-sticky and moisturizing. Long-lasting. Intense pigmentation covers dark lips', 
'Dusty Pink', 'Nutty Nude', 'Peachy Nude', 'Pink Punch', 'Ruby Red', NULL),

(UUID(), 'luxe-moisture-lip-gloss', 'Luxe Moisture Lip Gloss', '99000', 'https://example.com/luxe-moisture-lip-gloss', 'lip', 
'A high-shine lip gloss that provides deep hydration and can be used as a base or top coat.', 
'Tocopherol (Vitamin E): Moisturizes and acts as an antioxidant. Gold: Delivers mirror-like shine while hydrating the lips. Jojoba Oil: Nourishes dry lips. Sunflower Seed Oil: Hydrates and adds shine.', 
'Apply directly on lips for a glossy effect or layer over lipstick for extra shine.', 
'Deep hydration. Extra shiny lip gloss. Non-sticky lip feel. Easy to glide formula. Can be used as a base or top lip coat', 
NULL, NULL, NULL, NULL, NULL, NULL),

(UUID(), 'perfect-brown-definer', 'Perfect Brown Definer', '89000', 'https://example.com/perfect-brown-definer', 'eye', 
NULL, NULL, NULL, NULL, 
'Dark Brown', 'Ash Brown', 'Brown', NULL, NULL, NULL),

(UUID(), 'royal-perfect-matte-cushion', 'Royal Perfect Matte Cushion', '179000', 'https://example.com/royal-perfect-matte-cushion', 'face', 
'A cushion with a creamy texture that provides a satin finish with medium to high coverage.', 
'Ceramide: Helps the skin retain moisture. Vitamin C: Reduces dark spots and brightens complexion. Gold: Enhances skin radiance and provides natural antioxidant properties.', 
'Use the provided puff and apply by gently tapping on the face.', 
'Soft creamy texture with SPF. Satin finish. Non-cakey. Blends flawlessly, builds easily. Lightweight with medium to high coverage', 
'Ivory', 'Natural', NULL, NULL, NULL, NULL),

(UUID(), 'mascara', 'Mascara', '99000', 'https://example.com/mascara', 'eye', 
NULL, NULL, NULL, NULL, 
NULL, NULL, NULL, NULL, NULL, NULL),

(UUID(), 'eye-curler', 'Eye Curler', '59000', 'https://example.com/eye-curler', 'beauty-tools', 
NULL, NULL, NULL, NULL, 
NULL, NULL, NULL, NULL, NULL, NULL),

(UUID(), 'tinted-lip-balm', 'Tinted Lip Balm', '79000', 'https://example.com/tinted-lip-balm', 'lip', 
NULL, NULL, NULL, NULL, 
'Berry Mauve', 'Hazelnude', 'Golden Peach', NULL, NULL, NULL),

(UUID(), 'eyeshadow-palette', 'Eyeshadow Palette', '129000', 'https://example.com/eyeshadow-palette', 'eye', 
NULL, NULL, NULL, NULL, 
NULL, NULL, NULL, NULL, NULL, NULL);

ALTER TABLE product 
CHANGE COLUMN link_ecommerce link_ecommerce_varian1 VARCHAR(255);

ALTER TABLE product 
ADD COLUMN link_ecommerce_varian2 VARCHAR(255) AFTER link_ecommerce_varian1,
ADD COLUMN link_ecommerce_varian3 VARCHAR(255) AFTER link_ecommerce_varian2,
ADD COLUMN link_ecommerce_varian4 VARCHAR(255) AFTER link_ecommerce_varian3,
ADD COLUMN link_ecommerce_varian5 VARCHAR(255) AFTER link_ecommerce_varian4;

ALTER TABLE product 
ADD COLUMN asset_png_varian1 VARCHAR(255) AFTER asset_varian5,
ADD COLUMN asset_png_varian2 VARCHAR(255) AFTER asset_png_varian1,
ADD COLUMN asset_png_varian3 VARCHAR(255) AFTER asset_png_varian2,
ADD COLUMN asset_png_varian4 VARCHAR(255) AFTER asset_png_varian3,
ADD COLUMN asset_png_varian5 VARCHAR(255) AFTER asset_png_varian4;

ALTER TABLE article
ADD COLUMN pre_desc VARCHAR(255) AFTER caption_img;

ALTER TABLE article
ADD COLUMN views INT AFTER status,
ADD COLUMN share_x INT AFTER views,
ADD COLUMN share_fb INT AFTER share_x,
ADD COLUMN share_wa INT AFTER share_fb,
ADD COLUMN share_copy INT AFTER share_wa;

-- Artikel SS Store
INSERT INTO article (
    id, 
    id_title, 
    title, 
    creator, 
    day, 
    date, 
    link_img, 
    public_id, 
    caption_img, 
    description, 
    place, 
    status, 
    created_at, 
    updated_at, 
    deleted_at
) VALUES (
    UUID(), 
    'ss-your-makeup-hadir-di-gandaria-city-mall', 
    'SS Your Makeup Hadir di Gandaria City Mall – Destinasi Baru untuk Pecinta Makeup, Skincare, dan Fashion Muslimah', 
    'Arif Febriansyah', 
    'Sabtu', 
    '01-03-2025', 
    NULL, 
    NULL, 
    NULL, 
    '<p><strong>Kabar gembira untuk para beauty lovers!</strong> SS Your Makeup kini hadir lebih dekat dengan kamu melalui SS Store yang baru dibuka di **Gandaria City Mall, Lantai 2, Jakarta Selatan**. Tidak hanya sekadar tempat belanja, store ini menjadi destinasi lengkap bagi para pecinta makeup, skincare, dan fashion Muslimah. Mengusung konsep <strong>luxury, modern, dan elegan</strong>, SS Store menghadirkan pengalaman belanja eksklusif yang nyaman dan penuh inspirasi.</p>

    <h2>1. Grand Opening yang Meriah dengan Artis Ternama</h2>
    <p>Acara grand opening SS Store di Gandaria City Mall berlangsung meriah dengan kehadiran berbagai artis dan fashion expert ternama. **Shella Saukia menggandeng Ivan Gunawan, Caren Delano, dan Raline Shah** sebagai bagian dari perayaan launching ini. Kehadiran mereka semakin memperkuat posisi SS Store sebagai destinasi fashion dan kecantikan eksklusif yang siap memenuhi kebutuhan perempuan Indonesia.</p>

    <h2>2. Lebih dari Sekadar Toko Makeup</h2>
    <p>SS Store bukan hanya tempat untuk membeli produk makeup. Di sini, kamu bisa mendapatkan berbagai produk **skincare unggulan dari SS Skin (<a href="https://ssskin.co.id" target="_blank">ssskin.co.id</a>)** yang telah terbukti secara dermatologi, serta koleksi **fashion Muslimah dari Shella Saukia (<a href="https://shellasaukia.co" target="_blank">shellasaukia.co</a>)**. Semua produk dikurasi dengan standar kualitas tinggi untuk memastikan pelanggan mendapatkan yang terbaik.</p>

    <h2>3. Koleksi Terbaru SS Your Makeup Tersedia di Store</h2>
    <p>SS Your Makeup menghadirkan koleksi terbaru secara eksklusif di SS Store. Mulai dari **Luxe Aura Baked Blush, Velvet Glow Cushion, hingga Hydrating Lip Serum**, semua produk hadir untuk menunjang tampilan flawless kamu. Produk-produk ini dirancang dengan formula berkualitas tinggi, ringan di kulit, dan tahan lama.</p>

    <h2>4. Kenyamanan Berbelanja dengan Layanan Eksklusif</h2>
    <p>Berkunjung ke SS Store bukan hanya soal belanja, tetapi juga menikmati pengalaman premium. Dengan desain interior yang modern dan elegan, setiap sudut store dibuat nyaman untuk eksplorasi produk. Kamu juga bisa mendapatkan konsultasi langsung dari SPG yang memiliki pemahaman mendalam mengenai setiap produk yang tersedia.</p>

    <h2>5. Destinasi Beauty & Fashion di Jakarta</h2>
    <p>Dengan kehadiran SS Store di **Gandaria City Mall, Lantai 2**, kini kamu bisa langsung mencoba dan merasakan kualitas produk-produk SS Your Makeup, SS Skin, dan koleksi fashion Shella Saukia. Ini adalah tempat yang sempurna bagi kamu yang ingin tampil lebih percaya diri dengan produk lokal berkualitas internasional.</p>

    <h2>Kesimpulan</h2>
    <p>Hadirnya **SS Store di Gandaria City Mall** menjadi langkah besar dalam memperkuat eksistensi SS Your Makeup di industri kecantikan. Dengan produk-produk unggulan dan pengalaman belanja eksklusif, store ini siap menjadi destinasi favorit para beauty enthusiasts.</p>

    <p>Jadi, jangan lewatkan kesempatan untuk mengunjungi SS Store! Rasakan pengalaman belanja yang berbeda dan temukan produk kecantikan serta fashion favoritmu di satu tempat.</p>',
    'Jakarta',
    'Posted',
    NOW(),
    NULL,
    NULL
);



-- 2. Artikel kedua
INSERT INTO article (
    id, 
    id_title, 
    title, 
    creator, 
    day, 
    date, 
    link_img, 
    public_id, 
    caption_img, 
    description, 
    place, 
    status, 
    created_at, 
    updated_at, 
    deleted_at
) VALUES (
    UUID(), 
    'makeup-tahan-lama-seharian-ikuti-5-tips-ini', 
    'Makeup Tahan Lama Seharian? Ikuti 5 Tips Ini Agar Wajah Tetap Flawless!', 
    'Arif Febriansyah', 
    'Sabtu', 
    '01-03-2025', 
    NULL, 
    NULL, 
    NULL, 
    '<p><strong>Siapa yang tidak ingin makeup tetap flawless seharian?</strong> Namun, sering kali makeup cepat luntur akibat cuaca panas, minyak berlebih, atau aktivitas yang padat. Hasilnya, wajah terlihat kusam, foundation mulai crack, dan lipstik menghilang tanpa jejak. Jangan khawatir! Dengan teknik yang tepat, kamu bisa mendapatkan tampilan makeup yang awet sepanjang hari. Berikut adalah <strong>5 tips penting</strong> agar makeup tetap fresh dan flawless hingga malam hari.</p>

    <h2>1. Persiapkan Kulit Sebelum Makeup</h2>
    <p>Makeup yang tahan lama selalu dimulai dari kulit yang sehat. Sebelum mengaplikasikan makeup, pastikan wajahmu dalam kondisi bersih dan terhidrasi dengan baik. Cuci wajah menggunakan facial wash yang sesuai dengan jenis kulitmu, lalu lanjutkan dengan toner, serum, dan pelembap.</p>

    <p>Pelembap sangat penting untuk menjaga kulit tetap lembut dan tidak kering, yang dapat menyebabkan foundation mudah pecah. Jika kulitmu berminyak, gunakan pelembap ringan berbasis gel yang cepat meresap. Sedangkan untuk kulit kering, pilih pelembap dengan kandungan hydrating seperti hyaluronic acid.</p>

    <h2>2. Gunakan Primer yang Sesuai dengan Jenis Kulit</h2>
    <p>Primer adalah rahasia utama agar makeup menempel lebih lama. Pilih primer yang sesuai dengan jenis kulitmu—jika kulitmu berminyak, gunakan primer matte yang dapat mengontrol minyak berlebih. Jika kulitmu kering, pilih primer dengan efek hydrating agar kulit tetap lembap.</p>

    <h2>3. Gunakan Teknik Layering untuk Foundation</h2>
    <p>Salah satu kesalahan terbesar dalam makeup adalah mengaplikasikan foundation dalam jumlah banyak sekaligus. Teknik yang lebih efektif adalah <strong>layering</strong>, yaitu mengaplikasikan foundation dalam lapisan tipis dan membaurkannya secara perlahan. Gunakan beauty sponge yang lembap untuk hasil yang lebih natural dan seamless.</p>

    <h2>4. Kunci dengan Setting Powder dan Setting Spray</h2>
    <p>Setelah mengaplikasikan foundation dan concealer, jangan lupa mengunci makeup dengan setting powder. Gunakan powder translucent jika ingin tampilan yang ringan dan natural, atau powder berwarna untuk coverage ekstra.</p>

    <p>Langkah terakhir yang tidak boleh dilewatkan adalah <strong>setting spray</strong>. Produk ini membantu makeup agar lebih menyatu dengan kulit dan memberikan efek tahan lama. Semprotkan setting spray dengan jarak 20-30 cm dari wajah, lalu biarkan mengering secara alami.</p>

    <h2>5. Pilih Produk Waterproof</h2>
    <p>Jika kamu ingin makeup bertahan lebih lama, pastikan memilih produk yang memiliki formula waterproof. Eyeliner, mascara, dan lipstik waterproof dapat membantu menghindari smudging dan memastikan makeup tetap on point sepanjang hari.</p>

    <h2>Jangan Lupakan Blotting Paper</h2>
    <p>Bagi kamu yang memiliki kulit berminyak, <strong>blotting paper</strong> bisa menjadi penyelamat. Kertas ini membantu menyerap minyak berlebih tanpa menghapus makeup. Bawa blotting paper ke mana pun kamu pergi, terutama jika kamu beraktivitas seharian di luar ruangan.</p>

    <h2>Hindari Menyentuh Wajah Secara Berlebihan</h2>
    <p>Tanpa disadari, kebiasaan menyentuh wajah dengan tangan dapat membuat makeup cepat luntur dan menyebarkan bakteri ke kulit. Jika ingin merapikan makeup, gunakan sponge atau brush, bukan tangan.</p>

    <h2>Rutin Touch-Up dengan Produk yang Ringan</h2>
    <p>Untuk menjaga makeup tetap fresh, lakukan touch-up dengan produk yang ringan seperti cushion foundation atau powder compact. Hindari menumpuk foundation terlalu banyak karena bisa membuat wajah terlihat cakey.</p>

    <h2>Kesimpulan</h2>
    <p>Dengan teknik yang tepat, kamu bisa mendapatkan makeup yang tahan lama sepanjang hari. Mulai dari <strong>persiapan kulit, penggunaan primer, teknik layering foundation, hingga setting spray</strong>, semuanya berperan dalam menjaga makeup tetap flawless. Jangan lupa pilih produk yang sesuai dengan jenis kulitmu agar hasilnya lebih maksimal.</p>

    <p>Jadi, apakah kamu siap tampil flawless seharian? Coba terapkan 5 tips di atas dan rasakan perbedaannya!</p>',
    'Jakarta',
    'Posted',
    NOW(),
    NULL,
    NULL
);


-- 3 Artikel ketiga
INSERT INTO article (
    id, 
    id_title, 
    title, 
    creator, 
    day, 
    date, 
    link_img, 
    public_id, 
    caption_img, 
    description, 
    place, 
    status, 
    created_at, 
    updated_at, 
    deleted_at
) VALUES (
    UUID(), 
    'cara-memilih-shade-foundation-yang-sesuai-dengan-warna-kulit', 
    'Cara Memilih Shade Foundation yang Sesuai dengan Warna Kulit – Temukan Match yang Sempurna!', 
    'Arif Febriansyah', 
    'Sabtu', 
    '01-03-2025', 
    NULL, 
    NULL, 
    NULL, 
    '<p><strong>Foundation adalah kunci utama dalam makeup.</strong> Pemilihan shade yang tepat bisa membuat kulit terlihat flawless, natural, dan menyatu dengan sempurna. Namun, tidak sedikit orang yang masih bingung menentukan warna foundation yang sesuai dengan kulit mereka. Jika terlalu terang, wajah bisa terlihat abu-abu dan tidak natural. Jika terlalu gelap, hasilnya bisa tampak kusam. Lalu, bagaimana cara menemukan shade foundation yang paling cocok? Simak panduan lengkap berikut ini!</p>

    <h2>Kenali Undertone Kulitmu</h2>
    <p>Sebelum memilih foundation, langkah pertama yang harus kamu lakukan adalah mengetahui <strong>undertone kulit</strong>. Undertone adalah warna dasar kulit yang tidak akan berubah meskipun kulit mengalami perubahan warna karena sinar matahari atau perawatan tertentu.</p>

    <p>Ada tiga jenis undertone utama:</p>
    <ul>
      <li><strong>Warm Undertone</strong>: Jika urat nadi di pergelangan tanganmu tampak hijau dan kulitmu terlihat lebih keemasan di bawah sinar matahari, maka undertone-mu cenderung hangat.</li>
      <li><strong>Cool Undertone</strong>: Jika urat nadimu tampak kebiruan atau ungu dan kulitmu lebih cocok dengan perhiasan perak, maka kamu memiliki undertone dingin.</li>
      <li><strong>Neutral Undertone</strong>: Jika urat nadimu memiliki campuran warna hijau dan biru, dan kamu bisa menggunakan perhiasan emas maupun perak dengan sama bagusnya, maka undertone-mu netral.</li>
    </ul>

    <h2>Pilih Shade yang Sesuai dengan Undertone</h2>
    <p>Setelah mengetahui undertone, langkah selanjutnya adalah memilih shade foundation yang sesuai. Biasanya, foundation memiliki label seperti warm (W), cool (C), atau neutral (N). Jika foundation favoritmu tidak mencantumkan label tersebut, kamu bisa mencobanya langsung di kulit.</p>

    <h2>Uji Coba Foundation di Area yang Tepat</h2>
    <p>Banyak orang mencoba foundation di punggung tangan atau pergelangan tangan, padahal itu bukan area terbaik. Untuk hasil paling akurat, aplikasikan foundation di <strong>garis rahang</strong> atau bagian bawah pipi. Pilih shade yang paling menyatu dengan warna leher agar hasil akhirnya terlihat natural dan tidak belang.</p>

    <h2>Cek Warna Foundation di Pencahayaan yang Berbeda</h2>
    <p>Pencahayaan memainkan peran besar dalam tampilan foundation. Cahaya putih di dalam toko bisa membuat foundation tampak lebih terang, sementara cahaya kuning bisa membuatnya terlihat lebih hangat. Sebaiknya, setelah mencoba foundation, periksa hasilnya di bawah cahaya alami matahari untuk memastikan shade yang dipilih benar-benar cocok.</p>

    <h2>Sesuaikan dengan Jenis Kulit</h2>
    <p>Pemilihan shade juga harus disesuaikan dengan jenis kulitmu. Jika kamu memiliki kulit berminyak, pilih foundation matte yang dapat menahan minyak berlebih. Untuk kulit kering, pilih foundation yang mengandung pelembap agar tidak terlihat pecah-pecah.</p>

    <h2>Pertimbangkan Perubahan Warna Kulit</h2>
    <p>Beberapa orang mengalami perubahan warna kulit karena paparan sinar matahari. Jika kulitmu cenderung menggelap saat sering terpapar matahari, sebaiknya pilih dua shade foundation—satu untuk warna kulit saat cerah dan satu untuk warna kulit saat lebih gelap. Dengan begitu, kamu bisa mencampur kedua shade tersebut untuk mendapatkan warna yang sempurna.</p>

    <h2>Gunakan Teknik Blending yang Tepat</h2>
    <p>Setelah menemukan shade yang tepat, pastikan kamu mengaplikasikannya dengan cara yang benar. Gunakan beauty sponge yang lembap atau brush untuk membaurkan foundation agar hasilnya merata dan tidak terlihat tebal. Teknik blending yang baik akan membuat foundation menyatu dengan kulit secara natural.</p>

    <h2>Konsultasikan dengan Ahli Kecantikan</h2>
    <p>Jika masih ragu, kamu bisa berkonsultasi dengan makeup artist atau mencoba foundation langsung di counter kosmetik. Beberapa brand juga menyediakan fitur virtual try-on yang memungkinkan kamu melihat bagaimana foundation terlihat di wajahmu sebelum membeli.</p>

    <h2>Kesimpulan</h2>
    <p>Memilih shade foundation yang sesuai memang membutuhkan sedikit eksperimen, tetapi dengan memahami <strong>undertone kulit, menguji foundation di area yang tepat, serta mempertimbangkan pencahayaan dan jenis kulit</strong>, kamu bisa menemukan warna yang paling cocok untukmu.</p>

    <p>Jadi, sudah siap menemukan foundation yang paling pas? Yuk, coba tips ini dan pastikan makeup-mu terlihat natural dan sempurna sepanjang hari!</p>',
    'Jakarta',
    'Posted',
    NOW(),
    NULL,
    NULL
);

-- 4 Artikel Keempat
INSERT INTO article (
    id, 
    id_title, 
    title, 
    creator, 
    day, 
    date, 
    link_img, 
    public_id, 
    caption_img, 
    description, 
    place, 
    status, 
    created_at, 
    updated_at, 
    deleted_at
) VALUES (
    UUID(), 
    'rahasia-kulit-flawless-dengan-teknik-makeup-no-makeup-look', 
    'Rahasia Kulit Flawless dengan Teknik Makeup No-Makeup Look – Tampilan Natural yang Elegan', 
    'Arif Febriansyah', 
    'Sabtu', 
    '01-03-2025', 
    NULL, 
    NULL, 
    NULL, 
    '<p><strong>No-makeup look</strong> adalah tren kecantikan yang semakin populer karena memberikan tampilan wajah yang segar, alami, dan effortless. Teknik ini membuat kulit tampak flawless tanpa terlihat seperti memakai banyak makeup. Rahasianya? Menggunakan produk dengan formula ringan, membaurkan makeup dengan sempurna, dan menonjolkan fitur wajah secara natural. Jika kamu ingin mendapatkan tampilan <em>glowing</em> yang sehat dan tidak berlebihan, simak tips berikut!</p>

    <h2>1. Mulai dengan Skincare yang Tepat</h2>
    <p>Rahasia utama dari **no-makeup look** adalah kulit yang sehat. Oleh karena itu, pastikan kulitmu terhidrasi dengan baik sebelum mengaplikasikan makeup. Gunakan pembersih wajah yang lembut, lalu aplikasikan toner, serum, dan pelembap yang sesuai dengan jenis kulitmu.</p>

    <h2>2. Pilih Base Makeup yang Ringan</h2>
    <p>Hindari penggunaan foundation yang terlalu tebal. Sebagai gantinya, gunakan BB cream, CC cream, atau tinted moisturizer yang memberikan coverage ringan tetapi tetap menyamarkan ketidaksempurnaan.</p>

    <h2>3. Teknik Blending adalah Kunci</h2>
    <p>Salah satu faktor yang membuat makeup terlihat natural adalah blending yang sempurna. Gunakan beauty sponge yang lembap atau kuas dengan bulu halus untuk membaurkan base makeup agar menyatu dengan kulit tanpa garis atau cakey.</p>

    <h2>4. Gunakan Blush On untuk Efek Wajah Segar</h2>
    <p>Untuk mendapatkan efek wajah yang segar, aplikasikan **blush on dengan tekstur krim atau liquid**. Pilih warna yang mendekati rona alami pipimu saat tersenyum, seperti peach atau soft pink.</p>

    <h2>5. Rapikan Alis dengan Natural</h2>
    <p>Alih-alih membuat alis terlalu tegas, cukup gunakan eyebrow gel atau pensil alis dengan warna yang mendekati warna rambutmu. Isi bagian alis yang kosong dengan goresan ringan agar tetap terlihat natural.</p>

    <h2>6. Gunakan Maskara untuk Tampilan Mata Segar</h2>
    <p>Hindari penggunaan eyeliner yang terlalu tebal, cukup gunakan maskara yang dapat memberikan efek bulu mata lentik dan terpisah rapi.</p>

    <h2>7. Bibir Natural dengan Lip Balm atau Lip Tint</h2>
    <p>Pilih lip balm berwarna atau lip tint untuk memberikan efek bibir yang sehat dan merona alami.</p>

    <h2>8. Kunci dengan Setting Spray</h2>
    <p>Untuk menjaga tampilan makeup agar tetap fresh sepanjang hari, semprotkan setting spray dengan hasil akhir dewy atau natural finish.</p>

    <h2>Kesimpulan</h2>
    <p>**No-makeup look** bukan berarti tidak memakai makeup sama sekali, tetapi lebih ke teknik menggunakan produk dengan cara yang tepat agar tampilan tetap fresh dan alami.</p>

    <p>Jadi, apakah kamu siap mencoba tren makeup ini? Yuk, eksplorasi kecantikan alami dengan teknik **no-makeup look**!</p>',
    'Jakarta',
    'Posted',
    NOW(),
    NULL,
    NULL
);

-- 5. Artikel Kelima
INSERT INTO article (
    id, 
    id_title, 
    title, 
    creator, 
    day, 
    date, 
    link_img, 
    public_id, 
    caption_img, 
    description, 
    place, 
    status, 
    created_at, 
    updated_at, 
    deleted_at
) VALUES (
    UUID(), 
    'panduan-lengkap-menggunakan-cushion-foundation-untuk-hasil-flawless', 
    'Panduan Lengkap Menggunakan Cushion Foundation untuk Hasil Flawless – Rahasia Makeup Tampak Natural', 
    'Arif Febriansyah', 
    'Sabtu', 
    '01-03-2025', 
    NULL, 
    NULL, 
    NULL, 
    '<p><strong>Cushion foundation</strong> menjadi salah satu produk makeup yang semakin digemari karena kepraktisannya. Berbeda dengan foundation cair dalam botol, cushion foundation dikemas dalam compact yang dilengkapi spons aplikator, sehingga lebih mudah digunakan kapan saja dan di mana saja. Namun, untuk mendapatkan hasil yang flawless dan tahan lama, ada beberapa teknik yang perlu diperhatikan. Yuk, simak panduan lengkapnya!</p>

    <h2>1. Persiapkan Kulit Sebelum Mengaplikasikan Cushion</h2>
    <p>Langkah pertama yang tidak boleh dilewatkan adalah **persiapan kulit**. Pastikan wajah dalam kondisi bersih dan terhidrasi sebelum mengaplikasikan cushion foundation.</p>

    <h2>2. Pilih Shade Cushion yang Sesuai dengan Warna Kulit</h2>
    <p>Memilih shade cushion foundation yang sesuai sangat penting untuk mendapatkan tampilan yang natural. Jangan memilih shade yang terlalu terang atau terlalu gelap, karena bisa membuat wajah terlihat tidak proporsional.</p>

    <h2>3. Gunakan Spons Aplikator dengan Teknik yang Tepat</h2>
    <p>Salah satu keunggulan cushion foundation adalah aplikator spons yang mempermudah penggunaannya. Untuk hasil yang flawless, gunakan teknik **tapping** atau menepuk-nepuk ringan cushion ke kulit, bukan menggeseknya.</p>

    <h2>4. Gunakan Layering untuk Coverage yang Diinginkan</h2>
    <p>Cushion foundation biasanya memiliki coverage yang buildable, artinya kamu bisa mengaplikasikan beberapa lapisan sesuai kebutuhan.</p>

    <h2>5. Jangan Lupakan Concealer untuk Menyamarkan Noda</h2>
    <p>Jika cushion foundation belum cukup untuk menutupi noda atau dark circles, gunakan concealer dengan shade yang lebih terang untuk area bawah mata.</p>

    <h2>6. Set dengan Bedak agar Makeup Lebih Tahan Lama</h2>
    <p>Meskipun cushion foundation memberikan efek dewy, agar lebih tahan lama, gunakan bedak tabur atau compact powder di area yang mudah berminyak.</p>

    <h2>7. Gunakan Setting Spray untuk Mengunci Makeup</h2>
    <p>Langkah terakhir agar cushion foundation lebih tahan lama adalah menyemprotkan **setting spray**.</p>

    <h2>8. Touch-Up dengan Cushion untuk Tampilan Segar</h2>
    <p>Salah satu kelebihan cushion foundation adalah kemudahannya untuk touch-up.</p>

    <h2>Kesimpulan</h2>
    <p>Dengan teknik yang tepat, cushion foundation bisa memberikan hasil yang flawless dan natural. Mulai dari **persiapan kulit, pemilihan shade yang sesuai, teknik aplikasi, hingga setting spray**, semuanya berperan dalam menciptakan tampilan makeup yang sempurna dan tahan lama.</p>

    <p>Jadi, sudah siap tampil cantik dengan cushion foundation? Yuk, coba teknik ini dan rasakan hasilnya!</p>',
    'Jakarta',
    'Posted',
    NOW(),
    NULL,
    NULL
);

-- 6.Artikel Keenam
INSERT INTO article (
    id, 
    id_title, 
    title, 
    creator, 
    day, 
    date, 
    link_img, 
    public_id, 
    caption_img, 
    description, 
    place, 
    status, 
    created_at, 
    updated_at, 
    deleted_at
) VALUES (
    UUID(), 
    'teknik-contouring-wajah-untuk-tampilan-lebih-definisi', 
    'Teknik Contouring Wajah untuk Tampilan Lebih Definisi – Panduan Lengkap untuk Hasil Natural dan Proporsional', 
    'Arif Febriansyah', 
    'Sabtu', 
    '01-03-2025', 
    NULL, 
    NULL, 
    NULL, 
    '<p><strong>Contouring</strong> adalah teknik makeup yang dapat memberikan ilusi wajah lebih tirus, tegas, dan proporsional. Dengan permainan warna terang dan gelap, kamu bisa membentuk wajah agar terlihat lebih berdimensi tanpa harus melakukan prosedur kosmetik. Namun, teknik ini sering dianggap sulit bagi pemula. Untuk mendapatkan hasil yang natural, ada beberapa hal yang perlu diperhatikan. Yuk, pelajari panduan lengkapnya!</p>

    <h2>1. Kenali Bentuk Wajahmu</h2>
    <p>Sebelum mulai contouring, penting untuk mengetahui bentuk wajahmu. Setiap bentuk wajah memiliki teknik contour yang berbeda untuk hasil terbaik.</p>

    <ul>
      <li><strong>Wajah Oval</strong>: Teknik contouring lebih ringan, hanya untuk memberikan sedikit dimensi pada area dahi dan rahang.</li>
      <li><strong>Wajah Bulat</strong>: Fokus pada shading di bagian samping pipi agar terlihat lebih tirus.</li>
      <li><strong>Wajah Kotak</strong>: Soft contour di bagian rahang agar terlihat lebih halus.</li>
      <li><strong>Wajah Hati</strong>: Fokus shading di dahi bagian atas dan dagu agar terlihat lebih seimbang.</li>
    </ul>

    <h2>2. Pilih Produk Contour yang Tepat</h2>
    <p>Contour tersedia dalam berbagai bentuk, seperti powder, cream, dan stick. Jika ingin hasil yang lebih natural, gunakan contour powder. Namun, jika ingin hasil yang lebih tahan lama dan intens, contour cream atau stick bisa menjadi pilihan.</p>

    <h2>3. Gunakan Teknik Aplikasi yang Benar</h2>
    <p>Teknik pengaplikasian contour sangat menentukan hasil akhirnya. Gunakan brush berbulu halus untuk contour powder, dan gunakan sponge atau jari untuk contour cream. Teknik yang benar adalah dengan membaurkan produk secara bertahap agar hasilnya natural.</p>

    <h2>4. Tentukan Area Contouring</h2>
    <p>Ada beberapa area utama dalam wajah yang perlu dikontur untuk mendapatkan dimensi yang proporsional:</p>

    <ul>
      <li><strong>Pipi</strong>: Aplikasikan contour dari bagian telinga menuju tengah pipi, lalu baurkan ke atas.</li>
      <li><strong>Hidung</strong>: Gunakan contour tipis di sisi hidung untuk tampilan lebih ramping.</li>
      <li><strong>Dahi</strong>: Shading di area dahi bagian atas untuk mengurangi kesan dahi lebar.</li>
      <li><strong>Rahang</strong>: Gunakan contour di bagian bawah rahang untuk ilusi wajah lebih tirus.</li>
    </ul>

    <h2>5. Gunakan Highlighter untuk Efek Kontras</h2>
    <p>Setelah contouring, jangan lupa menambahkan highlighter untuk menciptakan efek kontras. Aplikasikan di area tulang pipi, batang hidung, dahi, dan dagu agar wajah terlihat lebih bercahaya dan berdimensi.</p>

    <h2>6. Blending Adalah Kunci</h2>
    <p>Pastikan semua produk sudah terbaur dengan baik agar tidak terlihat garis yang tajam. Teknik blending yang baik akan menciptakan tampilan natural tanpa efek terlalu tebal.</p>

    <h2>7. Set dengan Bedak agar Tahan Lama</h2>
    <p>Untuk memastikan contouring bertahan sepanjang hari, gunakan setting powder atau setting spray. Ini akan membantu mengunci makeup agar tidak mudah luntur.</p>

    <h2>Kesimpulan</h2>
    <p>Teknik contouring bisa memberikan dimensi pada wajah dan membuat fitur terlihat lebih tegas. Dengan memahami bentuk wajah, memilih produk yang tepat, dan menggunakan teknik blending yang benar, kamu bisa mendapatkan hasil yang natural dan profesional.</p>

    <p>Jadi, siap mencoba teknik contouring untuk tampilan wajah lebih definisi? Yuk, eksplorasi dan temukan gaya makeup yang paling cocok untukmu!</p>',
    'Jakarta',
    'Posted',
    NOW(),
    NULL,
    NULL
);


--7. Artikel ketujuh
INSERT INTO article (
    id, 
    id_title, 
    title, 
    creator, 
    day, 
    date, 
    link_img, 
    public_id, 
    caption_img, 
    description, 
    place, 
    status, 
    created_at, 
    updated_at, 
    deleted_at
) VALUES (
    UUID(), 
    'tips-membuat-riasan-mata-yang-tajam-dan-dramatis', 
    'Tips Membuat Riasan Mata yang Tajam dan Dramatis – Panduan Makeup Mata untuk Tampilan Memukau', 
    'Arif Febriansyah', 
    'Sabtu', 
    '01-03-2025', 
    NULL, 
    NULL, 
    NULL, 
    '<p><strong>Riasan mata</strong> adalah salah satu elemen penting dalam makeup yang bisa mengubah keseluruhan tampilan wajah. Dengan teknik yang tepat, kamu bisa menciptakan tampilan mata yang lebih besar, tajam, dan dramatis, baik untuk acara spesial maupun pemakaian sehari-hari. Jika ingin mempertegas bentuk mata dengan eyeliner, eyeshadow, dan maskara, yuk simak panduan lengkapnya!</p>

    <h2>1. Gunakan Primer Mata agar Makeup Lebih Tahan Lama</h2>
    <p>Primer mata adalah langkah pertama yang sering diabaikan, padahal ini sangat penting untuk menjaga eyeshadow tetap intens dan tahan lama. Aplikasikan primer tipis-tipis di kelopak mata sebelum menggunakan eyeshadow agar warnanya lebih keluar dan tidak mudah creasing.</p>

    <h2>2. Pilih Eyeshadow yang Sesuai dengan Bentuk Mata</h2>
    <p>Warna dan teknik aplikasi eyeshadow bisa sangat mempengaruhi tampilan akhir riasan mata. Jika memiliki kelopak mata kecil atau hooded eyes, pilih warna-warna netral dengan shimmer di bagian tengah untuk memberi ilusi mata yang lebih besar. Untuk tampilan smokey eyes yang dramatis, gunakan gradasi warna gelap di sudut luar mata dan baurkan dengan warna transisi yang lebih terang.</p>

    <h2>3. Teknik Blending Adalah Kunci</h2>
    <p>Riasan mata yang tajam namun tetap terlihat profesional membutuhkan teknik blending yang baik. Gunakan kuas blending yang lembut dan gerakan memutar untuk menghilangkan garis-garis kasar antara warna eyeshadow. Jangan biarkan eyeshadow terlihat bertumpuk tanpa gradasi yang halus.</p>

    <h2>4. Gunakan Eyeliner untuk Membentuk Mata</h2>
    <p>Eyeliner adalah senjata utama untuk menciptakan tampilan mata yang lebih tajam. Pilih eyeliner cair atau gel untuk hasil yang lebih presisi, atau eyeliner pensil untuk tampilan lebih lembut. Teknik winged liner bisa membantu mata terlihat lebih terangkat dan ekspresif.</p>

    <h2>5. Teknik Tightlining agar Mata Terlihat Lebih Tajam</h2>
    <p>Tightlining adalah teknik mengisi garis waterline bagian atas dengan eyeliner hitam untuk menciptakan ilusi bulu mata yang lebih tebal dan mata yang lebih tajam. Teknik ini cocok bagi yang ingin tampilan natural tetapi tetap ingin mata terlihat lebih berdimensi.</p>

    <h2>6. Gunakan Maskara untuk Bulu Mata Lentik dan Tebal</h2>
    <p>Maskara berperan besar dalam mempertegas riasan mata. Pilih maskara dengan formula yang bisa memperpanjang dan menebalkan bulu mata. Jangan lupa menggunakan penjepit bulu mata sebelum aplikasi maskara untuk mendapatkan efek mata yang lebih terbuka.</p>

    <h2>7. Tambahkan Eyelashes untuk Efek Lebih Dramatis</h2>
    <p>Untuk tampilan yang lebih bold, gunakan bulu mata palsu yang sesuai dengan bentuk mata. Jika ingin efek natural, pilih bulu mata dengan helaian yang ringan dan panjang bertingkat. Untuk tampilan lebih dramatis, gunakan bulu mata yang lebih tebal di bagian luar.</p>

    <h2>8. Highlight Sudut Mata dan Tulang Alis</h2>
    <p>Sentuhan akhir yang tidak boleh dilewatkan adalah menambahkan highlighter di sudut dalam mata dan di bawah tulang alis. Ini akan membuat mata terlihat lebih segar dan terbuka.</p>

    <h2>9. Gunakan Setting Spray agar Makeup Mata Bertahan Seharian</h2>
    <p>Agar hasil riasan mata tetap tajam dan tidak mudah luntur, akhiri dengan setting spray. Ini akan membantu menjaga tampilan makeup tetap fresh meskipun dipakai seharian.</p>

    <h2>Kesimpulan</h2>
    <p>Riasan mata yang tajam dan dramatis bisa dicapai dengan kombinasi teknik yang tepat, mulai dari **penggunaan primer, blending eyeshadow, eyeliner presisi, hingga maskara dan bulu mata palsu**. Dengan latihan yang rutin, kamu bisa menciptakan tampilan mata yang lebih ekspresif dan menawan.</p>

    <p>Jadi, siap bereksperimen dengan makeup mata? Coba tips di atas dan temukan tampilan yang paling sesuai untukmu!</p>',
    'Jakarta',
    'Posted',
    NOW(),
    NULL,
    NULL
);


-- 8.Artikel kedelapan
INSERT INTO article (
    id, 
    id_title, 
    title, 
    creator, 
    day, 
    date, 
    link_img, 
    public_id, 
    caption_img, 
    description, 
    place, 
    status, 
    created_at, 
    updated_at, 
    deleted_at
) VALUES (
    UUID(), 
    'rahasia-bibir-lembut-dan-sehat-dengan-lip-care-routine', 
    'Rahasia Bibir Lembut dan Sehat dengan Lip Care Routine yang Benar – Panduan Perawatan Bibir Agar Tidak Kering dan Pecah-Pecah', 
    'Arif Febriansyah', 
    'Sabtu', 
    '01-03-2025', 
    NULL, 
    NULL, 
    NULL, 
    '<p><strong>Bibir yang lembut, sehat, dan bebas dari pecah-pecah</strong> adalah dambaan setiap orang, terutama bagi mereka yang sering menggunakan lipstik atau produk bibir lainnya. Bibir yang kering bisa membuat tampilan makeup kurang maksimal dan bahkan menyebabkan rasa tidak nyaman. Untuk mendapatkan bibir yang sehat dan terawat, kamu perlu mengikuti <strong>lip care routine</strong> yang benar. Yuk, simak tips perawatannya berikut ini!</p>

    <h2>1. Rutin Eksfoliasi untuk Mengangkat Sel Kulit Mati</h2>
    <p>Eksfoliasi bibir adalah langkah pertama dalam perawatan bibir. Kulit bibir yang kering dan mengelupas bisa menghambat penyerapan lip balm atau lip serum yang kamu gunakan. Gunakan scrub bibir yang lembut dengan bahan alami seperti madu dan gula untuk membantu mengangkat sel kulit mati.</p>

    <h2>2. Gunakan Lip Balm yang Mengandung Pelembap Alami</h2>
    <p>Setelah eksfoliasi, pastikan bibir mendapatkan kelembapan yang cukup. Pilih lip balm yang mengandung bahan-bahan alami seperti shea butter, jojoba oil, atau squalane. Hindari lip balm yang mengandung menthol atau camphor karena dapat membuat bibir semakin kering.</p>

    <h2>3. Terapkan Lip Serum untuk Menutrisi Bibir</h2>
    <p>Selain lip balm, lip serum juga penting untuk menutrisi bibir lebih dalam. Lip serum biasanya mengandung bahan aktif seperti vitamin E dan hyaluronic acid yang membantu memperbaiki tekstur bibir dan menjaga kelembapan lebih lama.</p>

    <h2>4. Minum Air yang Cukup agar Bibir Tidak Kering</h2>
    <p>Dehidrasi adalah salah satu penyebab utama bibir kering dan pecah-pecah. Pastikan kamu minum cukup air setiap hari untuk menjaga kelembapan alami bibir dari dalam.</p>

    <h2>5. Hindari Kebiasaan Menjilat dan Menggigit Bibir</h2>
    <p>Banyak orang tanpa sadar memiliki kebiasaan menjilat atau menggigit bibir saat merasa kering. Padahal, air liur bisa membuat bibir semakin kering karena menguap dengan cepat. Jika bibir terasa kering, sebaiknya langsung aplikasikan lip balm.</p>

    <h2>6. Gunakan Lip Mask Sebelum Tidur</h2>
    <p>Untuk perawatan ekstra, gunakan lip mask sebelum tidur. Lip mask bekerja seperti masker wajah tetapi khusus untuk bibir. Gunakan produk dengan kandungan pelembap tinggi seperti honey atau petroleum jelly untuk memberikan hidrasi intensif semalaman.</p>

    <h2>7. Pilih Lipstik yang Mengandung Pelembap</h2>
    <p>Jika kamu sering menggunakan lipstik, pilih formula yang mengandung pelembap seperti lip butter atau lip tint berbasis air. Hindari lipstik matte yang terlalu kering jika tidak menggunakan lip balm sebelumnya.</p>

    <h2>8. Gunakan Sunscreen Bibir untuk Perlindungan</h2>
    <p>Bibir juga perlu perlindungan dari sinar matahari. Pilih lip balm atau lipstik dengan SPF untuk mencegah bibir menggelap atau mengalami kerusakan akibat sinar UV.</p>

    <h2>9. Konsumsi Makanan Kaya Vitamin untuk Menjaga Kesehatan Bibir</h2>
    <p>Makanan yang kaya akan vitamin C, vitamin E, dan omega-3 sangat baik untuk kesehatan bibir. Konsumsi buah-buahan, sayuran, dan kacang-kacangan agar bibir tetap sehat dan tidak mudah kering.</p>

    <h2>Kesimpulan</h2>
    <p>Perawatan bibir yang benar tidak hanya bergantung pada penggunaan produk luar seperti lip balm dan lip mask, tetapi juga harus didukung dengan hidrasi yang cukup dan pola makan sehat. Dengan mengikuti langkah-langkah di atas, kamu bisa mendapatkan bibir yang lembut, sehat, dan selalu siap untuk tampilan makeup terbaik.</p>

    <p>Jadi, sudah siap mencoba <strong>lip care routine</strong> yang tepat? Yuk, mulai rawat bibirmu dari sekarang!</p>',
    'Jakarta',
    'Posted',
    NOW(),
    NULL,
    NULL
);

-- 9. Artikel kesembilan
INSERT INTO article (
    id, 
    id_title, 
    title, 
    creator, 
    day, 
    date, 
    link_img, 
    public_id, 
    caption_img, 
    description, 
    place, 
    status, 
    created_at, 
    updated_at, 
    deleted_at
) VALUES (
    UUID(), 
    'inspirasi-makeup-natural-untuk-sehari-hari-yang-simpel-dan-elegan', 
    'Inspirasi Makeup Natural untuk Sehari-hari yang Simpel dan Elegan – Panduan Tampilan Fresh Tanpa Ribet', 
    'Arif Febriansyah', 
    'Sabtu', 
    '01-03-2025', 
    NULL, 
    NULL, 
    NULL, 
    '<p><strong>Makeup natural</strong> adalah tren yang semakin digemari karena memberikan tampilan yang fresh, segar, dan effortless. Gaya ini cocok untuk digunakan sehari-hari, baik ke kantor, kampus, atau sekadar hangout. Kuncinya adalah menggunakan produk yang ringan, menyatu dengan kulit, dan tidak terlihat berlebihan. Yuk, intip inspirasi makeup natural yang simpel dan elegan untuk tampilan sehari-hari!</p>

    <h2>1. Gunakan Skincare Sebagai Dasar Makeup</h2>
    <p>Sebelum mengaplikasikan makeup, pastikan kulit dalam kondisi lembap dan sehat. Gunakan **moisturizer dan sunscreen** agar kulit tetap terlindungi dan makeup lebih menyatu. Pemakaian skincare yang tepat juga membuat tampilan makeup lebih glowing alami.</p>

    <h2>2. Pilih Base Makeup yang Ringan</h2>
    <p>Untuk tampilan natural, hindari foundation yang terlalu tebal. Sebagai gantinya, gunakan **BB cream, CC cream, atau tinted moisturizer** yang memberikan coverage ringan namun tetap meratakan warna kulit. Jika ada noda atau bekas jerawat, cukup gunakan concealer di area yang dibutuhkan.</p>

    <h2>3. Aplikasikan Bedak Transparan atau Loose Powder</h2>
    <p>Bedak transparan atau loose powder akan membantu mengunci base makeup tanpa membuatnya terlihat berat. Pilih bedak dengan hasil **soft-matte atau dewy finish** sesuai jenis kulitmu. Jika kulitmu cenderung berminyak, fokuskan aplikasi bedak pada area T-zone.</p>

    <h2>4. Berikan Sedikit Warna dengan Blush On</h2>
    <p>Blush on adalah kunci tampilan natural yang segar. Gunakan **blush bertekstur cream atau liquid** agar menyatu dengan kulit secara alami. Pilih warna peach, coral, atau pink muda untuk efek sehat alami pada wajah.</p>

    <h2>5. Bentuk Alis dengan Natural</h2>
    <p>Untuk riasan sehari-hari, alis tidak perlu terlalu bold. Cukup rapikan dengan eyebrow gel atau gunakan **pensil alis dengan warna natural** seperti coklat muda. Isi bagian yang kosong dengan sapuan ringan agar terlihat lebih penuh namun tetap natural.</p>

    <h2>6. Gunakan Eyeshadow Natural</h2>
    <p>Pilih warna-warna nude atau earth tone untuk riasan mata yang lembut. **Matte eyeshadow warna beige, taupe, atau soft brown** sangat cocok untuk tampilan minimalis namun tetap elegan.</p>

    <h2>7. Gunakan Eyeliner Tipis</h2>
    <p>Jika ingin tampilan mata lebih tajam, gunakan eyeliner tipis di bagian garis bulu mata. Pilih warna coklat atau hitam dengan teknik tightlining untuk memberi efek mata lebih besar tanpa terlihat berlebihan.</p>

    <h2>8. Lentikkan Bulu Mata dengan Maskara</h2>
    <p>Gunakan **maskara dengan efek natural** yang memperpanjang dan menebalkan bulu mata tanpa menggumpal. Jika ingin hasil yang lebih tahan lama, gunakan maskara waterproof.</p>

    <h2>9. Pilih Lipstik atau Lip Tint yang Natural</h2>
    <p>Gunakan lipstik dengan warna nude, peach, atau pink natural. **Lip tint atau lip balm berwarna** juga bisa menjadi pilihan untuk tampilan segar dan ringan sepanjang hari.</p>

    <h2>Kesimpulan</h2>
    <p>Makeup natural bukan berarti tanpa usaha, tetapi lebih ke arah riasan yang ringan, menyatu dengan kulit, dan memberikan efek sehat bercahaya. Dengan pemilihan produk yang tepat dan aplikasi yang minimalis, kamu bisa mendapatkan tampilan fresh yang effortless untuk aktivitas sehari-hari.</p>

    <p>Jadi, sudah siap tampil cantik natural setiap hari? Coba gaya makeup ini dan rasakan perbedaannya!</p>',
    'Jakarta',
    'Posted',
    NOW(),
    NULL,
    NULL
);


-- Artikel kesepuluh:
INSERT INTO article (
    id, 
    id_title, 
    title, 
    creator, 
    day, 
    date, 
    link_img, 
    public_id, 
    caption_img, 
    description, 
    place, 
    status, 
    created_at, 
    updated_at, 
    deleted_at
) VALUES (
    UUID(), 
    'persembahan-berssahaja-fashion-show-megah-shella-saukia-di-gandaria-city-mall', 
    'Persembahan Berssahaja: Fashion Show Megah Shella Saukia di Gandaria City Mall', 
    'Arif Febriansyah', 
    'Rabu', 
    '26-02-2025', 
    NULL, 
    NULL, 
    NULL, 
    '<p><strong>Shella Saukia</strong> kembali menghadirkan sebuah pertunjukan fashion yang spektakuler melalui fashion show bertajuk <strong>“Persembahan Berssahaja. Perempuan Indonesia. Berdaya-Berkarya-Bersinar.”</strong> yang digelar di **Main Atrium, Gandaria City Mall** pada Rabu, 26 Februari 2025. Acara ini menjadi wujud nyata dari komitmen Shella dalam mendukung perempuan Indonesia untuk terus berkarya, bersinar, dan menunjukkan keanggunannya di setiap langkah.</p>

    <h2>1. Perpaduan Seni, Budaya, dan Keanggunan Muslimah</h2>
    <p>Fashion show ini menjadi panggung megah bagi koleksi terbaru dari <a href="https://shellasaukia.co" target="_blank">Shellasaukia.co</a>, yang menampilkan **53 busana muslim eksklusif**. Koleksi ini didesain dengan inspirasi dari keindahan floral, arsitektur Timur Tengah, dan signature monogram SS yang khas. Tidak hanya menampilkan kemewahan dalam desain, setiap detail pada koleksi ini mencerminkan filosofi perempuan Indonesia yang anggun, kuat, dan penuh percaya diri.</p>

    <h2>2. Model Ternama dan Bintang Besar di Satu Panggung</h2>
    <p>Ajang ini semakin istimewa dengan kehadiran **deretan model ternama dan bintang besar Indonesia** sebagai muse. Nama-nama seperti **Maia Estianty, Wulan Guritno, Ria Ricis, Awkarin, Karin Novilda, Jenifer Cooper**, dan masih banyak lainnya turut memeriahkan runway. Tidak hanya itu, **Krisdayanti** hadir sebagai bintang utama dengan membawakan lagu-lagu klasik yang membangun suasana penuh kemegahan.</p>

    <h2>3. Fashion untuk Semua Perempuan Indonesia</h2>
    <p>Lebih dari sekadar fashion show, acara ini juga menegaskan bahwa dunia fashion adalah milik semua perempuan, tanpa terkecuali. Salah satu momen paling menyentuh dalam acara ini adalah ketika **pengidap Down Syndrome turut berjalan di runway**, menunjukkan bahwa keindahan dan kepercayaan diri tidak terbatas oleh kondisi apa pun. Hal ini sejalan dengan visi Shella Saukia untuk menjadikan fashion sebagai wadah inklusif bagi semua orang.</p>

    <h2>4. Anniversary ke-3 SS Skin: Sebuah Perayaan Keberhasilan</h2>
    <p>Selain menjadi panggung bagi koleksi terbaru <a href="https://shellasaukia.co" target="_blank">Shellasaukia.co</a>, fashion show ini juga sekaligus menandai **peringatan tiga tahun SS Skin (<a href="https://ssskin.co.id" target="_blank">ssskin.co.id</a>)**. Sebagai salah satu brand yang berada di bawah naungan Shella Saukia, SS Skin telah membuktikan eksistensinya dalam industri kecantikan dengan terus menghadirkan produk berkualitas yang mendukung perawatan kulit perempuan Indonesia.</p>

    <h2>5. Konsep Unik: Sayap Sebagai Simbol Perempuan yang Berdaya</h2>
    <p>Tahun ini, Shella Saukia menghadirkan konsep yang berbeda dari sebelumnya dengan simbol **sayap** sebagai representasi kekuatan dan kebebasan perempuan dalam berkarya. Konsep ini diperkuat oleh desain yang penuh makna, mulai dari koleksi bertema **Blossom**, yang mencerminkan kecantikan yang mekar, hingga **tema Vintage**, yang mengangkat keanggunan klasik dalam balutan modern.</p>

    <h2>6. SS Your Makeup: Mendukung Perempuan Tampil Percaya Diri</h2>
    <p>SS Your Makeup turut menjadi bagian dari perayaan ini dengan menghadirkan riasan yang sempurna bagi para muse. Menggunakan produk-produk andalannya, seperti **Luxe Aura Baked Blush, Velvet Glow Cushion, dan Lip Serum Hydrating** yang memberikan tampilan glowing alami, SS Your Makeup memastikan bahwa setiap perempuan yang tampil dalam acara ini memancarkan pesona terbaiknya.</p>

    <h2>7. Gandaria City: Tempat Eksklusif untuk Koleksi Premium</h2>
    <p>Bagi pecinta fashion, koleksi yang ditampilkan dalam acara ini kini bisa didapatkan secara eksklusif di **SS Fashion Store, Gandaria City Mall, Lantai 2**. Dengan hadirnya toko offline ini, pelanggan dapat langsung melihat dan mencoba koleksi terbaru dari Shella Saukia dengan lebih mudah.</p>

    <h2>8. Inspirasi bagi Perempuan Indonesia</h2>
    <p>Melalui acara ini, Shella Saukia kembali membuktikan bahwa **perempuan Indonesia memiliki kekuatan untuk berdaya, berkarya, dan bersinar di segala bidang**. Dari dunia fashion hingga kecantikan, SS Group terus berinovasi untuk mendukung perempuan agar lebih percaya diri dalam mengekspresikan dirinya.</p>

    <h2>Kesimpulan</h2>
    <p>Fashion show <strong>"Persembahan Berssahaja. Perempuan Indonesia. Berdaya-Berkarya-Bersinar."</strong> bukan sekadar pertunjukan mode, tetapi juga simbol dari **perjuangan, kreativitas, dan inspirasi bagi perempuan Indonesia**. Dengan koleksi eksklusif dari <a href="https://shellasaukia.co" target="_blank">Shellasaukia.co</a>, dukungan kecantikan dari <a href="https://ssskin.co.id" target="_blank">SS Skin</a>, serta sentuhan makeup dari SS Your Makeup, acara ini sukses menjadi perayaan keanggunan dan semangat perempuan Indonesia.</p>

    <p>Jadi, sudah siap untuk tampil **berdaya, berkarya, dan bersinar** dengan koleksi terbaru dari Shella Saukia? Kunjungi **SS Store di Gandaria City** dan dapatkan tampilan terbaikmu sekarang!</p>',
    'Jakarta',
    'Posted',
    NOW(),
    NULL,
    NULL
);

SELECT * FROM article;

UPDATE article 
SET pre_desc = 'Dapatkan makeup tahan lama seharian dengan 5 tips mudah ini, dijamin fresh dan flawless!'
WHERE id_title = 'makeup-tahan-lama-seharian-ikuti-5-tips-ini';

UPDATE article 
SET pre_desc = 'Pilih shade foundation yang sesuai dengan warna kulit agar tampilan lebih natural dan sempurna.'
WHERE id_title = 'cara-memilih-shade-foundation-yang-sesuai-dengan-warna-kulit';

UPDATE article 
SET pre_desc = 'Rahasia kulit flawless dengan teknik makeup no-makeup look, hasil lebih alami dan tahan lama!'
WHERE id_title = 'rahasia-kulit-flawless-dengan-teknik-makeup-no-makeup-look';

UPDATE article 
SET pre_desc = 'Gunakan cushion foundation dengan teknik yang tepat untuk hasil makeup flawless sempurna!'
WHERE id_title = 'panduan-lengkap-menggunakan-cushion-foundation-untuk-hasil-flawless';

UPDATE article 
SET pre_desc = 'Tingkatkan dimensi wajah dengan teknik contouring yang membuat tampilan lebih tegas dan elegan.'
WHERE id_title = 'teknik-contouring-wajah-untuk-tampilan-lebih-definisi';

UPDATE article 
SET pre_desc = 'Buat riasan mata tampak lebih tajam dan dramatis dengan teknik aplikasi yang tepat!'
WHERE id_title = 'tips-membuat-riasan-mata-yang-tajam-dan-dramatis';

UPDATE article 
SET pre_desc = 'Jaga kelembutan dan kesehatan bibir dengan lip care routine yang tepat setiap hari.'
WHERE id_title = 'rahasia-bibir-lembut-dan-sehat-dengan-lip-care-routine';

UPDATE article 
SET pre_desc = 'Tampil cantik alami dengan makeup natural sehari-hari yang simpel, fresh, dan elegan!'
WHERE id_title = 'inspirasi-makeup-natural-untuk-sehari-hari-yang-simpel-dan-elegan';

UPDATE article 
SET pre_desc = 'SS Your Makeup kini hadir di Gandaria City Mall, menghadirkan pengalaman belanja eksklusif.'
WHERE id_title = 'ss-your-makeup-hadir-di-gandaria-city-mall';

UPDATE article 
SET pre_desc = 'Shella Saukia menghadirkan fashion show spektakuler dengan koleksi eksklusif di Gandaria City.'
WHERE id_title = 'persembahan-berssahaja-fashion-show-megah-shella-saukia-di-gandaria-city-mall';

DELETE FROM product WHERE id_title = 'set-mascara-and-eye-curler';

INSERT INTO product (
    id, id_title, name_product, description, ingredients, htu, usp, price, 
    link_ecommerce_varian1, link_ecommerce_varian2, link_ecommerce_varian3, link_ecommerce_varian4, link_ecommerce_varian5, 
    category, product_varian1, product_varian2, product_varian3, product_varian4, product_varian5, 
    asset_varian1, asset_varian2, asset_varian3, asset_varian4, asset_varian5, 
    asset_png_varian1, asset_png_varian2, asset_png_varian3, asset_png_varian4, asset_png_varian5, 
    poster, created_at, updated_at
) VALUES (
    UUID(), 'mascara', 'Mascara',
    'A high-performance mascara that volumizes, lengthens, and defines lashes for a bold and dramatic look.',
    'Panthenol (Pro-Vitamin B5): Nourishes and strengthens lashes. Beeswax: Provides a flexible, smudge-resistant hold. Carnauba Wax: Helps lengthen and volumize lashes for a bold look.',
    'Apply from root to tip using a zig-zag motion for maximum volume. Layer for a more dramatic effect. Use a clean spoolie to separate lashes and remove excess product.',
    'Long-lasting wear. Clump-free and smudge-resistant formula. Enhances lash volume and length. Easy to apply with precision wand.',
    '99000', 
    'https://shopee.co.id/SS-YOUR-Mascara', NULL, NULL, NULL, NULL, 
    'eye', NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NOW(), NOW()
);

INSERT INTO product (
    id, id_title, name_product, description, ingredients, htu, usp, price, 
    link_ecommerce_varian1, link_ecommerce_varian2, link_ecommerce_varian3, link_ecommerce_varian4, link_ecommerce_varian5, 
    category, product_varian1, product_varian2, product_varian3, product_varian4, product_varian5, 
    asset_varian1, asset_varian2, asset_varian3, asset_varian4, asset_varian5, 
    asset_png_varian1, asset_png_varian2, asset_png_varian3, asset_png_varian4, asset_png_varian5, 
    poster, created_at, updated_at
) VALUES (
    UUID(), 'eye-curler', 'Eyelash Curler',
    'A high-quality eyelash curler designed to lift and curl lashes effortlessly for a wide-eyed effect.',
    'Ergonomic design: Provides a comfortable grip for easy use. Soft silicone pads: Prevents lash damage and ensures a smooth curl.',
    'Position curler at the base of your lashes and gently squeeze for a few seconds. Repeat towards the tips for a natural curl. Apply mascara for enhanced lift.',
    'Creates a long-lasting curl. Safe and comfortable to use. Works with all lash types. Compact and travel-friendly design.',
    '99000', 
    'https://shopee.co.id/SS-YOUR-Eyelash-Curler', NULL, NULL, NULL, NULL, 
    'beauty-tools', NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NOW(), NOW()
);
