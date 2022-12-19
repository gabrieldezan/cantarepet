<!DOCTYPE html>
<html lang="pt-br" class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv=X-UA-Compatible content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="shortcut icon" href="<?php echo URL ?>wdadmin/uploads/informacoes_gerais/<?php echo $voResultadoConfiguracoes->favicon ?>">
        <meta name="description" content="<?php echo $voResultadoConfiguracoes->descricao ?>">
        <meta name="author" content="Web Dezan - Agência Digital">
        <meta name="robots" content="index, follow" />
        <meta name="googlebot" content="index, follow" />
        <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL ?>"/>
        <meta property="og:type" content="website"/>
        <meta property="og:title" content="<?php echo $voResultadoConfiguracoes->titulo ?>"/>
        <meta property="og:description" content="<?php echo $voResultadoConfiguracoes->descricao ?>"/>
        <meta property="og:image" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] ?><?php echo URL ?>"/>
        <meta property="og:site_name" content="<?php echo $voResultadoConfiguracoes->nome_empresa ?>"/>
        <meta property="fb:admins" content="<?php echo $voResultadoConfiguracoes->facebook ?>"/>
        <title><?php echo $voResultadoConfiguracoes->titulo ?></title>
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
        </div>

        <div class="slider__container slider--one bg__cat--3">
            <div class="slide__container slider__activation__wrap owl-carousel">
                <?php
                /* BANNER */
                $vsSqlBanner = "SELECT imagem, titulo, descricao FROM banner ORDER BY id_banner desc LIMIT 5";
                $vrsExecutaBanner = mysqli_query($Conexao, $vsSqlBanner) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                while ($voResultadoBanner = mysqli_fetch_object($vrsExecutaBanner)) {
                    ?>
                    <div class="single__slide animation__style01 slider__fixed--height">
                        <div class="container">
                            <div class="row align-items__center">
                                <div class="col-md-7 col-sm-7 col-xs-12 col-lg-6">
                                    <?php
                                    $vsSqlProdutosBanner = "
                                        SELECT
                                            vp.id_vitrine_produto,
                                            vp.descricao,
                                            vp.url_amigavel AS url_produto,
                                            vpc.imagem1,
                                            vpc.url_amigavel AS url_variacao,
                                            vs.descricao AS subgrupo,
                                            vpc.descricao AS variacao,
                                            vg.descricao AS grupo
                                        FROM
                                            vitrine_produto_cores vpc
                                            INNER JOIN vitrine_produto vp ON vp.id_vitrine_produto = vpc.id_vitrine_produto
                                            INNER JOIN vitrine_subgrupo vs ON vs.id_vitrine_subgrupo = vp.id_vitrine_subgrupo
                                            INNER JOIN vitrine_grupo vg ON vg.id_vitrine_grupo = vs.id_vitrine_grupo
                                        WHERE
                                            vp.status = 1 AND
                                            vs.status = 1 AND
                                            vg.status = 1
                                        ORDER BY
                                            RAND() LIMIT 1
                                    ";
                                    $vrsExecutaProdutosBanner = mysqli_query($Conexao, $vsSqlProdutosBanner) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                    while ($voResultadoProdutosBanner = mysqli_fetch_object($vrsExecutaProdutosBanner)) {
                                        ?>
                                        <div class="slide">
                                            <div class="slider__inner">
                                                <h2><?php echo $voResultadoBanner->titulo; ?></h2>
                                                <h1><?php echo $voResultadoProdutosBanner->descricao; ?> <?php echo $voResultadoProdutosBanner->variacao ?></h1>
                                                <div class="cr__btn">
                                                    <a href="<?php echo URL ?><?php echo url_amigavel($voResultadoProdutosBanner->grupo) ?>/<?php echo url_amigavel($voResultadoProdutosBanner->subgrupo) ?>/<?php echo $voResultadoProdutosBanner->url_produto ?>/<?php echo $voResultadoProdutosBanner->url_variacao ?>">Conheça o produto</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-sm-5 col-xs-12 col-md-5">
                                        <div class="slide__thumb">
                                            <img src="<?php echo URL ?>wdadmin/uploads/vitrine_produtos/<?php echo $voResultadoProdutosBanner->imagem1 ?>" alt="<?php echo $voResultadoProdutosBanner->descricao; ?>" title="<?php echo $voResultadoProdutosBanner->descricao; ?>">
                                        </div>
                                    </div>
                                    <?php
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                    <?php
                }
                ?>
            </div>
        </div>

        <?php
        /* LINHA DE PRODUTOS */
        include 'php/linha-produtos.php';
        ?>

        <section class="htc__good__sale bg__cat--3">
            <div class="container">
                <div class="row">
                    <?php
                    /* CHAMADA */
                    $vsSqlChamada = "SELECT imagem_destaque, titulo, texto, link FROM informacoes WHERE id_paginas = 2 AND id_informacoes = 6";
                    $vrsExecutaChamada = mysqli_query($Conexao, $vsSqlChamada) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                    while ($voResultadoChamada = mysqli_fetch_object($vrsExecutaChamada)) {
                        ?>
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                            <div class="fr__prize__inner">
                                <h2><?php echo $voResultadoChamada->titulo ?></h2>
                                <?php echo $voResultadoChamada->texto ?>
                                <a class="fr__btn" href="<?php echo URL ?><?php echo $voResultadoChamada->link ?>">Consultar</a>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                            <div class="prize__inner">
                                <div class="prize__thumb">
                                    <img src="<?php echo URL ?>wdadmin/uploads/informacoes/<?php echo $voResultadoChamada->imagem_destaque ?>" alt="<?php echo $voResultadoChamada->titulo ?>" title="<?php echo $voResultadoChamada->titulo ?>">
                                </div>
                            </div>
                        </div>
                        <?php
                    }
                    ?>
                </div>
            </div>
        </section>

        <section class="htc__category__area ptb--100">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="section__title--2 text-center">
                            <h2 class="title__line">Lançamentos</h2>
                        </div>
                    </div>
                </div>
                <div class="htc__product__container">
                    <div class="row">
                        <div class="product__list clearfix mt--30">
                            <?php
                            $vsSqlLancamentos = "
                                SELECT
                                    vp.id_vitrine_produto,
                                    vp.descricao,
                                    vp.url_amigavel AS url_produto,
                                    vpc.url_amigavel AS url_variacao,
                                    vpc.imagem1,
                                    vpc.referencia,
                                    vs.descricao AS subgrupo,
                                    vg.descricao AS grupo,
                                    vpc.descricao AS variacao
                                FROM
                                    vitrine_produto_cores vpc
                                    INNER JOIN vitrine_produto vp ON vp.id_vitrine_produto = vpc.id_vitrine_produto
                                    INNER JOIN vitrine_subgrupo vs ON vs.id_vitrine_subgrupo = vp.id_vitrine_subgrupo
                                    INNER JOIN vitrine_grupo vg ON vg.id_vitrine_grupo = vs.id_vitrine_grupo
                                WHERE
                                    vp.status = 1 AND
                                    vs.status = 1 AND
                                    vg.status = 1
                                ORDER BY
                                    vp.id_vitrine_produto DESC
                                LIMIT 4
                            ";
                            $vrsExecutaLancamentos = mysqli_query($Conexao, $vsSqlLancamentos) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                            while ($voResultadoLancamentos = mysqli_fetch_object($vrsExecutaLancamentos)) {
                                ?>
                                <div class="col-md-4 col-lg-3 col-sm-4 col-xs-12">
                                    <div class="category">
                                        <div class="ht__cat__thumb">
                                            <a href="<?php echo URL ?><?php echo url_amigavel($voResultadoLancamentos->grupo) ?>/<?php echo url_amigavel($voResultadoLancamentos->subgrupo) ?>/<?php echo $voResultadoLancamentos->url_produto ?>/<?php echo $voResultadoLancamentos->url_variacao ?>">
                                                <img src="<?php echo URL ?>wdadmin/uploads/vitrine_produtos/<?php echo $voResultadoLancamentos->imagem1 ?>" title="<?php echo $voResultadoLancamentos->descricao; ?>" alt="<?php echo $voResultadoLancamentos->descricao; ?>">
                                            </a>
                                        </div>
                                        <div class="fr__product__inner">
                                            <h4><a href="<?php echo URL ?><?php echo url_amigavel($voResultadoLancamentos->grupo) ?>/<?php echo url_amigavel($voResultadoLancamentos->subgrupo) ?>/<?php echo $voResultadoLancamentos->url_produto ?>/<?php echo $voResultadoLancamentos->url_variacao ?>" ><?php echo $voResultadoLancamentos->descricao; ?> <?php echo $voResultadoLancamentos->variacao ?></a></h4>
                                            <ul class="text--black">
                                                <li>Ref.: <?php echo $voResultadoLancamentos->referencia ?></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <?php
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="htc__brand__area bg__cat--4 pt--100">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section__title--2 text-center">
                            <h2 class="title__line">Distribuidores</h2>
                        </div>
                        <div class="ht__brand__inner">
                            <ul class="brand__list owl-carousel clearfix">
                                <?php
                                $vsSqlDistribuidores = "SELECT imagem_destaque, titulo FROM informacoes where id_paginas = 1";
                                $vrsExecutaDistribuidores = mysqli_query($Conexao, $vsSqlDistribuidores) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                while ($voResultadoDistribuidores = mysqli_fetch_object($vrsExecutaDistribuidores)) {
                                    ?>
                                    <li><img src="<?php echo URL ?>wdadmin/uploads/informacoes/<?php echo $voResultadoDistribuidores->imagem_destaque ?>" title="<?php echo $voResultadoDistribuidores->titulo ?>" alt="<?php echo $voResultadoDistribuidores->titulo ?>"></a></li>
                                    <?php
                                }
                                ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
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