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
        <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "onde-comprar" ?>"/>
        <meta property="og:type" content="website"/>
        <meta property="og:title" content="<?php echo $voResultadoConfiguracoes->titulo ?>"/>
        <meta property="og:description" content="<?php echo $voResultadoConfiguracoes->descricao ?>"/>
        <meta property="og:image" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "onde-comprar" ?>"/>
        <meta property="og:site_name" content="<?php echo $voResultadoConfiguracoes->nome_empresa ?>"/>
        <meta property="fb:admins" content="<?php echo $voResultadoConfiguracoes->facebook ?>"/>
        <title><?php echo $voResultadoConfiguracoes->titulo ?> - Onde Comprar</title>
        <style type="text/css">#preloader{background-color:#fff;height:100%;position:fixed;width:100%;z-index:9999999;}#preloader>img{left:45%;position:absolute;top:40%}</style>
    </head>

    <body data-spy="scroll" data-target="#header" onLoad="fecha_loader()">

        <?php /* LOADER */ ?>
        <div id="preloader">
            <img src="<?php echo URL ?>images/91.gif" title="Preloader"l alt="Preloader">
        </div>

        <div class="wrapper">
            <?php
            /* MENU */
            include 'php/menu.php';
            ?>
            <div class="body__overlay"></div>
        </div>

        <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(<?php echo URL ?>images/fundo_onde_comprar.jpg) no-repeat scroll center center / cover ;">
            <div class="ht__bradcaump__wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="bradcaump__inner">
                                <nav class="bradcaump-inner">
                                    <h1 class="title__page">ONDE COMPRAR</h1><br>
                                    <a class="breadcrumb-item" href="<?php echo URL ?>home">Home</a>
                                    <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                    <span class="breadcrumb-item active">Onde Comprar</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="htc__product__grid bg__white ptb--100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 col-lg-push-3 col-md-9 col-md-push-3 col-sm-12 col-xs-12">
                        <div class="htc__product__rightidebar">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div id="ht__list__wrap" class="ht__list__wrap">
                                        <div class="bradcaump__inner">
                                            <i class="fas fa-arrow-left fa-5x color-vermelho"></i><h1 class="color-azul">Selecione ao lado a cidade mais próxima à você</h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-lg-pull-9 col-md-3 col-md-pull-9 col-sm-12 col-xs-12 smt-40 xmt-40">
                        <div class="htc__product__leftsidebar">
                            <div class="htc-grid-range">
                                <h4 class="title__line--4">BUSQUE AQUI</h4>
                            </div>
                            <form class="form-inline">
                                <input type="hidden" id="vsUrl" name="vsUrl" value="<?php echo URL ?>" />
                                <div class="form-group">
                                    <select class="form-control" id="vsCidade" name="vsCidade">
                                        <?php
                                        /* CIDADES */
                                        $vsSqlCidades = "SELECT cidade FROM clientes WHERE status = 1 GROUP BY cidade ORDER BY cidade";
                                        $vrsExecutaCidades = mysqli_query($Conexao, $vsSqlCidades) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                        while ($voResultadoCidades = mysqli_fetch_object($vrsExecutaCidades)) {
                                            ?>
                                            <option><?php echo $voResultadoCidades->cidade ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control" id="vsEstado" name="vsEstado">
                                        <?php
                                        /* ESTADOS */
                                        $vsSqlEstados = "SELECT estado FROM clientes WHERE status = 1 GROUP BY estado ORDER BY estado";
                                        $vrsExecutaEstados = mysqli_query($Conexao, $vsSqlEstados) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                        while ($voResultadoEstados = mysqli_fetch_object($vrsExecutaEstados)) {
                                            ?>
                                            <option><?php echo $voResultadoEstados->estado ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                                <button type="button" id="botao_consulta_clientes" class="btn btn-primary"><i class="fas fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <?php
    //FOOTER
    include 'php/footer.php';

    //CSS
    include 'php/css.php';

    //SCRIPT
    include 'php/script.php';
    ?>

    <script src="<?php echo URL ?>wdadmin/js/onde-comprar.min.js"></script>
</body>

</html>