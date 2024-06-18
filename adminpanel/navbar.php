<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <!-- Identitas Toko -->
        <div class="d-flex align-items-center">
            <label class="navbar-brand mb-0 me-4">Vandesu Store<i class="fa-solid fa-paw ms-2"></i></label>
        </div>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02"
            aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse text-light" id="navbarTogglerDemo02">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item me-4">
                    <a class="nav-link" href="../adminpanel">Home</a>
                </li>
                <li class="nav-item me-4">
                    <a class="nav-link" href="kategori.php">Kategori</a>
                </li>
                <li class="nav-item me-4">
                    <a class="nav-link" href="produk.php">Produk</a>
                </li>
                <li class="nav-item me-4">
                    <a class="nav-link" href="#" onclick="logout()">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<script>
function logout() {
    if (confirm('Apakah Anda yakin ingin logout?')) {
        window.location.href = 'logout.php';
    }
}
</script>