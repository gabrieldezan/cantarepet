<?php
$vsSqlProduto = "
    SELECT
        vs.id_vitrine_subgrupo AS id_subgrupo,
        vs.descricao AS subgrupo,
        vg.descricao AS grupo,
        vs.imagem_capa AS imagem_capa,
        vp.id_vitrine_produto AS id_produto,
        vp.descricao,
        vpc.descricao AS variacao,
        vp.detalhes,
        vpc.referencia,
        informacao_adicional_1,
        informacao_adicional_2,
        informacao_adicional_3,
        vpc.imagem1 as imagem1,
        IF(vpc.imagem2 != '', vpc.imagem2, null) as imagem2,
        IF(vpc.imagem3 != '', vpc.imagem3, null) as imagem3,
        IF(vpc.imagem4 != '', vpc.imagem4, null) as imagem4,
        IF(vpc.imagem5 != '', vpc.imagem5, null) as imagem5
    FROM
        vitrine_produto_cores vpc
        INNER JOIN vitrine_produto vp ON vp.id_vitrine_produto= vpc.id_vitrine_produto
        INNER JOIN vitrine_subgrupo vs ON vs.id_vitrine_subgrupo= vp.id_vitrine_subgrupo
        INNER JOIN vitrine_grupo vg ON vg.id_vitrine_grupo= vs.id_vitrine_grupo
    WHERE
        vp.status = 1 AND
        vs.status = 1 AND
        vg.status = 1 AND
        vpc.url_amigavel = '$peso' AND
        vp.url_amigavel= '$parametro'
";
$vrsExecutaProduto = mysqli_query($Conexao, $vsSqlProduto) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
$vrsQntProduto = mysqli_num_rows($vrsExecutaProduto);
if ($vrsQntProduto > 0) {
    $voResultadoProduto = mysqli_fetch_object($vrsExecutaProduto);
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
            <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . $grupo . "/" . $subgrupo . "/" . $parametro . "/" . $peso ?>"/>
            <meta property="og:type" content="website"/>
            <meta property="og:title" content="<?php echo $voResultadoConfiguracoes->nome_empresa . " - " . $voResultadoProduto->descricao ?>"/>
            <meta property="og:description" content="<?php echo substr(strip_tags(trim($voResultadoProduto->detalhes)), 0, strrpos(substr(strip_tags(trim($voResultadoProduto->detalhes)), 0, 197), ' ')) . '...'; ?>"/>
            <meta property="og:image" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "wdadmin/uploads/vitrine_produtos/" . $voResultadoProduto->imagem1 ?>"/>
            <meta property="og:site_name" content="<?php echo $voResultadoConfiguracoes->nome_empresa ?>"/>
            <meta property="fb:admins" content="<?php echo $voResultadoConfiguracoes->facebook ?>"/>
            <title><?php echo $voResultadoConfiguracoes->titulo ?> - <?php echo $voResultadoProduto->descricao ?> <?php echo $voResultadoProduto->variacao ?></title>
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

            <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(<?php echo URL ?>images/fundo_detalhes_produto.jpg) no-repeat scroll center center / cover;">
                <div class="ht__bradcaump__wrap">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="bradcaump__inner">
                                    <nav class="bradcaump-inner">
                                        <h1 class="title__page"><?php echo $voResultadoProduto->descricao ?> <?php echo $voResultadoProduto->variacao ?></h1><br>
                                        <a class="breadcrumb-item" href="<?php echo URL ?>">Home</a>
                                        <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                        <a class="breadcrumb-item"><?php echo $voResultadoProduto->grupo ?></a>
                                        <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                        <a class="breadcrumb-item" href="<?php echo URL ?><?php echo url_amigavel($voResultadoProduto->grupo) ?>/<?php echo url_amigavel($voResultadoProduto->subgrupo) ?>"><?php echo $voResultadoProduto->subgrupo ?></a>
                                        <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                        <span class="breadcrumb-item active"><?php echo $voResultadoProduto->descricao ?> <?php echo $voResultadoProduto->variacao ?></span>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <section class="htc__product__details bg__white ptb--100">
                <div class="htc__product__details__top">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
                                <div class="htc__product__details__tab__content">
                                    <div class="product__big__images">
                                        <div class="portfolio-full-image tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="img-tab-1">
                                                <img src="<?php echo URL ?>wdadmin/uploads/vitrine_produtos/<?php echo $voResultadoProduto->imagem1 ?>" alt="imagem 1" title="imagem 1">
                                            </div>
                                            <?php
                                            if ($voResultadoProduto->imagem2 != null || !empty($voResultadoProduto->imagem2 !== null)) {
                                                ?>
                                                <div role="tabpanel" class="tab-pane fade" id="img-tab-2">
                                                    <img src="<?php echo URL ?>wdadmin/uploads/vitrine_produtos/<?php echo $voResultadoProduto->imagem2 ?>" alt="imagem 2" title="imagem 2">
                                                </div>
                                                <?php
                                            }
                                            ?>

                                            <?php
                                            if ($voResultadoProduto->imagem3 != null || !empty($voResultadoProduto->imagem3)) {
                                                ?>
                                                <div role="tabpanel" class="tab-pane fade" id="img-tab-3">
                                                    <img src="<?php echo URL ?>wdadmin/uploads/vitrine_produtos/<?php echo $voResultadoProduto->imagem3 ?>" alt="imagem 3" title="imagem 3">
                                                </div>
                                                <?php
                                            }
                                            ?>

                                            <?php
                                            if ($voResultadoProduto->imagem4 != null || !empty($voResultadoProduto->imagem4 !== null)) {
                                                ?>
                                                <div role="tabpanel" class="tab-pane fade" id="img-tab-4">
                                                    <img src="<?php echo URL ?>wdadmin/uploads/vitrine_produtos/<?php echo $voResultadoProduto->imagem4 ?>" alt="imagem 4" title="imagem 4">
                                                </div>
                                                <?php
                                            }
                                            ?>

                                            <?php
                                            if ($voResultadoProduto->imagem5 != null || !empty($voResultadoProduto->imagem5 !== null)) {
                                                ?>
                                                <div role="tabpanel" class="tab-pane fade" id="img-tab-5">
                                                    <img src="<?php echo URL ?>wdadmin/uploads/vitrine_produtos/<?php echo $voResultadoProduto->imagem5 ?>" alt="imagem 5"  title="imagem 5">
                                                </div>
                                                <?php
                                            }
                                            ?>
                                        </div>
                                    </div>
                                    <ul class="product__small__images" role="tablist">
                                        <li role="presentation" class="pot-small-img">
                                            <a href="#img-tab-1" role="tab" data-toggle="tab">
                                                <img src= "<?php echo URL ?>wdadmin/uploads/vitrine_produtos/<?php echo $voResultadoProduto->imagem1 ?>" alt="imagem 1" title="imagem 1">
                                            </a>
                                        </li>
                                        <?php
                                        if ($voResultadoProduto->imagem2 != null || !empty($voResultadoProduto->imagem2 !== null)) {
                                            ?>
                                            <li role="presentation" class="pot-small-img">
                                                <a href="#img-tab-2" role="tab" data-toggle="tab">
                                                    <img src= "<?php echo URL ?>wdadmin/uploads/vitrine_produtos/<?php echo $voResultadoProduto->imagem2 ?>" alt="imagem 2" title="imagem 2">
                                                </a>
                                            </li>
                                            <?php
                                        }
                                        if ($voResultadoProduto->imagem3 != null || !empty($voResultadoProduto->imagem3 !== null)) {
                                            ?>
                                            <li role="presentation" class="pot-small-img">
                                                <a href="#img-tab-3" role="tab" data-toggle="tab">
                                                    <img src= "<?php echo URL ?>wdadmin/uploads/vitrine_produtos/<?php echo $voResultadoProduto->imagem3 ?>" alt="imagem 3" title="imagem 3">
                                                </a>
                                            </li>
                                            <?php
                                        }
                                        if ($voResultadoProduto->imagem4 != null || !empty($voResultadoProduto->imagem4 !== null)) {
                                            ?>
                                            <li role="presentation" class="pot-small-img">
                                                <a href="#img-tab-4" role="tab" data-toggle="tab">
                                                    <img src= "<?php echo URL ?>wdadmin/uploads/vitrine_produtos/<?php echo $voResultadoProduto->imagem4 ?>" alt="imagem 4" title="imagem 4">
                                                </a>
                                            </li>
                                            <?php
                                        }
                                        if ($voResultadoProduto->imagem5 != null || !empty($voResultadoProduto->imagem5 !== null)) {
                                            ?>
                                            <li role="presentation" class="pot-small-img">
                                                <a href="#img-tab-5" role="tab" data-toggle="tab">
                                                    <img src= "<?php echo URL ?>wdadmin/uploads/vitrine_produtos/<?php echo $voResultadoProduto->imagem5 ?>" alt="imagem 5" title="imagem 5">
                                                </a>
                                            </li>
                                            <?php
                                        }
                                        ?>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-7 col-lg-7 col-sm-12 col-xs-12 smt-40 xmt-40">
                                <div class="ht__product__dtl">
                                    <h2><?php echo $voResultadoProduto->descricao ?></h2>
                                    <h6>Ref.: <?php echo $voResultadoProduto->referencia ?></h6>
                                    <p class="pro__info"><?php echo $voResultadoProduto->detalhes ?></p>
                                    <div class="ht__pro__desc">
                                        <div class="sin__desc align--left">
                                            <p><span>Categorias:</span></p>
                                            <ul class="pro__cat__list">
                                                <li><a><?php echo $voResultadoProduto->grupo ?> ></a></li>
                                                <li><a href="<?php echo URL ?><?php echo url_amigavel($voResultadoProduto->grupo) ?>/<?php echo url_amigavel($voResultadoProduto->subgrupo) ?>"><?php echo $voResultadoProduto->subgrupo ?></a></li>
                                            </ul>
                                        </div>
                                        <div class="sin__desc align--left">
                                            <p><span>Variações:</span></p>
                                            <ul class="pro__color">
                                                <?php
                                                /* VARIÇÕES */
                                                $vsSqlVaricaoes = "
                                                    SELECT
                                                        descricao,
                                                        url_amigavel
                                                    FROM
                                                        vitrine_produto_cores
                                                    WHERE
                                                        id_vitrine_produto = $voResultadoProduto->id_produto
                                                    ORDER BY
                                                        descricao ASC
                                                ";
                                                $vrsExecutaVaricaoes = mysqli_query($Conexao, $vsSqlVaricaoes) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                                while ($voResultadoVaricaoes = mysqli_fetch_object($vrsExecutaVaricaoes)) {
                                                    ?>
                                                    <li><a href="<?php echo URL . url_amigavel($voResultadoProduto->grupo) . "/" . url_amigavel($voResultadoProduto->subgrupo) . "/" . $parametro . "/" . $voResultadoVaricaoes->url_amigavel ?>"><?php echo $voResultadoVaricaoes->descricao ?></a></li>
                                                    <?php
                                                }
                                                ?>
                                            </ul>
                                        </div>
                                        <div class="sin__desc product__share__link">
                                            <p><span>Compartilhe nas redes sociais:</span></p>
                                            <ul class="pro__share">
                                                <li><a href="http://www.facebook.com/sharer.php?u=<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . $grupo . "/" . $subgrupo . "/" . $parametro . "/" . $peso ?>&title=<?php echo $voResultadoProduto->descricao ?>" onclick="window.open(this.href, 'windowName', 'width=600, height=400, left=24, top=24, scrollbars, resizable');
                                                            return false;" rel="nofollow" target="_blank"><i class="icon-social-facebook icons"></i></a></li>
                                                <li><a href="http://twitter.com/share?url=<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . $grupo . "/" . $subgrupo . "/" . $parametro . "/" . $peso ?>&title=<?php echo $voResultadoProduto->descricao ?>" onclick="window.open(this.href, 'windowName', 'width=600, height=400, left=24, top=24, scrollbars, resizable');
                                                            return false;" rel="nofollow" target="_blank"><i class="icon-social-twitter icons"></i></a></li>
                                                <li><a href="http://pinterest.com/pin/create/button/?url=<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . $grupo . "/" . $subgrupo . "/" . $parametro . "/" . $peso ?>&amp;media=<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "wdadmin/uploads/vitrine_produtos/" . $voResultadoProduto->imagem1 ?>&amp;description=<?php echo substr(strip_tags(trim($voResultadoProduto->detalhes)), 0, strrpos(substr(strip_tags(trim($voResultadoProduto->detalhes)), 0, 140), ' ')) . '...'; ?>" onclick="window.open(this.href, 'windowName', 'width=600, height=400, left=24, top=24, scrollbars, resizable');
                                                            return false;" rel="nofollow" target="_blank"><i class="icon-social-pinterest icons"></i></a></li>
                                                <li><a href="https://api.whatsapp.com/send?text=Leia mais em: <?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . $grupo . "/" . $subgrupo . "/" . $parametro . "/" . $peso ?>" onclick="window.open(this.href, 'windowName', 'width=600, height=400, left=24, top=24, scrollbars, resizable');
                                                            return false;" rel="nofollow" target="_blank"><i class="fa fa-whatsapp"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="htc__produc__decription bg__white">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <ul class="pro__details__tab" role="tablist">
                                <li role="presentation" class="active"><a href="#composicao_basica" role="tab" data-toggle= "tab">COMPOSIÇÃO BÁSICA</a></li>
                                <li role="presentation"><a href="#nivel_garantia" role="tab" data-toggle= "tab">NÍVEIS DE GARANTIA</a></li>
                                <li class="no-border-right" role="presentation"><a href="#enriquecimento_quilo" role="tab" data-toggle="tab">ENRIQUECIMENTO POR QUILO DE PRODUTO</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="ht__pro__details__content">
                                <div role="tabpanel" id="composicao_basica" class="pro__single__content tab-pane fadeIn active">
                                    <div class="col-xs-12">
                                        <?php echo $voResultadoProduto->informacao_adicional_1 ?>
                                    </div>
                                </div>
                                <div role="tabpanel" id="nivel_garantia" class="pro__single__content tab-pane fadeIn">
                                    <div class="col-xs-12">
                                        <?php echo $voResultadoProduto->informacao_adicional_2 ?>
                                    </div>
                                </div>
                                <div role="tabpanel" id="enriquecimento_quilo" class="pro__single__content tab-pane fadeIn">
                                    <div class="col-xs-12">
                                        <?php echo $voResultadoProduto->informacao_adicional_3 ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="htc__product__area--2 pb--100 product-details-res">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="section__title--2 text-center">
                            <h2 class="title__line">Produtos Relacionados</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="product__wrap clearfix">
                        <?php
                        $vsSqlProdutosRelacionados = "
                            SELECT
                                vp.id_vitrine_produto,
                                vp.descricao,
                                vp.url_amigavel AS url_produto,
                                vpc.imagem1,
                                vpc.referencia,
                                vs.descricao AS subgrupo,
                                vg.descricao AS grupo
                            FROM
                                vitrine_produto_cores vpc
                                INNER JOIN vitrine_produto vp ON vp.id_vitrine_produto= vpc.id_vitrine_produto
                                INNER JOIN vitrine_subgrupo vs ON vs.id_vitrine_subgrupo= vp.id_vitrine_subgrupo
                                INNER JOIN vitrine_grupo vg ON vg.id_vitrine_grupo= vs.id_vitrine_grupo
                            WHERE
                                vp.status= 1 AND
                                vs.status= 1 AND
                                vg.status= 1 AND
                                vp.id_vitrine_subgrupo= $voResultadoProduto->id_subgrupo AND
                                vp.id_vitrine_produto !=$voResultadoProduto->id_produto
                            ORDER BY RAND()        
                            LIMIT 4
                        ";
                        $vrsExecutaProdutosRelacionados = mysqli_query($Conexao, $vsSqlProdutosRelacionados) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                        while ($voResultadoProdutosRelacionados = mysqli_fetch_object($vrsExecutaProdutosRelacionados)) {
                            ?>
                            <div class="col-md-3 col-lg-3 col-sm-6 col-xs-12">
                                <div class="category">
                                    <div class="ht__cat__thumb">
                                        <a href="<?php echo URL ?><?php echo url_amigavel($voResultadoProdutosRelacionados->grupo) ?>/<?php echo url_amigavel($voResultadoProdutosRelacionados->subgrupo) ?>/<?php echo $voResultadoProdutosRelacionados->url_produto ?>">
                                            <img src="<?php echo URL ?>wdadmin/uploads/vitrine_produtos/<?php echo $voResultadoProdutosRelacionados->imagem1 ?>" title="<?php echo $voResultadoProdutosRelacionados->descricao; ?>" alt="<?php echo $voResultadoProdutosRelacionados->descricao; ?>">
                                        </a>
                                    </div>
                                    <div class="fr__product__inner">
                                        <h4><a href="<?php echo URL ?><?php echo url_amigavel($voResultadoProdutosRelacionados->grupo) ?>/<?php echo url_amigavel($voResultadoProdutosRelacionados->subgrupo) ?>/<?php echo $voResultadoProdutosRelacionados->url_produto ?>"><?php echo $voResultadoProdutosRelacionados->descricao; ?></a></h4>
                                        <ul class="text--black">
                                            <li>Ref.: <?php echo $voResultadoProdutosRelacionados->referencia ?></li>
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
    