<header id="htc__header" class="htc__header__area header--one">
    <div id="sticky-header-with-topbar" class="mainmenu__wrap sticky__header">
        <div class="container">
            <div class="row">
                <div class="menumenu__container menumenu__container__iphone clearfix">
                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-5"> 
                        <div class="logo">
                            <a href="<?php echo URL ?>"><img src="<?php echo URL ?>wdadmin/uploads/informacoes_gerais/<?php echo $voResultadoConfiguracoes->logo_principal ?>" alt="<?php echo $voResultadoConfiguracoes->titulo ?>" title="<?php echo $voResultadoConfiguracoes->titulo ?>"></a>
                        </div>
                    </div>
                    <div class="col-md-7 col-lg-8 col-sm-5 col-xs-3">
                        <nav class="main__menu__nav hidden-xs hidden-sm">
                            <ul class="main__menu">
                                <li><a href="<?php echo URL ?>">Home</a></li>
                                <li><a href="<?php echo URL ?>a-cantare">A Cantare</a></li>
                                <li class="drop"><a class="cursor">Produtos</a>
                                    <ul class="dropdown mega_dropdown pd-dropdown">
                                        <?php
                                        $vsSqlGrupos = "SELECT id_vitrine_grupo, descricao FROM `vitrine_grupo` WHERE status = 1 ORDER BY descricao";
                                        $vrsExecutaGrupos = mysqli_query($Conexao, $vsSqlGrupos) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                        while ($voResultadoGrupos = mysqli_fetch_object($vrsExecutaGrupos)) {
                                            ?>
                                            <li><a class="mega__title"><?php echo $voResultadoGrupos->descricao; ?></a>
                                                <ul class="mega__item">
                                                    <?php
                                                    $vsSqlSubgrupos = "SELECT id_vitrine_subgrupo, descricao FROM vitrine_subgrupo WHERE status = 1 AND id_vitrine_grupo = $voResultadoGrupos->id_vitrine_grupo ORDER BY descricao";
                                                    $vrsExecutaSubgrupos = mysqli_query($Conexao, $vsSqlSubgrupos) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                                    while ($voResultadoSubgrupos = mysqli_fetch_object($vrsExecutaSubgrupos)) {
                                                        ?>
                                                        <li><a href="<?php echo URL ?><?php echo url_amigavel($voResultadoGrupos->descricao) ?>/<?php echo url_amigavel($voResultadoSubgrupos->descricao) ?>"><?php echo $voResultadoSubgrupos->descricao; ?></a></li>
                                                        <?php
                                                    }
                                                    ?>
                                                </ul>
                                            </li>
                                            <?php
                                        }
                                        ?>
                                    </ul>
                                </li>
                                <li class="drop"><a href="<?php echo URL ?>onde-comprar">Onde comprar</a></li>
                                <li><a href="<?php echo URL ?>galeria">Galeria</a></li>
                                <li><a href="<?php echo URL ?>contato">contato</a></li>
                            </ul>
                        </nav>
                        <div class="mobile-menu clearfix visible-xs visible-sm">
                            <nav id="mobile_dropdown">
                                <ul>
                                    <li><a href="<?php echo URL ?>">Home</a></li>
                                    <li><a href="<?php echo URL ?>a-cantare">A Cantare</a></li>
                                    <li><a>Produtos</a>
                                        <ul class="dropdown mega_dropdown">
                                            <?php
                                            $vsSqlGrupos = "SELECT id_vitrine_grupo, descricao FROM `vitrine_grupo` WHERE status = 1 ORDER BY descricao";
                                            $vrsExecutaGrupos = mysqli_query($Conexao, $vsSqlGrupos) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                            while ($voResultadoGrupos = mysqli_fetch_object($vrsExecutaGrupos)) {
                                                ?>
                                                <li><a class="mega__title"><?php echo $voResultadoGrupos->descricao; ?></a>
                                                    <ul class="mega__item">
                                                        <?php
                                                        $vsSqlSubgrupos = "
                                                            SELECT
                                                                 id_vitrine_subgrupo,
                                                                 descricao
                                                            FROM
                                                                vitrine_subgrupo
                                                            WHERE
                                                                status = 1 AND
                                                                id_vitrine_grupo = $voResultadoGrupos->id_vitrine_grupo
                                                            ORDER BY
                                                                descricao
                                                        ";
                                                        $vrsExecutaSubgrupos = mysqli_query($Conexao, $vsSqlSubgrupos) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                                        while ($voResultadoSubgrupos = mysqli_fetch_object($vrsExecutaSubgrupos)) {
                                                            ?>
                                                            <li><a href="<?php echo URL ?><?php echo url_amigavel($voResultadoGrupos->descricao) ?>/<?php echo url_amigavel($voResultadoSubgrupos->descricao) ?>"><?php echo $voResultadoSubgrupos->descricao; ?></a></li>
                                                            <?php
                                                        }
                                                        ?>
                                                    </ul>
                                                </li>
                                                <?php
                                            }
                                            ?>
                                        </ul>
                                    </li>
                                    <li><a href="<?php echo URL ?>onde-comprar">Onde Comprar</a></li>
                                    <li><a href="<?php echo URL ?>galeria">Galeria</a></li>
                                    <li><a href="<?php echo URL ?>contato">contato</a></li>
                                </ul>
                            </nav>
                        </div>  
                    </div>
                    <div class="col-md-3 col-lg-2 col-sm-4 col-xs-4">
                        <div class="header__right">
                            <div class="header__search search search__open icone-pesquisa">
                                <a href="#"><i class="icon-magnifier icons" title="buscar"></i></a>
                            </div>
                            <div class="htc__account icone-menu">
                                <a class="icone-iphone" href="https://www.facebook.com/<?php echo $voResultadoConfiguracoes->facebook ?>" target="_blank" title="Facebook"><i class="fab fa-facebook-f fa-lg"></i></a>
                            </div>
                            <div class="htc__account icone-menu">
                                <a class="icone-iphone" href="https://api.whatsapp.com/send?l=pt_BR&phone=55<?php echo str_replace(array("(", ")", "-", " "), "", $voResultadoConfiguracoes->whatsapp) ?>" target="_blank" title="Whatsapp"><i class="fab fa-whatsapp fa-lg"></i></a>
                            </div>
                            <div class="htc__account icone-menu">
                                <a class="icone-iphone" href="mailto:<?php echo $voResultadoConfiguracoes->email ?>" title="E-mail"><i class="far fa-envelope fa-lg"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="search__area">
                        <div class="container" >
                            <div class="row" >
                                <div class="col-md-12" >
                                    <div class="search__inner">
                                        <form>
                                            <input type="hidden" id="vsUrl" name="vsUrl" value="<?php echo URL ?>" />
                                            <input id="campo_buscar" name="campo_buscar" placeholder="Procure produtos..." type="text">
                                            <button name="botao_buscar" id="botao_buscar" type="button"></button>
                                        </form>
                                        <div class="search__close__btn">
                                            <span class="search__close__btn_icon"><i class="zmdi zmdi-close"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mobile-menu-area"></div>
            </div>
        </div>
</header>