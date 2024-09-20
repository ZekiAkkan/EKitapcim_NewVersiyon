<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cart";

// MySQLi bağlantısı
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Bağlantı hatası: " . $conn->connect_error);
}

$return = array();

// Gelen verileri al
$urunid = $_POST['urunid'];
$urunadet = $_POST['urunadet'];

// Kullanıcı ID'sini 1 olarak tanımla
$kullaniciID = 1;

// Ürünün sepette olup olmadığını kontrol et
$checkSql = "SELECT id, urunadet FROM sepet WHERE urunid = ?";
$checkStmt = $conn->prepare($checkSql);
$checkStmt->bind_param('i', $urunid);
$checkStmt->execute();
$checkResult = $checkStmt->get_result();

if ($checkResult->num_rows > 0) {
    // Ürün zaten sepette, adet miktarını artır
    $row = $checkResult->fetch_assoc();
    $urunID = $row['id'];
    $urunadet = $row['urunadet'] + $urunadet;

    $updateSql = "UPDATE sepet SET urunadet = ? WHERE id = ?";
    $updateStmt = $conn->prepare($updateSql);
    $updateStmt->bind_param('ii', $urunadet, $urunID);
    $updateStmt->execute();

    if ($updateStmt->affected_rows > 0) {
        $return['mesaj'] = 'İşlem başarılı (Adet artırıldı)';
    } else {
        $return['mesaj'] = 'İşlem başarısız';
    }

    $updateStmt->close();
} else {
    // Ürün sepette değil, yeni bir giriş ekle
    $insertSql = "INSERT INTO sepet (kullaniciID, urunid, urunadet) VALUES (?, ?, ?)";
    $insertStmt = $conn->prepare($insertSql);
    $insertStmt->bind_param('iii', $kullaniciID, $urunid, $urunadet);
    $insertStmt->execute();

    if ($insertStmt->affected_rows > 0) {
        $return['mesaj'] = 'İşlem başarılı (Yeni ürün eklendi)';
    } else {
        $return['mesaj'] = 'İşlem başarısız';
    }

    $insertStmt->close();
}

$checkStmt->close();
echo json_encode($return);

?>
