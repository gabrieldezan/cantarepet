<!doctype html>
<html class="no-js" lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv=X-UA-Compatible content="IE=edge">
        <link rel="shortcut icon" href="<?php echo URL ?>wdadmin/uploads/informacoes_gerais/<?php echo $voResultadoConfiguracoes->favicon ?>">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="description" content="<?php echo $voResultadoConfiguracoes->descricao ?>">
        <meta name="author" content="Web Dezan - Agência Digital">
        <meta name="robots" content="index, follow" />
        <meta name="googlebot" content="index, follow" />
        <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "galeria" ?>"/>
        <meta property="og:type" content="website"/>
        <meta property="og:title" content="<?php echo $voResultadoConfiguracoes->titulo ?>"/>
        <meta property="og:description" content="<?php echo $voResultadoConfiguracoes->descricao ?>"/>
        <meta property="og:image" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "galeria" ?>"/>
        <meta property="og:site_name" content="<?php echo $voResultadoConfiguracoes->nome_empresa ?>"/>
        <meta property="fb:admins" content="<?php echo $voResultadoConfiguracoes->facebook ?>"/>
        <title><?php echo $voResultadoConfiguracoes->titulo ?> - Galeria</title>
        <style type="text/css">#preloader{background-color:#fff;height:100%;position:fixed;width:100%;z-index:9999999;}#preloader>img{left:45%;position:absolute;top:40%}</style>
    </head>

    <body data-spy="scroll" data-target="#header" onLoad="fecha_loader()">

        <?php /* LOADER */ ?>
        <div id="preloader">
            <img src="<?php echo URL ?>images/91.gif" title="Preloader" alt="Preloader">
        </div>

        <div class="wrapper">
            <?php
            /* MENU */
            include 'php/menu.php';
            ?>

            <div class="body__overlay"></div>
            <div class="offset__wrapper">
                <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(images/fundo_galeria.jpg) no-repeat scroll center center / cover ;">
                    <div class="ht__bradcaump__wrap">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="bradcaump__inner">
                                        <nav class="bradcaump-inner">
                                            <h1 class="title__page">GALERIA</h1><br>
                                            <a class="breadcrumb-item" href="<?php echo URL ?>">Home</a>
                                            <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                            <span class="breadcrumb-item active">Galeria</span>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <section class="htc__blog__area bg__white ptb--100">
                    <div class="container">
                        <div class="row">
                            <div class="ht__blog__wrap blog--page clearfix">
                                <?php
                                $vsSqlGaleria = "SELECT imagem1, titulo, url_amigavel FROM `galeria_imagem`";
                                $vrsExecutaGaleria = mysqli_query($Conexao, $vsSqlGaleria) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                while ($voResultadoGaleria = mysqli_fetch_object($vrsExecutaGaleria)) {
                                    ?>
                                    <div class="col-md-6 col-lg-4 col-sm-12 col-xs-12">
                                        <div class="blog">
                                            <div class="blog__thumb">
                                                <a href="<?php echo URL ?>galeria/<?php echo $voResultadoGaleria->url_amigavel; ?>">
                                                    <img src="<?php echo URL ?>wdadmin/uploads/galeria_imagens/<?php echo $voResultadoGaleria->imagem1 ?>" class="img-responsive" alt="<?php echo $voResultadoGaleria->titulo; ?>" title="<?php echo $voResultadoGaleria->titulo; ?>">
                                                </a>
                                            </div>
                                            <div class="blog__details">
                                                <h2><a href="<?php echo URL ?>galeria/<?php echo $voResultadoGaleria->url_amigavel; ?>"><?php echo $voResultadoGaleria->titulo; ?></a></h2>
                                                <div class="blog__btn">
                                                    <a href="<?php echo URL ?>galeria/<?php echo $voResultadoGaleria->url_amigavel; ?>">Veja Mais</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <?php
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </section>

            </div>

            <?php
            //FOOTER
            include 'php/footer.php';

            //CSS
            include 'php/css.php';

            //SCRIPT
            include 'php/script.php';
            ?>

        </div>

    </body>

</html>