<?php
$vsSqlItemGaleria = "
    SELECT
        titulo,
        descricao,
        imagem1,
        imagem2,
        imagem3,
        imagem4,
        imagem5
    FROM
        galeria_imagem
    WHERE
        url_amigavel = '$parametro'
";
$vrsExecutaItemGaleria = mysqli_query($Conexao, $vsSqlItemGaleria) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
$vrsQntItemGaleria = mysqli_num_rows($vrsExecutaItemGaleria);
if ($vrsQntItemGaleria > 0) {
    $voResultadoItemGaleria = mysqli_fetch_object($vrsExecutaItemGaleria);
    ?>
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
            <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "galeria/" . $parametro ?>"/>
            <meta property="og:type" content="website"/>
            <meta property="og:title" content="<?php echo $voResultadoConfiguracoes->titulo ?>"/>
            <meta property="og:description" content="<?php echo $voResultadoConfiguracoes->descricao ?>"/>
            <meta property="og:image" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "galeria/" . $parametro ?>"/>
            <meta property="og:site_name" content="<?php echo $voResultadoConfiguracoes->nome_empresa ?>"/>
            <meta property="fb:admins" content="<?php echo $voResultadoConfiguracoes->facebook ?>"/>
            <title><?php echo $voResultadoConfiguracoes->titulo ?> - <?php echo $voResultadoItemGaleria->titulo ?></title>
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

                <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(<?php echo URL ?>images/fundo_galeria-detalhes.jpg) no-repeat scroll center center / cover ;">
                    <div class="ht__bradcaump__wrap">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="bradcaump__inner">
                                        <nav class="bradcaump-inner">
                                            <h1 class="title__page"><?php echo $voResultadoItemGaleria->titulo ?></h1><br>
                                            <a class="breadcrumb-item" href="<?php echo URL ?>">Home</a>
                                            <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                            <a class="breadcrumb-item" href="<?php echo URL ?>galeria">Galeria</a>
                                            <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                            <span class="breadcrumb-item-galeria active"><?php echo $voResultadoItemGaleria->titulo ?></span>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <section class="htc__blog__details bg__white ptb--100">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-lg-12">
                                <div class="htc__blog__details__wrap">
                                    <p><?php echo $voResultadoItemGaleria->descricao ?></p>
                                    <div class="ht__bl__thumb">
                                        <img src="<?php echo URL ?>wdadmin/uploads/galeria_imagens/<?php echo $voResultadoItemGaleria->imagem1 ?>" alt="<?php echo $voResultadoItemGaleria->titulo ?>" title="<?php echo $voResultadoItemGaleria->titulo ?>">
                                    </div>
                                    <div class="ht__bl__thumb">
                                        <img src="<?php echo URL ?>wdadmin/uploads/galeria_imagens/<?php echo $voResultadoItemGaleria->imagem2 ?>" alt="<?php echo $voResultadoItemGaleria->titulo ?>" title="<?php echo $voResultadoItemGaleria->titulo ?>">
                                    </div>
                                    <div class="ht__bl__thumb">
                                        <img src="<?php echo URL ?>wdadmin/uploads/galeria_imagens/<?php echo $voResultadoItemGaleria->imagem3 ?>" alt="<?php echo $voResultadoItemGaleria->titulo ?>" title="<?php echo $voResultadoItemGaleria->titulo ?>">
                                    </div>
                                    <div class="ht__bl__thumb">
                                        <img src="<?php echo URL ?>wdadmin/uploads/galeria_imagens/<?php echo $voResultadoItemGaleria->imagem4 ?>" alt="<?php echo $voResultadoItemGaleria->titulo ?>" title="<?php echo $voResultadoItemGaleria->titulo ?>">
                                    </div>
                                    <div class="ht__bl__thumb">
                                        <img src="<?php echo URL ?>wdadmin/uploads/galeria_imagens/<?php echo $voResultadoItemGaleria->imagem5 ?>" alt="<?php echo $voResultadoItemGaleria->titulo ?>" title="<?php echo $voResultadoItemGaleria->titulo ?>">
                                    </div>

                                </div>
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

        </body>

    </html>

    <?php
} else {
    include "pages/404.php";
}