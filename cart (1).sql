-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 15 Eyl 2024, 19:42:59
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `cart`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `detail` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `image_url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `product`
--

INSERT INTO `product` (`id`, `product_name`, `detail`, `price`, `image_url`) VALUES
(1, 'ANDOMEDA EVRİMİ', 'Bir Daniel H. Wilson Romanı', 200, 'https://img.kitapyurdu.com/v1/getImage/fn:11579837/wh:true/wi:220'),
(2, 'NUTUK', 'Günümüz Türkçesiyle - 1927 ATATÜRK', 187, 'https://image01.idefix.com/resize/800/0/product/249592/gunumuz-turkcesiyle-nutuk-643707ba4bae8.jpg'),
(3, 'BEYAZ ZAMBAKLAR ÜLKESİNDE', 'Atamızın Tavsiyesi - Grigori Petrov', 98, 'https://cdn.bkmkitap.com/beyaz-zambaklar-ulkesinde-12032411-73-O.jpg'),
(4, 'Emile', 'Bir Çocuk Büyüyor - Jean Jeanjacques Rousseau', 295, 'https://cdn.bkmkitap.com/emile-11641248-10-O.jpg'),
(5, 'KAŞAĞI', 'Ömer Seyfettin', 25, 'https://cdn.bkmkitap.com/kasagi-124957-11542077-12-O.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sepet`
--

CREATE TABLE `sepet` (
  `id` int(11) NOT NULL,
  `kullaniciID` int(11) NOT NULL,
  `urunid` int(11) NOT NULL,
  `urunadet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `sepet`
--

INSERT INTO `sepet` (`id`, `kullaniciID`, `urunid`, `urunadet`) VALUES
(10, 1, 1, 2),
(12, 1, 2, 1);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `sepet`
--
ALTER TABLE `sepet`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `sepet`
--
ALTER TABLE `sepet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
