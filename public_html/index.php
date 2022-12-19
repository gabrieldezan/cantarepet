<?php

error_reporting(0);

include 'wdadmin/config.php';
include 'php/conexao.php';
include 'wdadmin/controllers/MontaUrlAmigavel.php';

$Conexao = conecta();

$vsSql = "SELECT * FROM informacoes_gerais";
$vrExecuta = mysqli_query($Conexao, $vsSql) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
$voResultadoConfiguracoes = mysqli_fetch_object($vrExecuta);

define("EMAIL_CONTATO", $voResultadoConfiguracoes->email_contato);

$getUrl = strip_tags(trim(filter_input(INPUT_GET, "url", FILTER_DEFAULT)));
$Url = explode("/", $getUrl);

if ($Url[0] == "" || $Url[0] == "home") {
    $pagina = "home";
    $parametro = "";
} else if ($Url[0] == "buscar" && isset($Url[1])) {
    $pagina = "buscar";
    $parametro = $Url[1];
    $numero_pagina = isset($Url[2]) ? $Url[2] : "1";
} else if ($Url[0] == "a-cantare") {
    $pagina = "a-cantare";
    $parametro = "";
} else if ($Url[0] == "onde-comprar") {
    $pagina = "onde-comprar";
    $parametro = "";
} else if ($Url[0] == "galeria" && !isset($Url[1])) {
    $pagina = "galeria";
    $parametro = "";
} else if ($Url[0] == "galeria" && isset($Url[1])) {
    $pagina = "galeria-detalhes";
    $parametro = $Url[1];
} else if ($Url[0] == "contato") {
    $pagina = "contato";
    $parametro = "";
} else if (isset($Url[0]) && isset($Url[1]) && !isset($Url[2])) {
    $pagina = "produtos";
    $grupo = $Url[0];
    $subgrupo = $Url[1];
} else if (isset($Url[0]) && isset($Url[1]) && isset($Url[2]) && isset($Url[3])) {
    $pagina = "produto";
    $grupo = $Url[0];
    $subgrupo = $Url[1];
    $parametro = $Url[2];
    $peso = $Url[3];
} else {
    $pagina = "404";
    $parametro = "";
}

if (file_exists("pages/$pagina.php")) {
    include "pages/$pagina.php";
} else {
    include "pages/404.php";
}