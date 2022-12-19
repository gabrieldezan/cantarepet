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
        <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "contato" ?>"/>
        <meta property="og:type" content="website"/>
        <meta property="og:title" content="<?php echo $voResultadoConfiguracoes->titulo ?>"/>
        <meta property="og:description" content="<?php echo $voResultadoConfiguracoes->descricao ?>"/>
        <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "contato" ?>"/>
        <meta property="og:site_name" content="<?php echo $voResultadoConfiguracoes->nome_empresa ?>"/>
        <meta property="fb:admins" content="<?php echo $voResultadoConfiguracoes->facebook ?>"/>
        <title><?php echo $voResultadoConfiguracoes->titulo ?> - Contato</title>
        <style type="text/css">#preloader{background-color:#fff;height:100%;position:fixed;width:100%;z-index:9999999;}#preloader>img{left:45%;position:absolute;top:40%}</style>
    </head>

    <body data-spy="scroll" data-target="#header" onLoad="fecha_loader()">

        <?php /* LOADER */ ?>
        <div id="preloader">
            <img src="<?php echo URL ?>images/91.gif" tirle="Preloader" alt="Preloader">
        </div>

        <div class="wrapper">

            <?php
            /* MENU */
            include 'php/menu.php';
            ?>

            <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(images/fundo_contato.jpg) no-repeat scroll center center / cover ;">
                <div class="ht__bradcaump__wrap">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="bradcaump__inner">
                                    <nav class="bradcaump-inner">
                                        <h1 class="title__page">CONTATO</h1><br>
                                        <a class="breadcrumb-item" href="<?php echo URL ?>">Home</a>
                                        <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                        <span class="breadcrumb-item active">Contato</span>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="htc__contact__area ptb--100 bg__white">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-6 col-sm-12 col-xs-12">
                        <div class="map-contacts--2">
                            <iframe src="<?php echo $voResultadoConfiguracoes->mapa ?>"frameborder="0" style="border:0; width:100%; height: 500px;" allowfullscreen=""></iframe>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-6 col-sm-12 col-xs-12">
                        <h2 class="title__line--6">ENTRE EM CONTATO CONOSCO</h2>
                        <div class="address">
                            <div class="address__icon">
                                <i class="fab fa-whatsapp fa-2x"></i>
                            </div>
                            <div class="address__details">
                                <h2 class="ct__title">WHATSAPP</h2>
                                <p><a target="_blank "href="https://api.whatsapp.com/send?l=pt_BR&phone=55<?php echo str_replace(array("(", ")", "-", " "), "", $voResultadoConfiguracoes->whatsapp) ?>"><?php echo $voResultadoConfiguracoes->whatsapp ?></a></p>
                            </div>
                        </div>
                        <div class="address">
                            <div class="address__icon">
                                <i class="icon-phone icons"></i>
                            </div>
                            <div class="address__details">
                                <h2 class="ct__title">TELEFONE</h2>
                                <p><a href="tel:+55<?php echo str_replace(array("(", ")", "-", " "), "", $voResultadoConfiguracoes->telefone) ?>"><?php echo $voResultadoConfiguracoes->telefone ?></a></p>
                            </div>
                        </div>

                        <div class="address">
                            <div class="address__icon">
                                <i class="far fa-envelope fa-2x"></i>
                            </div>
                            <div class="address__details">
                                <h2 class="ct__title">E-MAIL</h2>
                                <p><a href="mailto:<?php echo $voResultadoConfiguracoes->email ?>" target="_blank"><?php echo $voResultadoConfiguracoes->email ?></a></p>
                            </div>
                        </div>
                    </div>      
                </div>
                <div class="row">
                    <div class="contact-form-wrap mt--60">
                        <div class="col-xs-12">
                            <div class="contact-title">
                                <h2 class="title__line--6">ENVIE-NOS UM E-MAIL</h2>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <form id="form_contato" method="post" enctype="multipart/form-data">
                                <input type="hidden" id="vsUrl" name="vsUrl" value="<?php echo URL ?>" />
                                <input type="hidden" id="vsEmailContato" name="vsEmailContato" value="<?php echo EMAIL_CONTATO ?>" />
                                <input type="hidden" id="vsNomeEmpresa" name="vsNomeEmpresa" value="<?php echo $voResultadoConfiguracoes->nome_empresa ?>" />
                                <div class="single-contact-form">
                                    <div class="contact-box name">
                                        <input type="text" name="vsNome" id="vsNome" placeholder="Nome" class="form-control" required>
                                        <input type="email" name="vsEmail" id="vsEmail" placeholder="E-mail" class="form-control" required>
                                    </div>
                                </div>
                                <div class="single-contact-form">
                                    <div class="contact-box assunto">
                                        <textarea name="vsAssunto" id="vsAssunto" placeholder="Assunto" class="form-control" required></textarea>
                                    </div>
                                </div>
                                <div class="single-contact-form">
                                    <div class="contact-box message">
                                        <textarea name="vsMensagem" id="vsMensagem" placeholder="Mensagem" class="form-control" required></textarea>
                                    </div>
                                </div>
                                <div class="contact-btn">
                                    <button id="botao_enviar_mensagem" type="submit" class="fv-btn"><i class="fas fa-paper-plane"></i>Enviar Mensagem</button>
                                </div>
                            </form>
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
        
        <script src="<?php echo URL ?>wdadmin/js/contato.min.js"></script>

    </body>

</html>