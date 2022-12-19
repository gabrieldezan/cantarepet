<footer id="htc__footer">
    <div class="footer__container bg__cat--1">
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-3">
                    <div class="footer">
                        <h2 class="title__line--2">CANTARE</h2>
                        <div class="ft__details">
                            <?php
                            /* SOBRE */
                            $vsSqlSobre = "SELECT resumo_texto FROM sobre";
                            $vrsExecutaSobre = mysqli_query($Conexao, $vsSqlSobre) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                            while ($voResultadoSobre = mysqli_fetch_object($vrsExecutaSobre)) {
                                ?>
                                <p><?php echo $voResultadoSobre->resumo_texto; ?></p>
                                <?php
                            }
                            ?>
                            <div class="ft__social__link">
                                <ul class="social__link">
                                    <li><a href="https://www.facebook.com/<?php echo $voResultadoConfiguracoes->facebook ?>" target="_blank"><i class="fab fa-facebook-f fa-sm" title="Facebook"></i></a></li>
                                    <li><a href="https://api.whatsapp.com/send?l=pt_BR&phone=55<?php echo str_replace(array("(", ")", "-", " "), "", $voResultadoConfiguracoes->whatsapp) ?>" target="_blank"><i class="fab fa-whatsapp fa-sm" title="Whatsapp"></i></a></li>
                                    <li><a href="mailto:<?php echo $voResultadoConfiguracoes->email ?>"><i class="far fa-envelope fa-sm" title="E-mail"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-3 col-sm-offset-2">
                    <div class="footer mg-t-35">
                        <h2 class="title__line--2">Informações</h2>
                        <div class="ft__inner">
                            <ul class="ft__list">
                                <li><a href="<?php echo URL ?>">Home</a></li>
                                <li><a href="<?php echo URL ?>a-cantare">A Cantare</a></li>
                                <li><a href="<?php echo URL ?>onde-comprar">Onde comprar</a></li>
                                <li><a href="<?php echo URL ?>galeria">Galeria</a></li>
                                <li><a href="<?php echo URL ?>contato">Contato</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-3 col-sm-offset-1">
                    <div class="footer mg-t-35">
                        <h2 class="title__line--2">Produtos</h2>
                        <div class="ft__inner">
                            <ul class="ft__list">
                                <?php
                                $vsSqlSubgruposRodape = "
                                    SELECT
                                        vs.descricao,
                                        vg.descricao AS grupo
                                    FROM
                                        vitrine_subgrupo vs
                                        INNER JOIN vitrine_grupo vg ON vs.id_vitrine_grupo = vg.id_vitrine_grupo
                                    WHERE
                                        vs.status = 1 AND
                                        vg.status = 1
                                    ORDER BY
                                        RAND()
                                    LIMIT 5
                                ";
                                $vrsExecutaSubgruposRodape = mysqli_query($Conexao, $vsSqlSubgruposRodape) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                while ($voResultadoSubgruposRodape = mysqli_fetch_object($vrsExecutaSubgruposRodape)) {
                                    ?>
                                    <li><a href="<?php echo URL ?><?php echo url_amigavel($voResultadoSubgruposRodape->grupo)?>/<?php echo url_amigavel($voResultadoSubgruposRodape->descricao)?>"><?php echo $voResultadoSubgruposRodape->descricao; ?></a></li>
                                    <?php
                                }
                                ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="htc__copyright bg__cat--5">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="copyright__inner margin-l-24">
                        <p>Copyright© <a href="<?php echo URL ?>">Cantare</a>. Todos direitos reservados.</p>
                        <a href="https://webdezan.com.br" target="blank"><img src="<?php echo URL ?>images/logo-wd.png" alt="Web Dezan Agência Digital" title="Web Dezan Agência Digital"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>