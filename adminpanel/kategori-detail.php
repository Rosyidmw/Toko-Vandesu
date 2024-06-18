<?php
require "session.php";
require "../koneksi.php";

$id = $_GET['id'];
$query = mysqli_query($con, "SELECT * FROM kategori WHERE id = $id");
$data = mysqli_fetch_array($query);

// Proses edit kategori
if (isset($_POST['editBtn'])) {
    $kategori = htmlspecialchars($_POST['kategori']);

    if ($data['nama'] == $kategori) {
        // Jika tidak ada perubahan nama kategori
        header("Refresh: 0; url=kategori.php");
    } else {
        // Cek apakah nama kategori sudah ada
        $queryCheck = mysqli_query($con, "SELECT * FROM kategori WHERE nama = '$kategori'");
        $jumlahData = mysqli_num_rows($queryCheck);

        if ($jumlahData > 0) {
            $pesan = "Kategori Sudah Ada";
            $alertType = "warning";
        } else {
            // Update nama kategori
            $querySimpan = mysqli_query($con, "UPDATE kategori SET nama = '$kategori' WHERE id = $id");

            if ($querySimpan) {
                $pesan = "Kategori Berhasil Diupdate";
                $alertType = "success";
                // Redirect untuk menghindari resubmission form
                header("Refresh: 2; url=kategori.php");
            } else {
                $pesan = "Gagal mengupdate kategori";
                $alertType = "danger";
            }
        }
    }
}

// Proses hapus kategori
if (isset($_POST['deleteBtn'])) {
    // Periksa apakah kategori masih digunakan di tabel produk
    $queryCheck = mysqli_query($con, "SELECT * FROM produk WHERE kategori_id = '$id'");
    $jumlahProduk = mysqli_num_rows($queryCheck);

    if ($jumlahProduk > 0) {
        $pesan = "Kategori tidak bisa dihapus karena masih digunakan oleh produk";
        $alertType = "warning";
    } else {
        // Hapus kategori
        $queryDelete = mysqli_query($con, "DELETE FROM kategori WHERE id = '$id'");

        if ($queryDelete) {
            $pesan = "Kategori Berhasil Dihapus";
            $alertType = "success";
            // Redirect untuk menghindari resubmission form
            header("Refresh: 2; url=kategori.php");
        } else {
            $pesan = "Gagal menghapus kategori";
            $alertType = "danger";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel | Detail Kategori</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        main {
            flex: 1;
            overflow-y: auto;
            /* Biarkan konten dapat di-scroll jika lebih panjang dari tinggi layar */
        }
    </style>
</head>

<body>

    <?php require "navbar.php"; ?>

    <div class="container mt-5">
        <h2>Detail Kategori</h2>
        <div class="col-12 col-md-6">
            <form action="" method="post">
                <div class="mb-3">
                    <label for="kategori" class="form-label">Kategori</label>
                    <input type="text" name="kategori" id="kategori" class="form-control" value="<?php echo $data['nama']; ?>">
                </div>
                <div>
                    <button class="btn btn-primary mt-3" name="editBtn" type="submit">Simpan</button>
                    <a href="kategori.php" class="btn btn-secondary mt-3">Batal</a>
                </div>

            </form>

            <?php if (isset($pesan)) { ?>
                <div class="alert alert-<?php echo $alertType; ?> mt-3" role="alert">
                    <?php echo $pesan; ?>
                </div>
            <?php } ?>
        </div>
    </div>

    <!-- footer -->
    <?php require "footer.php"; ?>
    <script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../fontawesome/js/all.min.js"></script>
</body>

</html>