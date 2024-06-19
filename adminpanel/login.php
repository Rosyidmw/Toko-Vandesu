<?php
session_start();
require "../koneksi.php";

// Fungsi untuk menghandle login
function handleLogin($con)
{
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
                return '<div class="alert alert-warning" role="alert">Password salah</div>';
            }
        } else {
            return '<div class="alert alert-warning" role="alert">Username Tidak Terdaftar</div>';
        }
    }
    return '';
}

$loginMessage = handleLogin($con);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel | Login</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<style>
    .main {
        height: 100vh;
        background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url(../image/pixel-art-bongo-piano.gif);
    }

    .login-box {
        width: 500px;
        box-sizing: border-box;
        border-radius: 10px;
        background: rgb(255, 255, 255);
        padding: 20px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3), 0 6px 6px rgba(0, 0, 0, 0.2);
        backdrop-filter: blur(100px);
    }

    .form-outline {
        position: relative;
        margin-bottom: 1.5rem;
    }

    .form-outline input {
        width: 100%;
        padding: 0.75rem;
        font-size: 1rem;
        border: 1px solid #ced4da;
        border-radius: 0.25rem;
        transition: all 0.5s ease;
    }

    .form-outline label {
        position: absolute;
        top: -0.75rem;
        left: 0.75rem;
        font-size: 0.75rem;
        color: #6c757d;
        pointer-events: none;
        background: white;
        padding: 0 0.25rem;
        transition: all 0.25s ease;
        z-index: 1;
    }

    .form-outline input:focus+label,
    .form-outline input:not(:placeholder-shown)+label {
        top: -0.75rem;
        font-size: 0.75rem;
        color: #495057;
        background: #fff;
        padding: 0 0.25rem;
        z-index: 2;
    }

    .form-outline input:focus {
        border-color: #495057;
        outline: none;
    }

    .form-outline input:not(:placeholder-shown) {
        padding-top: 1rem;
        border-color: #495057;
    }
</style>

<body>
    <div class="main d-flex flex-column justify-content-center align-items-center">
        <div class="login-box shadow">
            <form action="" method="post">
                <h2 class="text-center mb-3">Vandesu Admin<i class="fa-solid fa-paw ms-2"></i></h2>

                <div class="form-outline mb-3">
                    <input type="text" class="form-control" name="username" id="username" required>
                    <label for="username" class="form-label">Username</label>
                </div>

                <div class="form-outline mb-3">
                    <input type="password" class="form-control" name="password" id="password" required>
                    <label for="password" class="form-label">Password</label>
                </div>

                <div>
                    <button class="btn btn-lg warna1 form-control" type="submit" name="loginbtn">Login</button>
                </div>
            </form>
        </div>

        <div class="mt-3" style="width: 500px;">
            <?php echo $loginMessage; ?>
        </div>
    </div>
</body>

</html>