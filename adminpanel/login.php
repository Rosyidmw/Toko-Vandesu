<?php
session_start();
require "../koneksi.php";
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <style>
    .main {
        height: 100vh;
        background-image: url('../image/banner-login.webp');
        background-size: cover;
        background-position: center;
    }

    .login-box {
        width: 500px;
        box-sizing: border-box;
        border-radius: 10px;
        background: #fff;
        padding: 20px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3), 0 6px 6px rgba(0, 0, 0, 0.2);
        /* Enhanced shadow */
    }
    </style>
</head>

<body>

    <div class="main d-flex flex-column justify-content-center align-items-center">
        <div class="login-box shadow">
            <form action="" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" name="username" id="username" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" id="password" required>
                </div>
                <div>
                    <button class="btn btn-success form-control mt-3" type="submit" name="loginbtn">Login</button>
                </div>
            </form>
        </div>

        <div class="mt-3" style="width: 500px;">
            <?php
            if (isset($_POST['loginbtn'])) {
                $username = htmlspecialchars($_POST['username']);
                $password = htmlspecialchars($_POST['password']);

                $query = mysqli_query($con, "SELECT * FROM users WHERE username = '$username'");
                $countdata = mysqli_num_rows($query);
                $data = mysqli_fetch_array($query);

                if ($countdata > 0) {
                    if (password_verify($password, $data['password'])) {
                        $_SESSION['username'] = $data['username'];
                        $_SESSION['login'] = true;
                        header('location: ../adminpanel');
                        exit();
                    } else {
                        echo '<div class="alert alert-warning" role="alert">Password salah</div>';
                    }
                } else {
                    echo '<div class="alert alert-warning" role="alert">Username Tidak Terdaftar</div>';
                }
            }
            ?>
        </div>
    </div>

</body>

</html>