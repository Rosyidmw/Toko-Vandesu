<?php
require "session.php";
require "../koneksi.php";

// Query untuk mengambil daftar kategori
$queryKategori = mysqli_query($con, "SELECT * FROM kategori");

// Fungsi untuk menghasilkan string acak
function generateRandomString($length = 10)
{
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel | Tambah Produk</title>
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
    }

    .no-decoration {
        text-decoration: none;
    }

    form div {
        margin-bottom: 10px;
    }
    </style>
</head>

<body>
    <?php require "navbar.php"; ?>

    <div class="container mt-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">
                    <a href="../adminpanel/" class="no-decoration text-muted"><i class="fas fa-home"></i> Home</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">
                    <a href="produk.php" class="no-decoration text-muted">Produk</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">
                    Tambah Produk
                </li>
            </ol>
        </nav>

        <!-- Form Tambah Produk -->
        <div class="my-5 col-12 col-md-6">
            <h3>Tambah Produk</h3>

            <form action="" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="nama">Nama</label>
                    <input type="text" id="nama" name="nama" placeholder="Input nama produk" class="form-control"
                        autocomplete="off" required>
                </div>
                <div class="mb-3">
                    <label for="kategori">Kategori</label>
                    <select name="kategori" class="form-control" required>
                        <option value="">Pilih Kategori</option>
                        <?php while ($data = mysqli_fetch_array($queryKategori)) { ?>
                        <option value="<?php echo $data['id']; ?>"><?php echo $data['nama']; ?></option>
                        <?php } ?>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="harga">Harga</label>
                    <input type="number" id="harga" name="harga" placeholder="Input harga" class="form-control"
                        required>
                </div>
                <div class="mb-3">
                    <label for="foto">Foto</label>
                    <input type="file" id="foto" name="foto" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="detail">Detail</label>
                    <textarea name="detail" id="detail" cols="30" rows="5" class="form-control"></textarea>
                </div>
                <div class="mb-3">
                    <label for="ketersediaan_stok">Ketersediaan Stok</label>
                    <select id="ketersediaan_stok" name="ketersediaan_stok" class="form-control">
                        <option value="tersedia">Tersedia</option>
                        <option value="habis">Habis</option>
                    </select>
                </div>
                <div>
                    <button class="btn btn-primary" name="simpan" type="submit">Simpan</button>
                    <a href="javascript:history.go(-1)" class="btn btn-secondary ms-2">Batal</a>
                </div>
            </form>

            <?php
            // Proses simpan produk
            if (isset($_POST['simpan'])) {
                $nama = htmlspecialchars($_POST['nama']);
                $kategori = htmlspecialchars($_POST['kategori']);
                $harga = htmlspecialchars($_POST['harga']);
                $detail = htmlspecialchars($_POST['detail']);
                $ketersediaan_stok = htmlspecialchars($_POST['ketersediaan_stok']);

                // Proses upload foto
                $target_dir = "../image/produk/";
                $nama_file = basename($_FILES["foto"]["name"]);
                $target_file = $target_dir . $nama_file;
                $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

                // Validasi input
                if ($nama == "" || $kategori == "" || $harga == "") {
            ?>
            <div class="alert alert-warning mt-3" role="alert">
                Nama, Kategori, Harga wajib diisi
            </div>
            <?php
                } else {
                    // Proses upload foto jika ada
                    if ($nama_file != '') {
                        $image_size = $_FILES["foto"]["size"];
                        if ($image_size > 5000000) {
                    ?>
            <div class="alert alert-warning mt-3" role="alert">
                File tidak boleh lebih dari 500 Kb
            </div>
            <?php
                        } else {
                            if ($imageFileType != "jpg" && $imageFileType != "jpeg" && $imageFileType != "png" && $imageFileType != "gif") {
                            ?>
            <div class="alert alert-warning mt-3" role="alert">
                File wajib bertipe jpg, jpeg, png, atau gif
            </div>
            <?php
                            } else {
                                // Jika semua valid, pindahkan file ke direktori yang ditentukan
                                $random_name = generateRandomString(20);
                                $new_name = $random_name . "." . $imageFileType;
                                move_uploaded_file($_FILES["foto"]["tmp_name"], $target_dir . $new_name);
                            }
                        }
                    }

                    // Query Insert produk ke database
                    $queryTambah = mysqli_query($con, "INSERT INTO produk (kategori_id, nama, harga, foto, detail, ketersediaan_stok) VALUES ('$kategori', '$nama', '$harga', '$new_name', '$detail', '$ketersediaan_stok')");

                    if ($queryTambah) {
                        ?>
            <div class="alert alert-primary mt-3" role="alert">
                Produk Berhasil Tersimpan
            </div>
            <meta http-equiv="refresh" content="2; url=produk.php" />
            <?php
                    } else {
                        echo mysqli_error($con);
                    }
                }
            }
            ?>
        </div>
    </div>

    <!-- Footer -->
    <?php require "footer.php"; ?>
    <script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../fontawesome/js/all.min.js"></script>
</body>

</html>