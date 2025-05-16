<?php
include('../CONNEXION/Db.php');		
$db = new Database();
$n = $_POST['id'] ?? $_GET['id'] ?? null;
$result = [];

if ($n === null) {
    echo json_encode(['error' => 'Paramètre id manquant.']);
    exit;
}

try {
    $conn = $db->connect();
    $stmt = $conn->prepare("SELECT * FROM vdetailvente WHERE id_detailVente = :n");
    $stmt->bindParam(':n', $n, PDO::PARAM_INT);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result);
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?>