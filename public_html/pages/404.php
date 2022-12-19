<!DOCTYPE html>
<html lang="pt-br" class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv=X-UA-Compatible content="IE=edge">
        <link rel="shortcut icon" href="<?php echo URL ?>wdadmin/uploads/informacoes_gerais/<?php echo $voResultadoConfiguracoes->favicon ?>">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="description" content="<?php echo $voResultadoConfiguracoes->descricao ?>">
        <meta name="author" content="Web Dezan - Agência Digital">
        <meta name="robots" content="index, follow" />
        <meta name="googlebot" content="index, follow" />
        <meta property="og:url" content="<?php echo URL_SITE . "404" ?>"/>
        <meta property="og:type" content="website"/>
        <meta property="og:title" content="<?php echo $voResultadoConfiguracoes->titulo ?> - 404"/>
        <meta property="og:description" content="<?php echo $voResultadoConfiguracoes->descricao ?>"/>
        <meta property="og:url" content="<?php echo URL_SITE . "404" ?>"/>
        <meta property="og:site_name" content="<?php echo $voResultadoConfiguracoes->nome_empresa ?>"/>
        <meta property="fb:admins" content="<?php echo $voResultadoConfiguracoes->facebook ?>"/>
        <title><?php echo $voResultadoConfiguracoes->titulo ?> - 404</title>
        <style type="text/css">#preloader{background-color:#fff;height:100%;position:fixed;width:100%;z-index:9999999;}#preloader>img{left:45%;position:absolute;top:40%}</style>
    </head>

    <body data-spy="scroll" data-target="#header" onLoad="fecha_loader()">

        <?php /* LOADER */ ?>
        <div id="preloader">
            <img src="<?php echo URL ?>images/91.gif" title="Preloader" alt="Preloader">
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12" style="margin-top: 150px;">
                    <center>
                        <img src="<?php echo URL . "wdadmin/uploads/informacoes_gerais/" . $voResultadoConfiguracoes->logo_principal ?>" alt="<?php echo $voResultadoConfiguracoes->nome_empresa ?>" title="<?php echo $voResultadoConfiguracoes->nome_empresa ?>">
                        <br/>
                        <br/>
                        <br/>
                        <h1>404</h1>
                        <h4 style="color:#424242">Página não encontrada</h4>
                        <br/>
                        <br/>
                        <a href="<?php echo URL ?>" style="color: #424242"><i class="fa fa-angle-double-left"></i> Voltar a página inicial</a>
                    </center>
                </div>
            </div>
        </div>

        <?php
        //CSS
        include 'php/css.php';

        //SCRIPT
        include 'php/script.php';
        ?>

    </body>
</html>