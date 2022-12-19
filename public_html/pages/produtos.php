<?php
$consulta_subgrupo = str_replace('-', ' ', $subgrupo);

$vsSqlCabecalho = "
    SELECT
        vs.id_vitrine_subgrupo AS id_subgrupo,
        vg.id_vitrine_grupo AS id_grupo,
        vs.descricao AS subgrupo,
        vg.descricao AS grupo,
        vs.imagem_capa AS imagem_capa
    FROM 
	vitrine_subgrupo vs
	INNER JOIN vitrine_grupo vg ON vs.id_vitrine_grupo = vg.id_vitrine_grupo
    WHERE
	vs.status = 1 AND
        vg.descricao = '$grupo' AND
        vs.descricao = '$consulta_subgrupo' AND
        vs.id_vitrine_grupo = vg.id_vitrine_grupo
";
$vrsExecutaCabecalho = mysqli_query($Conexao, $vsSqlCabecalho) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
$vrsQntCabecalho = mysqli_num_rows($vrsExecutaCabecalho);

if ($vrsQntCabecalho > 0) {
    $voResultadoCabecalho = mysqli_fetch_object($vrsExecutaCabecalho);
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
            <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL ?>"/>
            <meta property="og:type" content="website"/>
            <meta property="og:title" content="<?php echo "Produtos - " . $voResultadoConfiguracoes->titulo ?>"/>
            <meta property="og:description" content="<?php echo $voResultadoProdutos->descricao ?>"/>
            <meta property="og:image" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL ?>"/>
            <meta property="og:site_name" content="<?php echo $voResultadoConfiguracoes->nome_empresa ?>"/>
            <meta property="fb:admins" content="<?php echo $voResultadoConfiguracoes->facebook ?>"/>
            <title><?php echo $voResultadoConfiguracoes->titulo ?> - <?php echo $voResultadoCabecalho->subgrupo ?></title>
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
            <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(<?php echo URL ?>wdadmin/uploads/vitrine_subgrupo/<?php echo $voResultadoCabecalho->imagem_capa ?>) no-repeat scroll center center / cover ;">
                <div class="ht__bradcaump__wrap">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="bradcaump__inner">
                                    <nav class="bradcaump-inner">
                                        <h1 class="title__page"><?php echo $voResultadoCabecalho->subgrupo ?></h1><br>
                                        <a class="breadcrumb-item" href="<?php echo URL ?>">Home</a>
                                        <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                        <span class="breadcrumb-item"><?php echo $voResultadoCabecalho->grupo ?></span>
                                        <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                        <span class="breadcrumb-item active"><?php echo $voResultadoCabecalho->subgrupo ?></span>
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
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="htc__product__rightidebar">
                                <div class="htc__grid__top"></div>
                                <div class="row">
                                    <div class="shop__grid__view__wrap">
                                        <div role="tabpanel" id="grid-view" class="single-grid-view tab-pane fade in active clearfix">
                                            <?php
                                            $vsSqlProdutos = "
                                                SELECT
                                                    vp.id_vitrine_produto,
                                                    vp.descricao,
                                                    vp.url_amigavel AS url_produto,
                                                    vpc.url_amigavel AS url_peso,
                                                    vpc.imagem1,
                                                    vpc.referencia,
                                                    vpc.descricao AS variacao
                                                FROM
                                                    vitrine_produto_cores vpc
                                                    INNER JOIN vitrine_produto vp ON vp.id_vitrine_produto = vpc.id_vitrine_produto
                                                    INNER JOIN vitrine_subgrupo vs ON vs.id_vitrine_subgrupo = vp.id_vitrine_subgrupo
                                                    INNER JOIN vitrine_grupo vg ON vg.id_vitrine_grupo = vs.id_vitrine_grupo
                                                WHERE
                                                    vp.status = 1 AND
                                                    vs.status = 1 AND
                                                    vg.status = 1 AND
                                                    vp.id_vitrine_subgrupo = $voResultadoCabecalho->id_subgrupo AND
                                                    vg.id_vitrine_grupo = $voResultadoCabecalho->id_grupo
                                                ORDER BY
                                                    vp.descricao
                                            ";
                                            $vrsExecutaProdutos = mysqli_query($Conexao, $vsSqlProdutos) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                            while ($voResultadoProdutos = mysqli_fetch_object($vrsExecutaProdutos)) {
                                                ?>
                                                <div class="col-md-3 col-lg-3 produto-card col-sm-6 col-xs-12">
                                                    <div class="category">
                                                        <div class="ht__cat__thumb">
                                                            <a href="<?php echo URL ?><?php echo url_amigavel($voResultadoCabecalho->grupo) ?>/<?php echo url_amigavel($voResultadoCabecalho->subgrupo) ?>/<?php echo $voResultadoProdutos->url_produto ?>/<?php echo $voResultadoProdutos->url_peso ?>">
                                                                <img src="<?php echo URL ?>wdadmin/uploads/vitrine_produtos/<?php echo $voResultadoProdutos->imagem1 ?>" alt="<?php echo $voResultadoProdutos->descricao; ?>" title="<?php echo $voResultadoProdutos->descricao; ?>">
                                                            </a>
                                                        </div>
                                                        <div class="fr__product__inner">
                                                            <h4><a href="<?php echo URL ?><?php echo url_amigavel($voResultadoCabecalho->grupo) ?>/<?php echo url_amigavel($voResultadoCabecalho->subgrupo) ?>/<?php echo $voResultadoProdutos->url_produto ?>/<?php echo $voResultadoProdutos->url_peso ?>"><?php echo $voResultadoProdutos->descricao; ?> <?php echo $voResultadoProdutos->variacao ?></a></h4>
                                                            <ul class="text--black">
                                                                <li>Ref.: <?php echo $voResultadoProdutos->referencia ?></li>
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
                        </div>
                        <div class="col-lg-3 col-lg-pull-9 col-md-3 col-md-pull-9 col-sm-12 col-xs-12 smt-40 xmt-40"></div>
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

        </body>

    </html>
    <?php
} else {
    include "pages/404.php";
}