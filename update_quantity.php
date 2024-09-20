<?php
// Veritabanı bağlantısı
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cart";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Bağlantı hatası: " . $conn->connect_error);
}

// AJAX isteği ile gelen verileri al
$productID = $_POST['product_id'];
$action = $_POST['action'];

// Kontrol et
if ($action === 'increase') {
    // Ürünün sepete eklenip eklenmediğini kontrol et
    $checkSql = "SELECT * FROM sepet WHERE id = ?";
    $checkStmt = $conn->prepare($checkSql);
    $checkStmt->bind_param('i', $productID);
    $checkStmt->execute();
    $checkResult = $checkStmt->get_result();
    
    if ($checkResult->num_rows > 0) {
        // Ürün zaten sepette, adet miktarını artır
        $sql = "UPDATE sepet SET urunadet = urunadet + 1 WHERE id = ?";
    } else {
        // Ürün sepette değil, yeni bir giriş ekle
        $sql = "INSERT INTO sepet (urunid, kullaniciID, urunadet) VALUES (?, ?, 1)";
    }
    
    $checkStmt->close();
} elseif ($action === 'decrease') {
    // Adeti azaltma işlemi
    $sql = "UPDATE sepet SET urunadet = urunadet - 1 WHERE id = ?";
    
    // Eğer adet sıfıra düşerse, ürünü sil
    $deleteSql = "DELETE FROM sepet WHERE id = ? AND urunadet <= 1";
    $deleteStmt = $conn->prepare($deleteSql);
    $deleteStmt->bind_param('i', $productID);
    $deleteStmt->execute();
    $deleteStmt->close();
}

// Sorguyu hazırla ve çalıştır
$stmt = $conn->prepare($sql);
$stmt->bind_param('i', $productID);

$stmt->execute();

// Bağlantıyı kapat
$stmt->close();
$conn->close();
?>
