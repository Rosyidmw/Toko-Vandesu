<?php
require "session.php";
require "../koneksi.php";

$id = $_GET['id'];
$query = mysqli_query($con, "SELECT a.*, b.nama AS nama_kategori FROM produk a JOIN kategori b ON a.kategori_id = b.id WHERE a.id = '$id'");
$data = mysqli_fetch_array($query);
$queryKategori = mysqli_query($con, "SELECT * FROM kategori WHERE id != '$data[kategori_id]'");

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

// Handling form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['simpan'])) {
        $nama = htmlspecialchars($_POST['nama']);
        $kategori = htmlspecialchars($_POST['kategori']);
        $harga = htmlspecialchars($_POST['harga']);
        $detail = htmlspecialchars($_POST['detail']);
        $ketersediaan_stok = htmlspecialchars($_POST['ketersediaan_stok']);

        // Validasi input
        if ($nama == "" || $kategori == "" || $harga == "") {
            $error_message = "Nama, Kategori, dan Harga wajib diisi.";
        } else {
            // Update data produk
            $queryUpdate = mysqli_query($con, "UPDATE produk SET kategori_id = '$kategori', nama = '$nama', harga = '$harga', detail = '$detail', ketersediaan_stok = '$ketersediaan_stok' WHERE id = '$id'");

            // Upload file foto jika ada perubahan
            if (!empty($_FILES["foto"]["name"])) {
                $target_dir = "../image/produk/";
                $nama_file = basename($_FILES["foto"]["name"]);
                $target_file = $target_dir . $nama_file;
                $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
                $image_size = $_FILES["foto"]["size"];

                // Validasi ukuran dan tipe file
                if ($image_size > 5000000) {
                    $error_message = "File tidak boleh lebih dari 500 Kb.";
                } elseif (!in_array($imageFileType, ["jpg", "png", "jpeg", "gif"])) {
                    $error_message = "File wajib bertipe jpg, png, jpeg, atau gif.";
                } else {
                    $random_name = generateRandomString(20);
                    $new_name = $random_name . "." . $imageFileType;

                    // Upload file dan update nama file di database
                    move_uploaded_file($_FILES["foto"]["tmp_name"], $target_dir . $new_name);
                    $queryUpdate = mysqli_query($con, "UPDATE produk SET foto = '$new_name' WHERE id = '$id'");
                }
            }

            // Tampilkan pesan berhasil atau error
            if ($queryUpdate) {
                $success_message = "Produk berhasil diupdate.";
                header("refresh:2; url=produk.php");
            } else {
                $error_message = mysqli_error($con);
            }
        }
    }

    // Proses hapus produk
    if (isset($_POST['hapus'])) {
        $queryHapus = mysqli_query($con, "DELETE FROM produk WHERE id = '$id'");
        if ($queryHapus) {
            $success_message = "Produk berhasil dihapus.";
            header("refresh:2; url=produk.php");
        } else {
            $error_message = mysqli_error($con);
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel | Detail Produk</title>
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

        form div {
            margin-bottom: 10px;
        }
    </style>
</head>

<body>
    <?php require "navbar.php"; ?>
    <div class="container mt-5">
        <h2>Detail Produk</h2>
        <div class="col-12 col-md-6 mb-5">
            <form action="" method="post" enctype="multipart/form-data">
                <?php if (isset($error_message)) : ?>
                    <div class="alert alert-warning mt-3" role="alert">
                        <?php echo $error_message; ?>
                    </div>
                <?php endif; ?>
                <?php if (isset($success_message)) : ?>
                    <div class="alert alert-primary mt-3" role="alert">
                        <?php echo $success_message; ?>
                    </div>
                <?php endif; ?>
                <div>
                    <label for="nama">Nama</label>
                    <input value="<?php echo $data['nama']; ?>" type="text" id="nama" name="nama" placeholder="Input nama produk" class="form-control" autocomplete="off" required>
                </div>
                <div>
                    <label for="kategori">Kategori</label>
                    <select name="kategori" class="form-control" required>
                        <option value="<?php echo $data['kategori_id']; ?>"> <?php echo $data['nama_kategori']; ?>
                        </option>
                        <?php while ($dataKategori = mysqli_fetch_array($queryKategori)) : ?>
                            <option value="<?php echo $dataKategori['id']; ?>">
                                <?php echo $dataKategori['nama']; ?>
                            </option>
                        <?php endwhile; ?>
                    </select>
                </div>
                <div>
                    <label for="harga">Harga</label>
                    <input type="number" id="harga" value="<?php echo $data['harga']; ?>" name="harga" placeholder="Input harga" class="form-control" required>
                </div>
                <div>
                    <label for="currentFoto">Foto Produk Sekarang</label>
                    <img src="../image/<?php echo $data['foto']; ?>" alt="" height="200px">
                </div>
                <div>
                    <label for="foto">Foto</label>
                    <input type="file" id="foto" name="foto" class="form-control">
                </div>
                <div>
                    <label for="detail">Detail</label>
                    <textarea name="detail" id="detail" cols="30" rows="10" class="form-control"><?php echo $data['detail']; ?></textarea>
                </div>
                <div>
                    <label for="stok">Stok</label>
                    <select id="ketersediaan_stok" name="ketersediaan_stok" class="form-control">
                        <option value="<?php echo $data['ketersediaan_stok']; ?>">
                            <?php echo $data['ketersediaan_stok']; ?></option>
                        <?php if ($data['ketersediaan_stok'] == 'tersedia') : ?>
                            <option value="tersedia">Tersedia</option>;
                        <?php else : ?>
                            <option value="habis">Habis</option>
                        <?php endif; ?>
                    </select>
                </div>
                <div class="d-flex justify-content-between">
                    <button class="btn btn-primary mt-3" name="simpan" type="submit">Simpan</button>
                    <button class="btn btn-danger mt-3" name="hapus" type="submit">Hapus</button>
                </div>
            </form>
        </div>
    </div>

    <!-- footer -->
    <?php require "footer.php"; ?>
    <script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../fontawesome/js/all.min.js"></script>
</body>

</html>