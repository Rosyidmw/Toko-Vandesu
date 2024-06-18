<?php
require "koneksi.php";

// Fungsi untuk memformat harga
function formatRupiah($angka)
{
    return number_format($angka, 0, ',', '.');
}

$queryKategori = mysqli_query($con, "SELECT * FROM kategori");

// get produk by nama produk/keyword
if (isset($_GET['keyword'])) {
    $keyword = $_GET['keyword'];
    $queryProduk = mysqli_query($con, "SELECT * FROM produk WHERE nama LIKE '%$keyword%'");
}
// get produk by kategori
else if (isset($_GET['kategori'])) {
    $kategori = $_GET['kategori'];
    $queryGetKategoryID = mysqli_query($con, "SELECT id FROM kategori WHERE nama='$kategori'");
    $kategoriID = mysqli_fetch_array($queryGetKategoryID);
    $queryProduk = mysqli_query($con, "SELECT * FROM produk WHERE kategori_id = '$kategoriID[id]'");
}
// get all products by default
else {
    $queryProduk = mysqli_query($con, "SELECT * FROM produk");
}

$countData = mysqli_num_rows($queryProduk);

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Toko Vandesu | Produk</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
    .card:hover {
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
        transform: translateY(-5px);
        transition: all 0.3s ease;
    }
    </style>
</head>

<body>
    <!-- Navbar -->
    <?php require "navbar.php"; ?>

    <!-- Banner -->
    <div class="container-fluid banner2 d-flex align-items-center">
        <div class="container">
            <h1 class="text-white text-center">Produk</h1>
        </div>
    </div>

    <!-- Body -->
    <div class="container py-5">
        <div class="row">
            <div class="col-lg-3 mb-5">
                <h3>Kategori</h3>
                <ul class="list-group">
                    <?php while ($Kategori = mysqli_fetch_array($queryKategori)) { ?>
                    <a class="no-decoration" href="produk.php?kategori=<?php echo urlencode($Kategori['nama']); ?>">
                        <li class="list-group-item"><?php echo $Kategori['nama']; ?></li>
                    </a>
                    <?php } ?>
                </ul>
            </div>

            <!-- Produk -->
            <div class="col-lg-9">
                <h3 class="text-center mb-3">Produk</h3>

                <!-- Search Bar -->
                <form class="mb-4" method="GET" action="produk.php">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Ketikkan nama produk" name="keyword"
                            value="<?php echo isset($_GET['keyword']) ? htmlspecialchars($_GET['keyword']) : ''; ?>">
                        <button class="btn btn-outline-secondary" type="submit"><i
                                class="fa-solid fa-magnifying-glass me-1"></i></button>
                    </div>
                </form>

                <?php
                if ($countData < 1) {
                    echo "<h4 class='text-center my-5'>Produk yang anda cari tidak tersedia!</h4>";
                }
                ?>

                <div class="row">

                    <?php while ($produk = mysqli_fetch_array($queryProduk)) { ?>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100">
                            <div class="image-box">
                                <img src="image/produk/<?php echo $produk['foto']; ?>" class="card-img-top" alt="...">
                            </div>
                            <div class="card-body">
                                <h4 class="card-title"><?php echo $produk['nama']; ?></h4>
                                <p class="card-text text-truncate"><?php echo $produk['detail']; ?></p>
                                <p class="card-text text-harga">Rp <?php echo formatRupiah($produk['harga']); ?></p>
                                <a href="produk-detail.php?nama=<?php echo urlencode($produk['nama']); ?>"
                                    class="btn warna2 text-white">Lihat
                                    Detail</a>
                            </div>
                        </div>
                    </div>
                    <?php } ?>

                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <?php require "footer.php"; ?>
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="fontawesome/js/all.min.js"></script>
</body>

</html>