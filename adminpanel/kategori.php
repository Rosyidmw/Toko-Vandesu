<?php
require "session.php";
require "../koneksi.php";

// Query untuk mengambil semua kategori
$queryKategori = mysqli_query($con, "SELECT * FROM kategori");
$jumlahKategori = mysqli_num_rows($queryKategori);

// Proses simpan kategori baru
if (isset($_POST['simpan_kategori'])) {
    $kategori = htmlspecialchars($_POST['kategori']);

    // Periksa apakah kategori sudah ada
    $queryExists = mysqli_query($con, "SELECT nama FROM kategori WHERE nama = '$kategori'");
    $jumlahDataKategoriBaru = mysqli_num_rows($queryExists);

    if ($jumlahDataKategoriBaru > 0) {
        $pesan = "Kategori Sudah Ada";
        $alertType = "warning";
    } else {
        $querySimpan = mysqli_query($con, "INSERT INTO kategori (nama) VALUES ('$kategori')");

        if ($querySimpan) {
            $pesan = "Kategori Berhasil Tersimpan";
            $alertType = "success";
            // Redirect to prevent form resubmission
            header("Refresh: 2; url=kategori.php");
        } else {
            $pesan = "Gagal menyimpan kategori";
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
    <title>Kategori</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../fontawesome/css/fontawesome.min.css">
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

    .no-decoration {
        text-decoration: none;
    }

    .alert-container {
        margin-top: 20px;
    }
    </style>
</head>

<body>

    <?php require "navbar.php"; ?>

    <div class="container mt-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="../adminpanel/" class="no-decoration text-muted"><i
                            class="fas fa-home"></i> Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Kategori</li>
            </ol>
        </nav>

        <div class="row">
            <div class="col-md-6">
                <div class="card mb-3">
                    <div class="card-body">
                        <h3 class="card-title">Tambah Kategori</h3>
                        <form action="" method="post">
                            <div class="mb-3">
                                <label for="kategori" class="form-label">Nama Kategori</label>
                                <input type="text" name="kategori" class="form-control"
                                    placeholder="Input nama kategori" required>
                            </div>
                            <button type="submit" class="btn btn-primary" name="simpan_kategori">Simpan</button>
                        </form>
                    </div>
                </div>

                <?php if (isset($pesan)) { ?>
                <div class="alert alert-<?php echo $alertType; ?> alert-container" role="alert">
                    <?php echo $pesan; ?>
                </div>
                <?php } ?>
            </div>

            <div class="col-md-6">
                <h3>List Kategori</h3>

                <div class="table-responsive mt-3">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Nama</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if ($jumlahKategori == 0) { ?>
                            <tr>
                                <td colspan="3" class="text-center">Data kategori tidak tersedia</td>
                            </tr>
                            <?php } else {
                                $nomor = 1;
                                while ($data = mysqli_fetch_array($queryKategori)) { ?>
                            <tr>
                                <td><?php echo $nomor++; ?></td>
                                <td><?php echo $data['nama']; ?></td>
                                <td>
                                    <a href="kategori-detail.php?id=<?php echo $data['id']; ?>" class="btn btn-info"><i
                                            class="fas fa-search"></i></a>
                                </td>
                            </tr>
                            <?php }
                            } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <?php require "footer.php"; ?>
    <script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../fontawesome/js/all.min.js"></script>
</body>

</html>