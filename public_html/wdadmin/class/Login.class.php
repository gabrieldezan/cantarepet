<?php

require_once "Conexao.class.php";

class Login extends Conexao {

    private $login;
    private $senha;

    public function setLogin($login) {
        $this->login = $login;
    }

    public function setSenha($senha) {
        $this->senha = $senha;
    }

    public function getLogin() {
        return $this->login;
    }

    public function getSenha() {
        return md5($this->senha);
    }

    public function logar() {
        $pdo = parent::getDB();

        $logar = $pdo->prepare("
            SELECT   
                u.id_usuarios,
                u.nome,
                u.login,
                u.senha,
                u.imagem_perfil,
                u.status,
                ig.logo_principal
            FROM
                usuarios u, informacoes_gerais ig
            WHERE
                u.login = ? AND senha = ? AND status = 1
        ");
        $logar->bindValue(1, $this->getLogin());
        $logar->bindValue(2, $this->getSenha());
        $logar->execute();
        if ($logar->rowCount() == 1):
            $dados = $logar->fetch(PDO::FETCH_OBJ);
            $_SESSION['wd_id_usuario'] = $dados->id_usuarios;
            $_SESSION['wd_nome'] = $dados->nome;
            $_SESSION['wd_login'] = $dados->login;
            $_SESSION['wd_imagem_perfil'] = $dados->imagem_perfil !== "" ? $dados->imagem_perfil : "sem-imagem-avatar.png";
            $_SESSION['wd_status'] = $dados->status;
            $_SESSION['wd_logo_principal'] = $dados->logo_principal;
            $_SESSION['id_paginas'] = "";
            $_SESSION['titulo_pagina'] = "";
            $_SESSION['wd_logado'] = true;
            return true;
        else:
            return false;
        endif;
    }

    public static function deslogar() {
        session_start();
        if ($_SESSION['wd_logado']):
            unset($_SESSION['wd_logado']);
            session_destroy();
            return true;
        else:
            return false;
        endif;
    }

}
