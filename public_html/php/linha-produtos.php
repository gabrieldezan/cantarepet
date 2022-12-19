<section class="htc__category__area ptb--100">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="section__title--2 text-center">
                    <h2 class="title__line">Linha de Produtos</h2>
                    <div class="row">
                        <?php
                        $vsSqlGrupos = "SELECT id_vitrine_grupo, descricao, imagem FROM `vitrine_grupo` WHERE status = 1 ORDER BY descricao";
                        $vrsExecutaGrupos = mysqli_query($Conexao, $vsSqlGrupos) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                        while ($voResultadoGrupos = mysqli_fetch_object($vrsExecutaGrupos)) {
                            ?>
                            <div class="col-12 col-sm-4">
                                <center>
                                    <div class="row linha_produtos">
                                        <img src="<?php echo URL ?>wdadmin/uploads/vitrine_grupo/<?php echo $voResultadoGrupos->imagem ?>" class="img-responsive" title="<?php echo $voResultadoGrupos->descricao; ?>" alt="<?php echo $voResultadoGrupos->descricao; ?>"/>
                                    </div>
                                    <div class="titulo_linha_produto">
                                        <?php echo $voResultadoGrupos->descricao; ?>
                                    </div>
                                    <?php
                                    $vsSqlSubgrupos = "SELECT id_vitrine_subgrupo, descricao FROM vitrine_subgrupo WHERE status = 1 AND id_vitrine_grupo = $voResultadoGrupos->id_vitrine_grupo ORDER BY descricao";
                                    $vrsExecutaSubgrupos = mysqli_query($Conexao, $vsSqlSubgrupos) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                    while ($voResultadoSubgrupos = mysqli_fetch_object($vrsExecutaSubgrupos)) {
                                        ?>
                                    <a href="<?php echo URL ?><?php echo url_amigavel($voResultadoGrupos->descricao) ?>/<?php echo url_amigavel($voResultadoSubgrupos->descricao)?>"><?php echo $voResultadoSubgrupos->descricao; ?></a><br>
                                        <?php
                                    }
                                    ?>
                                </center>
                            </div>
                            <?php
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>