<?php
$filtro = str_replace("-", "|", url_amigavel($parametro));

// definir o numero de itens por pagina
$itens_por_pagina = 10;

// pegar a pagina atual
$pagina = intval($numero_pagina - 1 . "0");

//verifica se a página é menor que 0
if ($pagina < 0) {
    include "pages/404.php";
} else {

    // pega a quantidade total de objetos no banco de dados
    $vsSqlTotal = "
        SELECT
            vp.id_vitrine_produto,
            vp.descricao,
            vpc.descricao AS variacao,
            vs.descricao AS subgrupo,
            vg.descricao AS grupo,
            vp.url_amigavel AS url_produto,
            vpc.url_amigavel AS url_variacao,
            vpc.imagem1,
            vpc.referencia
        FROM
            vitrine_produto_cores vpc
            INNER JOIN vitrine_produto vp ON vp.id_vitrine_produto = vpc.id_vitrine_produto
            INNER JOIN vitrine_subgrupo vs ON vs.id_vitrine_subgrupo = vp.id_vitrine_subgrupo
            INNER JOIN vitrine_grupo vg ON vg.id_vitrine_grupo = vs.id_vitrine_grupo
        WHERE
            vp.status = 1 AND
            vs.status = 1 AND
            vg.status = 1 AND
            vp.url_amigavel REGEXP '$filtro'
        ORDER BY
            vp.descricao
    ";
    $vrsExecutaTotal = mysqli_query($Conexao, $vsSqlTotal) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
    $viNumRowsTotal = mysqli_num_rows($vrsExecutaTotal);

    // puxar produtos do banco
    $vsSqlBusca = "
        $vsSqlTotal
        LIMIT $pagina, $itens_por_pagina
    ";
    $vrsExecutaBusca = mysqli_query($Conexao, $vsSqlBusca) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
    $viNumRowsBusca = mysqli_num_rows($vrsExecutaBusca);

    // definir numero de páginas
    $num_paginas = ceil($viNumRowsTotal / $itens_por_pagina);
    ?>
    <!DOCTYPE html>
    <html lang="pt-br">

        <head>
            <meta charset="utf-8">
            <meta http-equiv=X-UA-Compatible content="IE=edge">
            <link rel="shortcut icon" href="<?php echo URL ?>wdadmin/uploads/informacoes_gerais/<?php echo $voResultadoConfiguracoes->favicon ?>">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
            <meta name="description" content="<?php echo $voResultadoConfiguracoes->descricao ?>">
            <meta name="author" content="Web Dezan - Agência Digital">
            <meta name="robots" content="index, follow" />
            <meta name="googlebot" content="index, follow" />
            <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "buscar/" . $parametro ?>"/>
            <meta property="og:type" content="website"/>
            <meta property="og:title" content="<?php echo $voResultadoConfiguracoes->titulo ?>"/>
            <meta property="og:description" content="<?php echo $voResultadoConfiguracoes->descricao ?>"/>
            <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "buscar/" . $parametro ?>"/>
            <meta property="og:site_name" content="<?php echo $voResultadoConfiguracoes->nome_empresa ?>"/>
            <meta property="fb:admins" content="<?php echo $voResultadoConfiguracoes->facebook ?>"/>
            <title><?php echo $voResultadoConfiguracoes->titulo ?> - Busca</title>
            <style type="text/css">#preloader{background-color:#fff;height:100%;position:fixed;width:100%;z-index:9999999;}#preloader>img{left:45%;position:absolute;top:40%}</style>
        </head>

        <body data-spy="scroll" data-target="#header" onLoad="fecha_loader()">

            <?php /* LOADER */ ?>
            <div id="preloader">
                <img src="<?php echo URL ?>images/91.gif" alt="Preloader">
            </div>

            <?php
            /* MENU */
            include 'php/menu.php';
            ?>

            <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(../images/fundo_galeria.jpg) no-repeat scroll center center / cover ;">
                <div class="ht__bradcaump__wrap">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="bradcaump__inner">
                                    <nav class="bradcaump-inner">
                                        <h1 class="title__page">Resultados de: "<?php echo $parametro ?>"</h1><br>
                                        <a class="breadcrumb-item" href="home">Home</a>
                                        <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                        <span class="breadcrumb-item active">Busca</span>
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
                                            /* CONSULTA POSTS */
                                            if ($viNumRowsTotal > 0) {
                                                while ($voResultadoBusca = mysqli_fetch_object($vrsExecutaBusca)) {
                                                    ?>
                                                    <div class="col-md-3 col-lg-3 col-sm-6 col-xs-12 produto-card">
                                                        <div class="category">
                                                            <div class="ht__cat__thumb">
                                                                <a href="<?php echo URL ?><?php echo url_amigavel($voResultadoBusca->grupo) ?>/<?php echo url_amigavel($voResultadoBusca->subgrupo) ?>/<?php echo $voResultadoBusca->url_produto ?>/<?php echo $voResultadoBusca->url_variacao ?>">
                                                                    <img src="<?php echo URL ?>wdadmin/uploads/vitrine_produtos/<?php echo $voResultadoBusca->imagem1 ?>" alt="<?php echo $voResultadoBusca->descricao; ?>" title="<?php echo $voResultadoBusca->descricao; ?>">
                                                                </a>
                                                            </div>
                                                            <div class="fr__product__inner">
                                                                <h4><a href="<?php echo URL ?><?php echo url_amigavel($voResultadoBusca->grupo) ?>/<?php echo url_amigavel($voResultadoBusca->subgrupo) ?>/<?php echo $voResultadoBusca->url_produto ?>/<?php echo $voResultadoBusca->url_variacao ?>"><?php echo $voResultadoBusca->descricao; ?> <?php echo $voResultadoBusca->variacao ?></a></h4>
                                                                <ul class="text--black">
                                                                    <li>Ref.: <?php echo $voResultadoBusca->referencia ?></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <?php
                                                }
                                            } else {
                                                ?>
                                                <h3 class="resultado-buscar widget-sidebar">Nenhum resultado encontrado!</h3>
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
}