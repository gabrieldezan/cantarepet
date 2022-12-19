<?php
session_start();

error_reporting(0);

include "./config.php";
require_once "class/Login.class.php";

if (isset($_POST['ok'])):

    $login = filter_input(INPUT_POST, "login", FILTER_SANITIZE_MAGIC_QUOTES);
    $senha = filter_input(INPUT_POST, "senha", FILTER_SANITIZE_MAGIC_QUOTES);

    $l = new Login;
    $l->setLogin($login);
    $l->setSenha($senha);

    if ($l->logar()):
        header("Location: inicio");
    else:
        $erro = "
            <div class=\"alert alert-warning alert-dismissable m-t-40\">
                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>
                <i class=\"zmdi zmdi-alert-circle-o pr-15 pull-left\"></i><p class=\"pull-left\">Usuário ou senha inválidos.</p>
                <div class=\"clearfix\"></div>
            </div>
        ";
    endif;
endif;

if (isset($_SESSION['fi_logado'])):
    header("Location: inicio");
else:
    ?>
    <!DOCTYPE html>
    <html lang="pt-br">
        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
            <title>WD Admin - Login</title>
            <link rel="shortcut icon" href="assets/images/logo-icon.png">
            <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
            <link href="css/style.css" rel="stylesheet">
            <link href="css/colors/blue.css" id="theme" rel="stylesheet">
        </head>
        <body>
            <div class="preloader">
                <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
            </div>
            <section id="wrapper" class="login-register login-sidebar" style="background-image:url(assets/images/background-login.jpg);">
                <div class="login-box card">
                    <div class="card-body">
                        <form class="form-horizontal form-material formulario" id="loginform" action="" method="POST">
                            <a class="text-center db"><img src="assets/images/Logo Funcional.png" alt="Home" /></a>
                            <?php echo isset($erro) ? $erro : ''; ?>
                            <div class="form-group m-t-20">
                                <div class="col-xs-12">
                                    <input class="form-control" type="text" name="login" required="" placeholder="Informe seu e-mail">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <input class="form-control" type="password" name="senha" required="" placeholder="Informe sua senha">
                                </div>
                            </div>
                            <div class="form-group text-center m-t-20">
                                <div class="col-xs-12">
                                    <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="submit" name="ok"><i class="fas fa-sign-in-alt fa-fw"></i>&nbsp;Entrar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </section>

            <script src="assets/plugins/jquery/jquery.min.js"></script>
            <script src="assets/plugins/bootstrap/js/popper.min.js"></script>
            <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
            <script src="js/jquery.slimscroll.js"></script>
            <script src="js/waves.js"></script>
            <script src="js/sidebarmenu.js"></script>
            <script src="assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
            <script src="assets/plugins/sparkline/jquery.sparkline.min.js"></script>
            <script src="js/custom.min.js"></script>
            <script src="assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
        </body>
    </html>
<?php
endif;