<?php
require "session.php";
require "../koneksi.php";

// Fungsi untuk menghapus produk
function hapusProduk($con, $id)
{
    $queryHapus = mysqli_query($con, "DELETE FROM produk WHERE id = '$id'");
    return $queryHapus;
}

// Menghapus produk jika parameter action=hapus diterima dari URL
if (isset($_GET['action']) && $_GET['action'] == 'hapus' && isset($_GET['id'])) {
    $id_produk = $_GET['id'];
    $hapus = hapusProduk($con, $id_produk);
    if ($hapus) {
        $success_message = "Produk berhasil dihapus.";
    } else {
        $error_message = "Gagal menghapus produk: " . mysqli_error($con);
    }
}

// Mendapatkan kriteria dan arah pengurutan dari URL
$sortCriteria = isset($_GET['sort']) ? $_GET['sort'] : 'nama';
$sortDirection = isset($_GET['direction']) ? $_GET['direction'] : 'asc';

// Query untuk mengambil data produk beserta nama kategorinya
$query = mysqli_query($con, "SELECT a.*, b.nama AS nama_kategori FROM produk a JOIN kategori b ON a.kategori_id = b.id");
$jumlahProduk = mysqli_num_rows($query);

// Menyimpan data produk dalam array
$produkArray = [];
while ($data = mysqli_fetch_array($query)) {
    $produkArray[] = $data;
}

// Fungsi Bubble Sort untuk mengurutkan data produk berdasarkan kriteria yang dipilih
function bubble_sort(&$array, $key, $direction)
{
    $n = count($array);
    for ($i = 0; $i < $n; $i++) {
        for ($j = 0; $j < $n - $i - 1; $j++) {
            if ($direction == 'asc') {
                if ($array[$j][$key] > $array[$j + 1][$key]) {
                    $temp = $array[$j];
                    $array[$j] = $array[$j + 1];
                    $array[$j + 1] = $temp;
                }
            } else {
                if ($array[$j][$key] < $array[$j + 1][$key]) {
                    $temp = $array[$j];
                    $array[$j] = $array[$j + 1];
                    $array[$j + 1] = $temp;
                }
            }
        }
    }
}

// Mengurutkan data produk berdasarkan kriteria yang dipilih
bubble_sort($produkArray, $sortCriteria, $sortDirection);

// Query untuk mengambil daftar kategori
$queryKategori = mysqli_query($con, "SELECT * FROM kategori");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel | Produk</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <style>
    body {
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    css Copy code main {
        flex: 1;
        overflow-y: auto;
    }

    .no-decoration {
        text-decoration: none;
    }

    form div {
        margin-bottom: 10px;
    }

    d-flex {
        display: flex;
    }

    .align-items-center {
        align-items: center;
    }

    .justify-content-between {
        justify-content: space-between;
    }

    .me-2 {
        margin-right: 0.5rem;
    }

    .form-select {
        width: auto;
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
                    Produk
                </li>
            </ol>
        </nav>

        <!-- Daftar Produk -->
        <div class="mt-5 mb-5">
            <h2>List Produk</h2>
            <p>Jumlah produk: <?php echo $jumlahProduk; ?></p>

            <!-- Bagian Dropdown dan Tombol Tambah Produk -->
            <div class="my-3 d-flex align-items-center justify-content-between">
                <div class="d-flex align-items-center">
                    <label for="sortCriteria" class="me-2">Kategori:</label>
                    <select id="sortCriteria" class="form-select me-2" onchange="sortProducts()">
                        <option value="nama" <?php if ($sortCriteria == 'nama') echo 'selected'; ?>>Nama</option>
                        <option value="harga" <?php if ($sortCriteria == 'harga') echo 'selected'; ?>>Harga</option>
                        <option value="nama_kategori" <?php if ($sortCriteria == 'nama_kategori') echo 'selected'; ?>>
                            Kategori</option>
                        <option value="ketersediaan_stok"
                            <?php if ($sortCriteria == 'ketersediaan_stok') echo 'selected'; ?>>Stok</option>
                    </select>
                    <label for="sortDirection" class="me-2">Sort by:</label>
                    <i class="fa-solid fa-sort" id="sortIcon" onclick="toggleSortDirection()"></i>
                </div>
                <div>
                    <a href="tambah-produk.php" class="btn btn-success"><i class="fas fa-plus-circle me-2"></i>Tambah
                        Produk</a>
                </div>
            </div>

            <!-- Pesan Sukses atau Error -->
            <?php if (isset($success_message)) : ?>
            <div class="alert alert-primary" role="alert">
                <?php echo $success_message; ?>
            </div>
            <?php elseif (isset($error_message)) : ?>
            <div class="alert alert-danger" role="alert">
                <?php echo $error_message; ?>
            </div>
            <?php endif; ?>

            <div class="table-responsive mt-5">
                <table class="table">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Nama</th>
                            <th>Kategori</th>
                            <th>Harga</th>
                            <th>Stok</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if ($jumlahProduk == 0) {
                        ?>
                        <tr>
                            <td colspan="6" class="text-center">Data produk tidak tersedia</td>
                        </tr>
                        <?php
                        } else {
                            $nomor = 1;
                            foreach ($produkArray as $data) {
                            ?>
                        <tr>
                            <td><?php echo $nomor; ?></td>
                            <td><?php echo $data['nama']; ?></td>
                            <td><?php echo $data['nama_kategori']; ?></td>
                            <td>Rp. <?php echo number_format($data['harga']); ?></td>
                            <td><?php echo $data['ketersediaan_stok']; ?></td>
                            <td>
                                <a href="produk-detail.php?id=<?php echo $data['id']; ?>" class="btn btn-info btn-sm"><i
                                        class="fa-solid fa-pen me-1"></i>Ubah</a>
                                <a href="produk.php?action=hapus&id=<?php echo $data['id']; ?>"
                                    class="btn btn-danger btn-sm"
                                    onclick="return confirm('Anda yakin ingin menghapus produk ini?');"><i
                                        class="fa-solid fa-trash me-1"></i>Hapus</a>
                            </td>
                        </tr>
                        <?php
                                $nomor++;
                            }
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <?php require "footer.php"; ?>
    <script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../fontawesome/js/all.min.js"></script>
    <script>
    function sortProducts() {
        const criteria = document.getElementById('sortCriteria').value;
        const direction = document.getElementById('sortIcon').classList.contains('asc') ? 'asc' : 'desc';
        window.location.href = `produk.php?sort=${criteria}&direction=${direction}`;
    }

    function toggleSortDirection() {
        const sortIcon = document.getElementById('sortIcon');
        if (sortIcon.classList.contains('asc')) {
            sortIcon.classList.remove('asc');
            sortIcon.classList.add('desc');
        } else {
            sortIcon.classList.remove('desc');
            sortIcon.classList.add('asc');
        }
        sortProducts();
    }

    // Set default sort direction
    const currentDirection = "<?php echo $sortDirection; ?>";
    const sortIcon = document.getElementById('sortIcon');
    if (currentDirection === 'asc') {
        sortIcon.classList.add('asc');
    } else {
        sortIcon.classList.add('desc');
    }
    </script>
</body>

</html>