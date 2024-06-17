<?php
require "koneksi.php";

// Fungsi untuk memformat harga
function formatRupiah($angka)
{
    return number_format($angka, 0, ',', '.');
}

$queryProduk = mysqli_query($con, "SELECT id, nama, harga, foto, detail FROM produk LIMIT 6");

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Toko Vandesu | Home</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <!-- Navbar -->
    <?php require "navbar.php"; ?>
    <!-- banner -->
    <div class="container-fluid banner d-flex align-items-center">
        <div class="container text-center text-white">
            <h1>Toko Online Vandesu</h1>
            <h3>Mau cari apa?</h3>
            <div class="col-md-8 offset-md-2">
                <form action="produk.php" method="get">
                    <div class="input-group input-group-lg my-4">
                        <input type="text" class="form-control" placeholder="Nama Barang"
                            aria-label="Recipient's username" aria-describedby="basic-addon2" name="keyword">
                        <button type="submit" class="btn warna2 text-white">Telusuri</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- highlighted kategori -->
    <div class="container-fluid py-5">
        <div class="container text-center">
            <h3>Kategori Terlaris</h3>

            <div class="row mt-5">
                <div class="col-md-4 mb-3">
                    <div class="highlighted-kategori kategori-1 d-flex justify-content-center align-items-center">
                        <h4 class="text-white"><a class="no-decoration"
                                href="produk.php?kategori=Jujutsu Kaisen">Jujutsu
                                Kaisen</a></h4>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="highlighted-kategori kategori-2 d-flex justify-content-center align-items-center">
                        <h4 class="text-white"><a class="no-decoration"
                                href="produk.php?kategori=Genshin Impact">Genshin
                                Impact</a></h4>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="highlighted-kategori kategori-3 d-flex justify-content-center align-items-center">
                        <h4 class="text-white"><a class="no-decoration" href="produk.php?kategori=Demon Slayer">Demon
                                Slayer</a>
                        </h4>
                    </div>
                </div>
                <!-- <div class="col-md-4 mb-3">
                    <div class="highlighted-kategori kategori-4 d-flex justify-content-center align-items-center">
                        <h4 class="text-white"><a class="no-decoration"
                                href="produk.php?kategori=Naruto: Shippūden">Naruto:
                                Shippūden
                            </a>
                        </h4>
                    </div>
                </div> -->
            </div>
        </div>
    </div>

    <!-- Tentang Kami -->
    <div class="container-fluid warna3 py-5">
        <div class="container text-center accordion-body text-light">
            <h3>Tentang Kami</h3>
            <p class="fs-5 mt-3">Toko Vandesu adalah pusat kebutuhan bagi para penggemar anime. Kami
                menyediakan
                berbagai produk berkualitas tinggi seperti baju, gantungan kunci, action figure, dan aksesoris lainnya
                yang dirancang dengan detail tinggi. Setiap produk kami dibuat dari bahan terbaik untuk memastikan
                kenyamanan dan kepuasan pelanggan. Toko Vandesu berdedikasi untuk menjadi toko online terdepan yang
                menyediakan segala keperluan bagi pecinta anime dengan pelayanan pelanggan yang ramah dan responsif.</p>
        </div>
    </div>

    <!-- Produk -->
    <div class="container-fluid py-5">
        <div class="container text-center">
            <h3>Produk</h3>

            <div class="row mt-5">
                <?php while ($data = mysqli_fetch_array($queryProduk)) { ?>
                <div class="col-sm-6 col-md-4 mb-3">
                    <div class="card h-100">
                        <div class="image-box">
                            <img src="image/produk/<?php echo $data['foto'] ?>" class="card-img-top" alt="...">
                        </div>
                        <div class="card-body">
                            <h4 class="card-title"><?php echo $data['nama']; ?></h4>
                            <p class="card-text text-truncate"><?php echo $data['detail']; ?></p>
                            <p class="card-text text-harga">Rp <?php echo formatRupiah($data['harga']); ?></p>
                            <a href="produk-detail.php?nama=<?php echo $data['nama']; ?>"
                                class="btn warna2 text-white">Lihat
                                Detail</a>
                        </div>
                    </div>
                </div>
                <?php } ?>
            </div>
            <a href="produk.php" class="btn btn-outline-warning mt-3 p-3 fs-6">See More</a>
        </div>
    </div>

    <!-- Footer -->
    <?php require "footer.php"; ?>
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="fontawesome/js/all.min.js"></script>
</body>

</html>