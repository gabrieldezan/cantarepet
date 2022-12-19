-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 26/05/2020 às 12:01
-- Versão do servidor: 5.7.23-23
-- Versão do PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `webde132_site_cantare`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `banner`
--

CREATE TABLE `banner` (
  `id_banner` int(11) NOT NULL,
  `imagem` longtext,
  `titulo` varchar(100) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `banner`
--

INSERT INTO `banner` (`id_banner`, `imagem`, `titulo`, `descricao`, `link`) VALUES
(1, 'novidade-201911042051.png', 'Destaque', 'Produto 1', ''),
(2, 'novidade-201911042052.png', 'Destaque', 'Produto 2', ''),
(3, 'destaque-201911121321.png', 'Destaque', 'Produto 3', ''),
(4, 'destaque-201911121322.png', 'Destaque', 'Produto 4', ''),
(5, 'destaque-201911121322.png', 'Destaque', 'Produto 5', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_categorias`
--

CREATE TABLE `blog_categorias` (
  `id_blog_categorias` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `posicao` int(11) DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_comentario`
--

CREATE TABLE `blog_comentario` (
  `id_blog_comentario` int(11) NOT NULL,
  `comentario` longtext,
  `data_horario` datetime DEFAULT NULL,
  `id_blog_postagem` int(11) NOT NULL,
  `id_usuario_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_imagens`
--

CREATE TABLE `blog_imagens` (
  `id_blog_imagens` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_postagem`
--

CREATE TABLE `blog_postagem` (
  `id_blog_postagem` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `texto` longtext,
  `imagem` longtext,
  `data_criacao` datetime DEFAULT NULL,
  `data_publicacao` datetime DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `visualizacoes` int(11) DEFAULT '0',
  `id_usuarios` int(11) NOT NULL,
  `id_blog_subcategorias` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_postagem_galeria`
--

CREATE TABLE `blog_postagem_galeria` (
  `id_blog_postagem_galeria` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `imagem` longtext,
  `id_blog_postagem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_subcategorias`
--

CREATE TABLE `blog_subcategorias` (
  `id_blog_subcategorias` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `posicao` int(11) DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `id_blog_categorias` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cases`
--

CREATE TABLE `cases` (
  `id_cases` int(11) NOT NULL,
  `servico` varchar(255) DEFAULT NULL,
  `arquivo` longtext,
  `imagem` longtext,
  `id_clientes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_clientes` int(11) NOT NULL,
  `imagem` longtext,
  `descricao` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `clientes`
--

INSERT INTO `clientes` (`id_clientes`, `imagem`, `descricao`, `endereco`, `cidade`, `estado`, `telefone`, `link`, `status`) VALUES
(1, 'empresa-1-201911061735.jpg', 'Empresa 1', 'Av. Brasil, 7020 - Centro', 'Cascavel', 'PR', '', '', 1),
(2, 'empresa-2-201911061736.png', 'Empresa 2', 'R. Mal. Deodoro, 555 - 10º andar - Centro', 'Curitiba', 'PR', NULL, '', 1),
(3, 'empresa-3-201911061737.jpeg', 'Empresa 3', 'Av. das Américas, 4200 - Barra da Tijuca', 'Rio de Janeiro', 'RJ', NULL, '', 1),
(4, 'empresa-4-201911061739.jpg', 'Empresa 4', 'Rua Inácio Francisco de Souza, 1597 - Centro', 'Penha', 'SC', NULL, '', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `depoimentos`
--

CREATE TABLE `depoimentos` (
  `id_depoimentos` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `texto` longtext,
  `imagem` longtext,
  `id_clientes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `id_enderecos` int(11) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipe`
--

CREATE TABLE `equipe` (
  `id_equipe` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `informacao_adicional` varchar(255) DEFAULT NULL,
  `resumo` varchar(255) DEFAULT NULL,
  `detalhes` longtext,
  `imagem` longtext,
  `destaque` int(11) DEFAULT NULL COMMENT '1-Sim\n0-Não',
  `url_amigavel` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1-Ativo\n0-Inativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipe_contato`
--

CREATE TABLE `equipe_contato` (
  `id_equipe_contato` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `icone` varchar(255) DEFAULT NULL,
  `link` longtext,
  `tipo` int(11) DEFAULT NULL COMMENT '1-Telefônico\n2-E-mail\n3-Redes Sociais\n4-Outros',
  `id_equipe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos`
--

CREATE TABLE `eventos` (
  `id_eventos` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `detalhes` longtext NOT NULL,
  `mais_informacoes` longtext NOT NULL,
  `mapa` longtext NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `valor_adicional` decimal(10,2) NOT NULL DEFAULT '0.00',
  `data_evento` datetime NOT NULL,
  `imagem` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `url_amigavel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `galeria_grupo`
--

CREATE TABLE `galeria_grupo` (
  `id_galeria_grupo` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `galeria_grupo`
--

INSERT INTO `galeria_grupo` (`id_galeria_grupo`, `descricao`, `status`) VALUES
(1, 'teste', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `galeria_imagem`
--

CREATE TABLE `galeria_imagem` (
  `id_galeria_imagem` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `imagem1` longtext,
  `imagem2` longtext,
  `imagem3` longtext,
  `imagem4` longtext,
  `imagem5` longtext,
  `descricao` longtext,
  `detalhes` longtext,
  `link1` longtext,
  `link2` longtext,
  `youtube` longtext,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `id_galeria_grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `galeria_imagem`
--

INSERT INTO `galeria_imagem` (`id_galeria_imagem`, `titulo`, `imagem1`, `imagem2`, `imagem3`, `imagem4`, `imagem5`, `descricao`, `detalhes`, `link1`, `link2`, `youtube`, `url_amigavel`, `id_galeria_grupo`) VALUES
(1, 'Teste 1', 'teste-1-1-201911051745.jpg', 'teste-1-2-201911051745.jpg', 'teste-1-3-201911051745.jpg', 'teste-1-4-201911051745.jpg', 'teste-1-5-201911051745.jpg', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example.', '', '', '', '', 'teste-1', 1),
(2, 'Teste 2', 'teste-2-1-201911051746.jpg', 'teste-2-2-201911051746.jpg', 'teste-2-3-201911051746.jpg', 'teste-2-4-201911051746.jpg', 'teste-2-5-201911051746.jpg', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example.', '', '', '', '', 'teste-2', 1),
(3, 'Teste 3', 'teste-3-1-201911051746.jpg', 'teste-3-2-201911051746.jpg', 'teste-3-3-201911051746.jpg', 'teste-3-4-201911051746.jpg', 'teste-3-5-201911051746.jpg', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example.', '', '', '', '', 'teste-3', 1),
(4, 'Teste 4', 'teste-4-1-201911051747.jpg', 'teste-4-2-201911051747.jpg', 'teste-4-3-201911051747.jpg', 'teste-4-4-201911051747.jpg', 'teste-4-5-201911051747.jpg', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example.', '', '', '', '', 'teste-4', 1),
(5, 'Teste 5', 'teste-5-1-201911051747.jpg', 'teste-5-2-201911051747.jpg', 'teste-5-3-201911051747.jpg', 'teste-5-4-201911051747.jpg', 'teste-5-5-201911051747.jpg', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example.', '', '', '', '', 'teste-5', 1),
(6, 'Teste 6', 'teste-6-1-201911051747.jpg', 'teste-6-2-201911051747.jpg', 'teste-6-3-201911051747.jpg', 'teste-6-4-201911051747.jpg', 'teste-6-5-201911051747.jpg', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example.', '', '', '', '', 'teste-6', 1),
(7, 'Teste 7', 'teste-7-1-201911051748.jpg', 'teste-7-2-201911051748.jpg', 'teste-7-3-201911051748.jpg', 'teste-7-4-201911051748.jpg', 'teste-7-5-201911051748.jpg', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example.', '', '', '', '', 'teste-7', 1),
(8, 'Teste 8', 'teste-8-1-201911051748.jpg', 'teste-8-2-201911051748.jpg', 'teste-8-3-201911051748.jpg', 'teste-8-4-201911051748.jpg', 'teste-8-5-201911051748.jpg', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example.', '', '', '', '', 'teste-8', 1),
(9, 'Teste 9', 'teste-9-1-201911051749.jpg', 'teste-9-2-201911051749.jpg', 'teste-9-3-201911051749.jpg', 'teste-9-4-201911051749.jpg', 'teste-9-5-201911051749.jpg', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example.', '', '', '', '', 'teste-9', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `informacoes`
--

CREATE TABLE `informacoes` (
  `id_informacoes` int(11) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `icone` varchar(45) DEFAULT NULL,
  `imagem_destaque` varchar(255) DEFAULT NULL,
  `texto` longtext,
  `link` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `id_paginas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `informacoes`
--

INSERT INTO `informacoes` (`id_informacoes`, `titulo`, `icone`, `imagem_destaque`, `texto`, `link`, `data`, `hora`, `id_paginas`) VALUES
(1, 'Distribuidor 1', '', 'distribuidores-distribuidor-1-201911051516.png', '', '', '0000-00-00', '00:00:00', 1),
(2, 'Distribuidor 2', '', 'distribuidores-distribuidor-2-201911051517.png', '', '', '0000-00-00', '00:00:00', 1),
(3, 'Distribuidor 3', '', 'distribuidores-distribuidor-3-201911051517.png', '', '', '0000-00-00', '00:00:00', 1),
(4, 'Distribuidor 4', '', 'distribuidores-distribuidor-4-201911051517.png', '', '', '0000-00-00', '00:00:00', 1),
(5, 'Distribuidor 5', '', 'distribuidores-distribuidor-5-201911051517.png', '', '', '0000-00-00', '00:00:00', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `informacoes_gerais`
--

CREATE TABLE `informacoes_gerais` (
  `nome_empresa` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `mapa` longtext,
  `horario_atendimento` varchar(255) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `whatsapp` varchar(45) DEFAULT NULL,
  `celular1` varchar(45) DEFAULT NULL,
  `celular2` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `email_contato` varchar(100) DEFAULT NULL,
  `envio_host` varchar(255) DEFAULT NULL,
  `envio_porta` varchar(255) DEFAULT NULL,
  `envio_email` varchar(255) DEFAULT NULL,
  `envio_senha` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `pinterest` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `logo_principal` varchar(255) DEFAULT NULL,
  `logo_secundaria` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `informacoes_gerais`
--

INSERT INTO `informacoes_gerais` (`nome_empresa`, `titulo`, `descricao`, `mapa`, `horario_atendimento`, `telefone`, `whatsapp`, `celular1`, `celular2`, `email`, `email_contato`, `envio_host`, `envio_porta`, `envio_email`, `envio_senha`, `facebook`, `twitter`, `instagram`, `youtube`, `linkedin`, `pinterest`, `favicon`, `logo_principal`, `logo_secundaria`) VALUES
('Cantare', 'Cantare', 'Descrição Cantare', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3036.9589583960046!2d116.56818621539638!3d40.43190767936339!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35f121d7687f2ccf%3A0xd040259b950522df!2sMuralha%20da%20China!5e0!3m2!1spt-BR!2sbr!4v1572958500869!5m2!1spt-BR!2sbr', '', '(45) 3333-4444', '(45) 99819-6103', '', '', 'alan@webdezan.com.br', 'alan@webdezan.com.br', NULL, NULL, NULL, NULL, 'profile.php?id=100007871087929', '', '', '', '', '', 'favicon-cantare-201911121924.png', 'logo-cantare-201911042011.png', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `missao_visao_valores`
--

CREATE TABLE `missao_visao_valores` (
  `icone_missao` varchar(255) DEFAULT NULL,
  `imagem_missao` longtext,
  `texto_missao` longtext,
  `icone_visao` varchar(255) DEFAULT NULL,
  `imagem_visao` longtext,
  `texto_visao` longtext,
  `icone_valores` varchar(255) DEFAULT NULL,
  `imagem_valores` longtext,
  `texto_valores` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `missao_visao_valores`
--

INSERT INTO `missao_visao_valores` (`icone_missao`, `imagem_missao`, `texto_missao`, `icone_visao`, `imagem_visao`, `texto_visao`, `icone_valores`, `imagem_valores`, `texto_valores`) VALUES
('', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `paginas`
--

CREATE TABLE `paginas` (
  `id_paginas` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `icone` int(11) DEFAULT NULL,
  `imagem_destaque` int(11) DEFAULT NULL,
  `texto` int(11) DEFAULT NULL,
  `link` int(11) DEFAULT NULL,
  `data` int(11) DEFAULT NULL,
  `hora` int(11) DEFAULT NULL,
  `posicao` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `paginas`
--

INSERT INTO `paginas` (`id_paginas`, `titulo`, `icone`, `imagem_destaque`, `texto`, `link`, `data`, `hora`, `posicao`, `url`) VALUES
(1, 'Distribuidores', 0, 1, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `perguntas_frequentes`
--

CREATE TABLE `perguntas_frequentes` (
  `id_perguntas_frequentes` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `pergunta` varchar(255) DEFAULT NULL,
  `resposta` longtext,
  `id_servicos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rh_candidatos`
--

CREATE TABLE `rh_candidatos` (
  `id_rh_candidatos` int(11) NOT NULL,
  `nome_completo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `data_preenchimento` datetime DEFAULT NULL,
  `celular_whats` varchar(45) DEFAULT NULL,
  `telefone_recados` varchar(45) DEFAULT NULL,
  `naturalidade` varchar(255) DEFAULT NULL,
  `nacionalidade` varchar(255) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `idade` varchar(45) DEFAULT NULL,
  `sexo` int(11) DEFAULT NULL COMMENT '1-Masculino\n2-Feminino',
  `cnh` varchar(45) DEFAULT NULL,
  `cnh_categoria` varchar(45) DEFAULT NULL,
  `cnh_validade` date DEFAULT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `pis` varchar(45) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `quanto_tempo_mora_cidade` varchar(45) DEFAULT NULL,
  `mora_com_quem` varchar(255) DEFAULT NULL,
  `imovel` int(11) DEFAULT NULL COMMENT '1-Próprio\n2-Alugado\n3-Emprestado\n4-Financiado',
  `possui_veiculo` int(11) DEFAULT NULL COMMENT '1-Não\n2-Quitado\n3-Financiado',
  `doador` varchar(255) DEFAULT NULL COMMENT '1-Sangue\n2-Órgãos',
  `tipo_sanguineo` varchar(45) DEFAULT NULL,
  `religiao` varchar(255) DEFAULT NULL,
  `vaga_interesse` varchar(255) DEFAULT NULL,
  `como_soube_vaga` varchar(255) DEFAULT NULL,
  `participou_processos_seletivos_ap` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `data_processos_seletivos_ap` date DEFAULT NULL,
  `para_qual_vaga` varchar(255) DEFAULT NULL,
  `testes_psicologicos_ap` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `participou_outros_processos_seletivos` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `para_quais_empresas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rh_candidatos_caracteristicas_fisicas`
--

CREATE TABLE `rh_candidatos_caracteristicas_fisicas` (
  `id_rh_candidatos_caracteristicas_fisicas` int(11) NOT NULL,
  `altura` varchar(45) DEFAULT NULL,
  `peso` varchar(45) DEFAULT NULL,
  `possui_alguma_limitacao` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `qual_limitacao` varchar(45) DEFAULT NULL,
  `possui_barba` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `disposto_tirar_barba` varchar(45) DEFAULT NULL,
  `unhas` int(11) DEFAULT NULL COMMENT '1-Longas\n2-Curtas\n3-Esmaltadas\n4-Sem Esmaltação',
  `cabelo` int(11) DEFAULT NULL COMMENT '1-Curto\n2-Longo',
  `prefere_manter` int(11) DEFAULT NULL COMMENT '1-Preso\n2-Solto',
  `habito_cuidados_restritivos` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `qual_habito` varchar(45) DEFAULT NULL,
  `id_rh_candidatos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rh_candidatos_caracteristicas_profissionais`
--

CREATE TABLE `rh_candidatos_caracteristicas_profissionais` (
  `id_rh_candidatos_caracteristicas_profissionais` int(11) NOT NULL,
  `nome_empresa_1` varchar(255) DEFAULT NULL,
  `tempo_empresa_1` varchar(45) DEFAULT NULL,
  `cargo_empresa_1` varchar(255) DEFAULT NULL,
  `atividades_empresa_1` varchar(255) DEFAULT NULL,
  `data_inicio_empresa_1` date DEFAULT NULL,
  `data_saida_empresa_1` date DEFAULT NULL,
  `motivo_saida_empresa_1` varchar(255) DEFAULT NULL,
  `ultimo_salario_empresa_1` varchar(45) DEFAULT NULL,
  `nome_responsavel_direto_empresa_1` varchar(255) DEFAULT NULL,
  `nome_empresa_2` varchar(255) DEFAULT NULL,
  `tempo_empresa_2` varchar(45) DEFAULT NULL,
  `cargo_empresa_2` varchar(255) DEFAULT NULL,
  `atividades_empresa_2` varchar(255) DEFAULT NULL,
  `data_inicio_empresa_2` date DEFAULT NULL,
  `data_saida_empresa_2` date DEFAULT NULL,
  `motivo_saida_empresa_2` varchar(255) DEFAULT NULL,
  `ultimo_salario_empresa_2` varchar(45) DEFAULT NULL,
  `nome_responsavel_direto_empresa_2` varchar(255) DEFAULT NULL,
  `nome_empresa_3` varchar(255) DEFAULT NULL,
  `tempo_empresa_3` varchar(45) DEFAULT NULL,
  `cargo_empresa_3` varchar(255) DEFAULT NULL,
  `atividades_empresa_3` varchar(255) DEFAULT NULL,
  `data_inicio_empresa_3` date DEFAULT NULL,
  `data_saida_empresa_3` date DEFAULT NULL,
  `motivo_saida_empresa_3` varchar(255) DEFAULT NULL,
  `ultimo_salario_empresa_3` varchar(45) DEFAULT NULL,
  `nome_responsavel_direto_empresa_3` varchar(255) DEFAULT NULL,
  `nome_empresa_4` varchar(255) DEFAULT NULL,
  `tempo_empresa_4` varchar(45) DEFAULT NULL,
  `cargo_empresa_4` varchar(255) DEFAULT NULL,
  `atividades_empresa_4` varchar(255) DEFAULT NULL,
  `data_inicio_empresa_4` date DEFAULT NULL,
  `data_saida_empresa_4` date DEFAULT NULL,
  `motivo_saida_empresa_4` varchar(255) DEFAULT NULL,
  `ultimo_salario_empresa_4` varchar(45) DEFAULT NULL,
  `nome_responsavel_direto_empresa_4` varchar(255) DEFAULT NULL,
  `experiencias_complementares` longtext,
  `objetivos_curto_prazo` varchar(255) DEFAULT NULL,
  `objetivos_medio_prazo` varchar(255) DEFAULT NULL,
  `objetivos_longo_prazo` varchar(255) DEFAULT NULL,
  `id_rh_candidatos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rh_candidatos_dados_familiares`
--

CREATE TABLE `rh_candidatos_dados_familiares` (
  `id_rh_candidatos_dados_familiares` int(11) NOT NULL,
  `nome_mae` varchar(255) DEFAULT NULL,
  `idade_mae` varchar(45) DEFAULT NULL,
  `atividade_atuais_mae` varchar(255) DEFAULT NULL,
  `saude_mae` int(11) DEFAULT NULL COMMENT '1-Está bem de saúde\n2-Problemas de Saúde\n3-Já Falecido\n4-Não Conhece',
  `nome_pai` varchar(255) DEFAULT NULL,
  `idade_pai` varchar(45) DEFAULT NULL,
  `atividade_atuais_pai` varchar(255) DEFAULT NULL,
  `saude_pai` int(11) DEFAULT NULL COMMENT '1-Está bem de saúde\n2-Problemas de Saúde\n3-Já Falecido\n4-Não Conhece',
  `estado_civil` int(11) DEFAULT NULL COMMENT '1-Casado(a)\n2-Solteiro(a)\n3-Amasiado(a)\n4-Divorciado(a)\n5-Viúvo(a)\n6-Noivo(a)\n7-Namorando',
  `quanto_tempo_relacionamento` varchar(255) DEFAULT NULL,
  `nome_conjuge` varchar(255) DEFAULT NULL,
  `idade_conjunge` varchar(45) DEFAULT NULL,
  `atividades_atuais_conjuge` varchar(255) DEFAULT NULL,
  `saude_conjuge` int(11) DEFAULT NULL COMMENT '1-Está bem de saúde\n2-Problemas de Saúde',
  `quais_problemas_saude_conjuge` varchar(255) DEFAULT NULL,
  `tem_filhos` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `quantos_filhos` varchar(3) DEFAULT NULL,
  `idades_filhos` varchar(255) DEFAULT NULL,
  `saude_filhos` int(11) DEFAULT NULL COMMENT '1-Estão bem de saúde\n2-Problemas de Saúde',
  `quais_problemas_saude_filhos` varchar(255) DEFAULT NULL,
  `quem_cuida_filhos` varchar(255) DEFAULT NULL,
  `id_rh_candidatos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rh_candidatos_disponibilidade`
--

CREATE TABLE `rh_candidatos_disponibilidade` (
  `id_rh_candidatos_disponibilidade` int(11) NOT NULL,
  `viagens` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `trabalhar_sabados` int(11) DEFAULT NULL COMMENT '1-Não\n2-Esporadicamente\n3-Sempre',
  `horas_extras` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `cursos` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `mudar_cidade` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `id_rh_candidatos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rh_candidatos_formacao_cursos`
--

CREATE TABLE `rh_candidatos_formacao_cursos` (
  `id_rh_candidatos_formacao_cursos` int(11) NOT NULL,
  `escolaridade` varchar(255) DEFAULT NULL,
  `profissao` varchar(255) DEFAULT NULL,
  `formacao_cursos_complementares` longtext,
  `curso_conhecimento` varchar(255) DEFAULT NULL,
  `informatica` varchar(45) DEFAULT NULL COMMENT '1-Word\n2-Excel\n3-PowerPoint\n4-Software',
  `excel` int(11) DEFAULT NULL COMMENT '1-Básico\n2-Avançado',
  `experiencia_elaboracao_planilhas` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `ingles` varchar(45) DEFAULT NULL COMMENT '1-Curso\n2-Fluência',
  `espanhol` varchar(45) DEFAULT NULL COMMENT '1-Curso\n2-Fluência',
  `outros` varchar(255) DEFAULT NULL,
  `tem_experiencia` varchar(45) DEFAULT NULL COMMENT '1-Operacional\n2-Administrativo\n3-Gerencial',
  `possui_habito_leitura` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `nome_ultimo_livro` varchar(255) DEFAULT NULL,
  `data_conclusao_leitura` date DEFAULT NULL,
  `id_rh_candidatos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rh_candidatos_saude_fisica_emocional`
--

CREATE TABLE `rh_candidatos_saude_fisica_emocional` (
  `id_rh_candidatos_saude_fisica_emocional` int(11) NOT NULL,
  `doencas` varchar(255) DEFAULT NULL COMMENT '1-Diabetes\n2-Colesterol\n3-Pressão Alta\n4-Tireoide\n5-Dores de Cabeça\n6-Problemas na visão\n7-Dores musculares\n8-Problemas na coluna\n9-Problemas cardíacos\n10-Problemas neurológicos\n11-Convulsão\n12-Desmaios\n13-Problemas auditivos\n14-Insônia\n15-Apneia do sono\n16-Tontura \n17-Dependência química\n18-Gastrite\n19-Úlcera\n20-Obesidade\n21-DST\n22-Sífilis\n23-HIV\n24-Infecções Urinarias\n25-Outras infecções\n26-Problema renais\n27-Hepatites\n28-Problemas respiratórios\n29-Problemas no fígado\n30-Deficiência física\n31-Depressão\n32-Bipolaridade\n33-Síndrome do pânico\n34-Ansiedade\n35-Estresse crônico\n36-TOC\n37-Bulimia\n38-Anorexia\n39-Esquizofrenia\n40-Hiperatividade\n41-Déficit de atenção\n42-Compulsão alimentar',
  `fumante` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `fumante_quanto_tempo` varchar(45) DEFAULT NULL,
  `parou_fumar` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `quanto_tempo_parou` varchar(45) DEFAULT NULL,
  `toma_algum_medicamento` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `qual_medicamento` varchar(255) DEFAULT NULL,
  `dorme_bem_noite` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `justifique_dorme_bem_noite` varchar(255) DEFAULT NULL,
  `dormiu_bem_noite_passada` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `justifique_dormiu_bem_noite_passada` varchar(255) DEFAULT NULL,
  `usa_oculos` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `esta_usando_agora` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `lentes` varchar(45) DEFAULT NULL COMMENT '1-Perto\n2-Longe',
  `pratica_exercicios_fisicos` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `qual_exercicio` varchar(255) DEFAULT NULL,
  `consome_bebidas_alcoolicas` int(11) DEFAULT NULL COMMENT '1-Não\n2-Raramente\n3-Socialmente\n4-Com Frequência',
  `usa_usou_droga_ilicita` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `qual_droga_ilicia` varchar(255) DEFAULT NULL,
  `envolveu_acidente_transito` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `danos_acidente` varchar(45) DEFAULT NULL COMMENT '1-Danos Materiais\n2-Feridos\n3-Vítimas Fatais',
  `quanto_tempo_faz` varchar(45) DEFAULT NULL,
  `voce_foi_responsavel_acidente` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `justifique` longtext,
  `id_rh_candidatos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rh_candidatos_situacoes_informacoes`
--

CREATE TABLE `rh_candidatos_situacoes_informacoes` (
  `id_rh_candidatos_situacoes_informacoes` int(11) NOT NULL,
  `problemas_justica` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `quanto_tempo_faz` varchar(45) DEFAULT NULL,
  `tipo_situacao_ocorreu` longtext,
  `procupacoes_momento` varchar(255) DEFAULT NULL COMMENT '1-Problemas Familiares\n2-Problemas Financeiros\n3-Problemas de Saúde\n4-Problemas Profissionais',
  `como_esta_sentindo_momento` varchar(255) DEFAULT NULL COMMENT '1-Bem\n2-Tranquilo\n3-Alegre\n4-Motivado\n5-Cansado\n6-Com sono\n7-Triste\n8-Desmotivado \n9-Nervoso\n10-Com Raiva\n11-Ansioso\n12-Baixa Energia\n13-Com Dor\n14-Indeciso\n15-Preocupado\n16-Com Fome \n',
  `principal_caracteristica` varchar(255) DEFAULT NULL,
  `principal_limitacao` varchar(255) DEFAULT NULL,
  `situacao_mais_dificil_vida` varchar(255) DEFAULT NULL,
  `referencias_profissionais` varchar(255) DEFAULT NULL,
  `referencias_pessoais` varchar(255) DEFAULT NULL,
  `empresa_deve_escolher_voce` varchar(255) DEFAULT NULL,
  `pretencao_salario` varchar(45) DEFAULT NULL,
  `disponibilidade_horario` varchar(255) DEFAULT NULL,
  `informacoes_adicionais` longtext,
  `redacao` longtext,
  `id_rh_candidatos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rh_vagas`
--

CREATE TABLE `rh_vagas` (
  `id_rh_vagas` int(11) NOT NULL,
  `data_registro` datetime DEFAULT NULL,
  `escolaridade` varchar(255) DEFAULT NULL,
  `tempo_experiencia` varchar(255) DEFAULT NULL,
  `idiomas` varchar(255) DEFAULT NULL,
  `informatica` varchar(255) DEFAULT NULL,
  `habilitacao` varchar(255) DEFAULT NULL,
  `disponibilidade_viagens` varchar(255) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `superior_imediato` varchar(255) DEFAULT NULL,
  `cargo_superior` varchar(255) DEFAULT NULL,
  `periodo` varchar(10) DEFAULT NULL COMMENT '1-Manhã\n2-Tarde\n3-Noite',
  `dias_semana` varchar(255) DEFAULT NULL,
  `horario_trabalho` varchar(255) DEFAULT NULL,
  `sexo` int(11) DEFAULT NULL COMMENT '1-Feminino\n2-Masculino\n3-Ambos',
  `remuneracao` varchar(255) DEFAULT NULL,
  `bonus` varchar(255) DEFAULT NULL,
  `transporte` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `alimentacao_local` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `vale_refeicao` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `assistencia_medica` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `assistencia_odontologica` int(11) DEFAULT NULL COMMENT '1-Sim\n2-Não',
  `outros_beneficios` varchar(255) DEFAULT NULL,
  `conhecimentos` longtext,
  `habilidades` longtext,
  `atitudes_esperadas` longtext,
  `principais_ativdades` longtext,
  `observacoes` longtext,
  `data_recebimento` date DEFAULT NULL,
  `data_entrevista` date DEFAULT NULL,
  `data_iniciar` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1-Aberta\n2-Preenchida\n3-Cancelada',
  `url_amigavel` varchar(255) DEFAULT NULL,
  `id_clientes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id_servicos` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `resumo` varchar(255) DEFAULT NULL,
  `descricao` longtext,
  `icone` varchar(255) DEFAULT NULL,
  `imagem` longtext,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sobre`
--

CREATE TABLE `sobre` (
  `resumo_texto` varchar(255) DEFAULT NULL,
  `texto` longtext,
  `imagem` longtext,
  `link` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `sobre`
--

INSERT INTO `sobre` (`resumo_texto`, `texto`, `imagem`, `link`) VALUES
('But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system.', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.</p>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim.</p>', 'sobre-a-empresa-201911042003.jpg', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `nome` longtext,
  `login` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `imagem_perfil` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `nome`, `login`, `senha`, `imagem_perfil`, `status`) VALUES
(1, 'Gabriel Dezan', 'gabriel.dezan', 'f1ccbb92591d22f719a88c5be8b1161a', 'perfil-gabriel-dezan-201905071953.jpg', 1),
(2, 'Raul Garbin', 'raul', '202cb962ac59075b964b07152d234b70', '', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_cliente`
--

CREATE TABLE `usuario_cliente` (
  `id_usuario_cliente` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `senha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receber_novidades_email` int(11) DEFAULT NULL COMMENT '1-Sim\n0-Não',
  `status` int(11) DEFAULT NULL COMMENT '1-Ativo\n0-Inativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_cliente_dados`
--

CREATE TABLE `usuario_cliente_dados` (
  `id_usuario_cliente_dados` int(11) NOT NULL,
  `telefone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endereco` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `informacoes_adicionais` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_usuario_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vitrine_categoria`
--

CREATE TABLE `vitrine_categoria` (
  `id_vitrine_categoria` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `vitrine_categoria`
--

INSERT INTO `vitrine_categoria` (`id_vitrine_categoria`, `descricao`, `status`) VALUES
(1, 'Ração', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vitrine_grupo`
--

CREATE TABLE `vitrine_grupo` (
  `id_vitrine_grupo` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `imagem` longtext,
  `status` int(11) DEFAULT NULL,
  `url_amigavel` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `vitrine_grupo`
--

INSERT INTO `vitrine_grupo` (`id_vitrine_grupo`, `descricao`, `imagem`, `status`, `url_amigavel`) VALUES
(1, 'Pássaros', 'passaros-201911081438.png', 1, NULL),
(2, 'Roedores', 'roedores-201911081438.png', 1, NULL),
(3, 'Peixes', 'peixes-201911081438.png', 0, 'peixes');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vitrine_produto`
--

CREATE TABLE `vitrine_produto` (
  `id_vitrine_produto` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `detalhes` longtext,
  `garantia` varchar(45) DEFAULT NULL,
  `peso` varchar(45) DEFAULT NULL,
  `dimensoes` varchar(45) DEFAULT NULL,
  `materiais` varchar(100) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `manual` varchar(255) DEFAULT NULL,
  `informacao_adicional_1` longtext,
  `informacao_adicional_2` longtext,
  `informacao_adicional_3` longtext,
  `link` varchar(255) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `situacao` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `id_vitrine_categoria` int(11) DEFAULT NULL,
  `id_vitrine_subgrupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `vitrine_produto`
--

INSERT INTO `vitrine_produto` (`id_vitrine_produto`, `descricao`, `detalhes`, `garantia`, `peso`, `dimensoes`, `materiais`, `imagem`, `manual`, `informacao_adicional_1`, `informacao_adicional_2`, `informacao_adicional_3`, `link`, `valor`, `situacao`, `status`, `url_amigavel`, `id_vitrine_categoria`, `id_vitrine_subgrupo`) VALUES
(6, 'Cantare Hamster', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-hamster', 1, 8),
(7, 'Cantare Alfafa e Vegetais', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-alfafa-e-vegetais', 1, 8),
(8, 'Cantare Periquito', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-periquito', 1, 7),
(9, 'Cantare Papagaio Premium', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-papagaio-premium', 1, 7),
(35, 'Alimento Curió/Bicudo', '<b>Indicação de Uso<br></b>Este alimento é indicado para curió, bicudo e outros pássaros de mesmo hábito alimentar<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade com água potável sempre a disposição e efetuando troca diária do alimento.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fub&aacute; mimoso(gene transg&ecirc;nico bacillus thurigiensis/zea mays), farelo de soja(gene transg&ecirc;nico agrobacterium SP), niger, ovo em p&oacute; integral, aveia em p&oacute;, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, &aacute;cido f&oacute;lico, &aacute;cido pantot&ecirc;nico, &aacute;cido nicot&iacute;nico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de c&aacute;lcio, &oacute;xido de zinco, sulfato de mangan&ecirc;s, selenito de s&oacute;dio), antioxidante bht, bha, &aacute;cido c&iacute;trico, etoxiquim), fosfato bic&aacute;lcico, calc&aacute;rio calc&iacute;tico, prebi&oacute;tico(levedura seca de cervejaria e s&oacute;lidos sol&uacute;veis de fermenta&ccedil;&atilde;o), gordura vegetal, aditivo antif&uacute;ngico e fungiost&aacute;tico(&aacute;cido propi&ocirc;nico e hidr&oacute;xido de am&ocirc;nia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(M&aacute;x): </strong>130g/kg</p>\r\n<p><strong>Prote&iacute;na Bruta(M&iacute;n): </strong>200g/kg</p>\r\n<p><strong>Extrato Et&eacute;reo(M&iacute;n): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(M&aacute;x): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(M&aacute;x): </strong>70g/kg</p>\r\n<p><strong>C&aacute;lcio(M&aacute;x): </strong>6g/kg</p>\r\n<p><strong>C&aacute;lcio(M&iacute;n): </strong>2g/kg</p>\r\n<p><strong>F&oacute;sforo(M&iacute;n): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacar&iacute;deos(M&iacute;n): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(M&iacute;n): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(M&iacute;n): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(M&iacute;n): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(M&iacute;n): </strong>6u/g</p>\r\n<p><strong>Protenase(M&iacute;n): </strong>1,05u/g</p>\r\n<p><strong>Fitase(M&iacute;n): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(M&iacute;n): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(M&iacute;n): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>&Aacute;cido F&oacute;lico: </strong>0.8mg</p>\r\n<p><strong>&Aacute;cido Pantot&ocirc;nico: </strong>16mg</p>\r\n<p><strong>&Aacute;cido Nicot&iacute;nico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Mangan&ecirc;s: </strong>61mg</p>\r\n<p><strong>Sel&ecirc;nio: </strong>0.16mg</p>', '', '', 1, 1, 'alimento-curiobicudo', 1, 10),
(37, 'Alimento Canário Premium', '<b>Indicação de Uso<br></b>Este alimento é indicado para canários e outros pássaros de mesmo hábito alimentar.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade com água potável sempre a disposição e efetuando troca diária do alimento.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">alpiste,niger,senha,aveia descascada,Fub&aacute; mimoso(gene transg&ecirc;nico bacillus thurigiensis/zea mays), farelo de soja(gene transg&ecirc;nico agrobacterium SP), niger, ovo em p&oacute; integral, aveia em p&oacute;, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, &aacute;cido f&oacute;lico, &aacute;cido pantot&ecirc;nico, &aacute;cido nicot&iacute;nico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de c&aacute;lcio, &oacute;xido de zinco, sulfato de mangan&ecirc;s, selenito des&oacute;dio),antioxidantebht,bha,&aacute;cidoc&iacute;trico,etoxiquim),fosfato bic&aacute;lcico,calc&aacute;rio calc&iacute;tico, prebi&oacute;tico(levedura seca de cervejaria e s&oacute;lidos sol&uacute;veis de fermenta&ccedil;&atilde;o), gordura vegetal, aditivo antif&uacute;ngico e fungiost&aacute;tico(&aacute;cido propi&ocirc;nico e hidr&oacute;xido de am&ocirc;nia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(M&aacute;x): </strong>130g/kg</p>\r\n<p><strong>Prote&iacute;na Bruta(M&iacute;n): </strong>200g/kg</p>\r\n<p><strong>Extrato Et&eacute;reo(M&iacute;n): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(M&aacute;x): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(M&aacute;x): </strong>70g/kg</p>\r\n<p><strong>C&aacute;lcio(M&aacute;x): </strong>6g/kg</p>\r\n<p><strong>C&aacute;lcio(M&iacute;n): </strong>2g/kg</p>\r\n<p><strong>F&oacute;sforo(M&iacute;n): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacar&iacute;deos(M&iacute;n): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(M&iacute;n): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(M&iacute;n): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(M&iacute;n): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(M&iacute;n): </strong>6u/g</p>\r\n<p><strong>Protenase(M&iacute;n): </strong>1,05u/g</p>\r\n<p><strong>Fitase(M&iacute;n): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(M&iacute;n): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(M&iacute;n): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>&Aacute;cido F&oacute;lico: </strong>0.8mg</p>\r\n<p><strong>&Aacute;cido Pantot&ocirc;nico: </strong>16mg</p>\r\n<p><strong>&Aacute;cido Nicot&iacute;nico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Mangan&ecirc;s: </strong>61mg</p>\r\n<p><strong>Sel&ecirc;nio: </strong>0.16mg</p>', '', '', 1, 1, 'alimento-canario-premium', 0, 7),
(38, 'Cantare Eco Bits', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-eco-bits', 1, 7),
(39, 'Cantare Eco Curió e Silvestres', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-eco-curio-e-silvestres', 1, 7),
(40, 'Cantare Eco Ring Neck e Rosela', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-eco-ring-neck-e-rosela', 1, 7),
(42, 'Cantare Eco Canário e Exóticos', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-eco-canario-e-exoticos', 1, 7),
(43, 'Cantare Eco Trinca Ferro', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-eco-trinca-ferro', 1, 7),
(44, 'Cantare Eco Psitacídeos', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-eco-psitacideos', 1, 7),
(45, 'Cantare Eco Sabiá e Pássaro preto', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-eco-sabia-e-passaro-preto', 1, 7),
(46, 'Cantare Eco Sticks', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-eco-sticks', 1, 7),
(47, 'Cantare Trinca Ferro', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-trinca-ferro', 1, 7),
(48, 'Cantare Sabiá e Pássaro Preto', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-sabia-e-passaro-preto', 1, 7);
INSERT INTO `vitrine_produto` (`id_vitrine_produto`, `descricao`, `detalhes`, `garantia`, `peso`, `dimensoes`, `materiais`, `imagem`, `manual`, `informacao_adicional_1`, `informacao_adicional_2`, `informacao_adicional_3`, `link`, `valor`, `situacao`, `status`, `url_amigavel`, `id_vitrine_categoria`, `id_vitrine_subgrupo`) VALUES
(49, 'Cantare Papagaio Bits', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-papagaio-bits', 1, 7),
(50, 'Cantare Periquito Calopsita', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-periquito-calopsita', 1, 7),
(53, 'Alimento Vitaminado Amarelo', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'alimento-vitaminado-amarelo', 1, 9),
(54, 'Alimento Vitaminado Vermelho', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'alimento-vitaminado-vermelho', 1, 9),
(55, 'Alimento Vitaminado Verde', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'alimento-vitaminado-verde', 1, 9),
(56, 'Farinhada Eco Canário e Exóticos', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'farinhada-eco-canario-e-exoticos', 1, 9),
(57, 'Farinhada Eco Pássaros', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'farinhada-eco-passaros', 1, 9),
(58, 'Farinhada Eco Pássaros com Alho', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'farinhada-eco-passaros-com-alho', 1, 9),
(59, 'Farinhada Eco Trinca Ferro', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'farinhada-eco-trinca-ferro', 1, 9),
(60, 'Farinhada Eco Psitacídeos com Frutas', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'farinhada-eco-psitacideos-com-frutas', 1, 9),
(61, 'Farinhada Eco Psitacídeos', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'farinhada-eco-psitacideos', 1, 9),
(62, 'Papa de Ovo Fina', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'papa-de-ovo-fina', 1, 9),
(63, 'Papa de Ovo Floculada', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'papa-de-ovo-floculada', 1, 9),
(64, 'Farinhada com Cantaxantina', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'farinhada-com-cantaxantina', 1, 9),
(65, 'Cantare Trinca Ferro Premium', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-trinca-ferro-premium', 1, 10),
(66, 'Cantare Pássaro Preto Premium', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-passaro-preto-premium', 1, 10);
INSERT INTO `vitrine_produto` (`id_vitrine_produto`, `descricao`, `detalhes`, `garantia`, `peso`, `dimensoes`, `materiais`, `imagem`, `manual`, `informacao_adicional_1`, `informacao_adicional_2`, `informacao_adicional_3`, `link`, `valor`, `situacao`, `status`, `url_amigavel`, `id_vitrine_categoria`, `id_vitrine_subgrupo`) VALUES
(67, 'Alimento Papagaio Premium', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fub&aacute; mimoso(gene transg&ecirc;nico bacillus thurigiensis/zea mays), farelo de soja(gene transg&ecirc;nico agrobacterium SP), niger, ovo em p&oacute; integral, aveia em p&oacute;, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, &aacute;cido f&oacute;lico, &aacute;cido pantot&ecirc;nico, &aacute;cido nicot&iacute;nico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de c&aacute;lcio, &oacute;xido de zinco, sulfato de mangan&ecirc;s, selenito de s&oacute;dio), antioxidante bht, bha, &aacute;cido c&iacute;trico, etoxiquim), fosfato bic&aacute;lcico, calc&aacute;rio calc&iacute;tico, prebi&oacute;tico(levedura seca de cervejaria e s&oacute;lidos sol&uacute;veis de fermenta&ccedil;&atilde;o), gordura vegetal, aditivo antif&uacute;ngico e fungiost&aacute;tico(&aacute;cido propi&ocirc;nico e hidr&oacute;xido de am&ocirc;nia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'alimento-papagaio-premium', 1, 10),
(68, 'Alimento Trinca Ferro Pimenta', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'alimento-trinca-ferro-pimenta', 1, 10),
(69, 'Alimento Trinca Ferro Frutas', '<b>Indicação de Uso<br></b>Este alimento é indicado para trinca ferro ( picharro) e outros pássaros de mesmo hábito alimentar.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade com água potável sempre a disposição e efetuando troca diária do alimento<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fub&aacute; mimoso(gene transg&ecirc;nico bacillus thurigiensis/zea mays), farelo de soja(gene transg&ecirc;nico agrobacterium SP), niger, ovo em p&oacute; integral, aveia em p&oacute;, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, &aacute;cido f&oacute;lico, &aacute;cido pantot&ecirc;nico, &aacute;cido nicot&iacute;nico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de c&aacute;lcio, &oacute;xido de zinco, sulfato de mangan&ecirc;s, selenito de s&oacute;dio), antioxidante bht, bha, &aacute;cido c&iacute;trico, etoxiquim), fosfato bic&aacute;lcico, calc&aacute;rio calc&iacute;tico, prebi&oacute;tico(levedura seca de cervejaria e s&oacute;lidos sol&uacute;veis de fermenta&ccedil;&atilde;o), gordura vegetal, aditivo antif&uacute;ngico e fungiost&aacute;tico(&aacute;cido propi&ocirc;nico e hidr&oacute;xido de am&ocirc;nia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(M&aacute;x): </strong>130g/kg</p>\r\n<p><strong>Prote&iacute;na Bruta(M&iacute;n): </strong>200g/kg</p>\r\n<p><strong>Extrato Et&eacute;reo(M&iacute;n): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(M&aacute;x): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(M&aacute;x): </strong>70g/kg</p>\r\n<p><strong>C&aacute;lcio(M&aacute;x): </strong>6g/kg</p>\r\n<p><strong>C&aacute;lcio(M&iacute;n): </strong>2g/kg</p>\r\n<p><strong>F&oacute;sforo(M&iacute;n): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacar&iacute;deos(M&iacute;n): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(M&iacute;n): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(M&iacute;n): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(M&iacute;n): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(M&iacute;n): </strong>6u/g</p>\r\n<p><strong>Protenase(M&iacute;n): </strong>1,05u/g</p>\r\n<p><strong>Fitase(M&iacute;n): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(M&iacute;n): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(M&iacute;n): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>&Aacute;cido F&oacute;lico: </strong>0.8mg</p>\r\n<p><strong>&Aacute;cido Pantot&ocirc;nico: </strong>16mg</p>\r\n<p><strong>&Aacute;cido Nicot&iacute;nico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Mangan&ecirc;s: </strong>61mg</p>\r\n<p><strong>Sel&ecirc;nio: </strong>0.16mg</p>', '', '', 1, 1, 'alimento-trinca-ferro-frutas', 1, 10),
(70, 'Cantare Mamão', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fubá mimoso(gene transgênico bacillus thurigiensis/zea mays), farelo de soja(gene transgênico agrobacterium SP), niger, ovo em pó integral, aveia em pó, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, ácido fólico, ácido pantotênico, ácido nicotínico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de cálcio, óxido de zinco, sulfato de manganês, selenito de sódio), antioxidante bht, bha, ácido cítrico, etoxiquim), fosfato bicálcico, calcário calcítico, prebiótico(levedura seca de cervejaria e sólidos solúveis de fermentação), gordura vegetal, aditivo antifúngico e fungiostático(ácido propiônico e hidróxido de amônia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-mamao', 1, 10),
(71, 'Cantare Bananinha', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fub&aacute; mimoso(gene transg&ecirc;nico bacillus thurigiensis/zea mays), farelo de soja(gene transg&ecirc;nico agrobacterium SP), niger, ovo em p&oacute; integral, aveia em p&oacute;, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, &aacute;cido f&oacute;lico, &aacute;cido pantot&ecirc;nico, &aacute;cido nicot&iacute;nico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de c&aacute;lcio, &oacute;xido de zinco, sulfato de mangan&ecirc;s, selenito de s&oacute;dio), antioxidante bht, bha, &aacute;cido c&iacute;trico, etoxiquim), fosfato bic&aacute;lcico, calc&aacute;rio calc&iacute;tico, prebi&oacute;tico(levedura seca de cervejaria e s&oacute;lidos sol&uacute;veis de fermenta&ccedil;&atilde;o), gordura vegetal, aditivo antif&uacute;ngico e fungiost&aacute;tico(&aacute;cido propi&ocirc;nico e hidr&oacute;xido de am&ocirc;nia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(Máx): </strong>130g/kg</p>\r\n<p><strong>Proteína Bruta(Mín): </strong>200g/kg</p>\r\n<p><strong>Extrato Etéreo(Mín): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(Máx): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(Máx): </strong>70g/kg</p>\r\n<p><strong>Cálcio(Máx): </strong>6g/kg</p>\r\n<p><strong>Cálcio(Mín): </strong>2g/kg</p>\r\n<p><strong>Fósforo(Mín): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacarídeos(Mín): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(Mín): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(Mín): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(Mín): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(Mín): </strong>6u/g</p>\r\n<p><strong>Protenase(Mín): </strong>1,05u/g</p>\r\n<p><strong>Fitase(Mín): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(Mín): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(Mín): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>Ácido Fólico: </strong>0.8mg</p>\r\n<p><strong>Ácido Pantotônico: </strong>16mg</p>\r\n<p><strong>Ácido Nicotínico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Manganês: </strong>61mg</p>\r\n<p><strong>Selênio: </strong>0.16mg</p>', '', '', 1, 1, 'cantare-bananinha', 0, 10),
(72, 'Cantare Granomix', '<b>Indicação de Uso<br></b>Este alimento é indicado para canário, curió, coleira, azulão e outros pássaros que necessitem melhorar suas necessidades nutricionais.<br><b><br>Modo de Usar<br></b>Pode ser fornecido a vontade puro ou misturado aos alimentos com água potável sempre a disposição e efetuando troca diária o alimento. Se fornecer úmido descartar as sobras.<b><br></b>', '', '', '', '', NULL, '', '<p style=\"text-align: justify;\">Fub&aacute; mimoso(gene transg&ecirc;nico bacillus thurigiensis/zea mays), farelo de soja(gene transg&ecirc;nico agrobacterium SP), niger, ovo em p&oacute; integral, aveia em p&oacute;, premix vitaminado mineral(vitamina A, D, E, K, B1, B2, B6, B12, H, &aacute;cido f&oacute;lico, &aacute;cido pantot&ecirc;nico, &aacute;cido nicot&iacute;nico, cloreto de colina, sulfato de cobre penta hidratado, sulfato de ferro, iodato de c&aacute;lcio, &oacute;xido de zinco, sulfato de mangan&ecirc;s, selenito de s&oacute;dio), antioxidante bht, bha, &aacute;cido c&iacute;trico, etoxiquim), fosfato bic&aacute;lcico, calc&aacute;rio calc&iacute;tico, prebi&oacute;tico(levedura seca de cervejaria e s&oacute;lidos sol&uacute;veis de fermenta&ccedil;&atilde;o), gordura vegetal, aditivo antif&uacute;ngico e fungiost&aacute;tico(&aacute;cido propi&ocirc;nico e hidr&oacute;xido de am&ocirc;nia), adsorvente de microtoxinas.</p>', '<p><strong>Unidade(M&aacute;x): </strong>130g/kg</p>\r\n<p><strong>Prote&iacute;na Bruta(M&iacute;n): </strong>200g/kg</p>\r\n<p><strong>Extrato Et&eacute;reo(M&iacute;n): </strong>65g/kg</p>\r\n<p><strong>Fibra Bruta(M&aacute;x): </strong>50g/kg</p>\r\n<p><strong>Material Mineral(M&aacute;x): </strong>70g/kg</p>\r\n<p><strong>C&aacute;lcio(M&aacute;x): </strong>6g/kg</p>\r\n<p><strong>C&aacute;lcio(M&iacute;n): </strong>2g/kg</p>\r\n<p><strong>F&oacute;sforo(M&iacute;n): </strong>3.000mg/kg</p>\r\n<p><strong>Mananoligossacar&iacute;deos(M&iacute;n): </strong>0.025%</p>\r\n<p><strong>Sacaromices Cerevisae(M&iacute;n): </strong>2x10<sup>9</sup></p>\r\n<p><strong>Enterecoccus Faecium(M&iacute;n): </strong>1x10<sup>8</sup></p>\r\n<p><strong>Lactobacillus Acidofilus(M&iacute;n): </strong>1x10<sup>8</sup>/g</p>\r\n<p><strong>Pectinase(M&iacute;n): </strong>6u/g</p>\r\n<p><strong>Protenase(M&iacute;n): </strong>1,05u/g</p>\r\n<p><strong>Fitase(M&iacute;n): </strong>0.45u/g</p>\r\n<p><strong>Betaglucanase(M&iacute;n): </strong>0.3u/g</p>\r\n<p><strong>Xilanase(M&iacute;n): </strong>0,15u/g</p>', '<p><strong>Vitamina A: </strong>10000UI</p>\r\n<p><strong>Vitamina D3: </strong>2700UI</p>\r\n<p><strong>Vitamina E: </strong>16UI</p>\r\n<p><strong>Vitamina H: </strong>0.065mg</p>\r\n<p><strong>Vitamina K3: </strong>1.6mg</p>\r\n<p><strong>Vitamina B1: </strong>0.80mg</p>\r\n<p><strong>Vitamina B2: </strong>4mg</p>\r\n<p><strong>Vitamina B6: </strong>0.8mg</p>\r\n<p><strong>Vitamina B12: </strong>16mcg</p>\r\n<p><strong>&Aacute;cido F&oacute;lico: </strong>0.8mg</p>\r\n<p><strong>&Aacute;cido Pantot&ocirc;nico: </strong>16mg</p>\r\n<p><strong>&Aacute;cido Nicot&iacute;nico: </strong>33mg</p>\r\n<p><strong>Zinco: </strong>50mg</p>\r\n<p><strong>Cloreto de Colina: </strong>130mg</p>\r\n<p><strong>Cobre: </strong>6.5mg</p>\r\n<p><strong>Ferro: </strong>50mg</p>\r\n<p><strong>Iodo: </strong>0.8mg</p>\r\n<p><strong>Mangan&ecirc;s: </strong>61mg</p>\r\n<p><strong>Sel&ecirc;nio: </strong>0.16mg</p>', '', '', 1, 0, 'cantare-granomix', 1, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vitrine_produto_cores`
--

CREATE TABLE `vitrine_produto_cores` (
  `id_vitrine_produto_cores` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `cor_hexadecimal` varchar(45) DEFAULT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `imagem1` varchar(255) DEFAULT NULL,
  `imagem2` varchar(255) DEFAULT NULL,
  `imagem3` varchar(255) DEFAULT NULL,
  `imagem4` varchar(255) DEFAULT NULL,
  `imagem5` varchar(255) DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `id_vitrine_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `vitrine_produto_cores`
--

INSERT INTO `vitrine_produto_cores` (`id_vitrine_produto_cores`, `descricao`, `cor_hexadecimal`, `referencia`, `imagem1`, `imagem2`, `imagem3`, `imagem4`, `imagem5`, `url_amigavel`, `id_vitrine_produto`) VALUES
(8, '500G', '', '44768', 'imagem1-alimento-papagaio-premium-202004021632.png', 'imagem2-alimento-papagaio-premium-202004021633.jpg', '', '', '', '500g', 67),
(9, '500G', '', '45020', 'imagem1-alimento-trinca-ferro-frutas-202004021635.png', 'imagem2-alimento-trinca-ferro-frutas-202004021635.jpg', '', '', '', '500g', 69),
(11, '500G', '', '', 'imagem1-alimento-vitaminado-amarelo-202004021826.png', 'imagem2-alimento-vitaminado-amarelo-202004021826.jpg', '', '', '', '500g', 53),
(12, '500G', '', '', 'imagem1-alimento-vitaminado-verde-202004021834.png', 'imagem2-alimento-vitaminado-verde-202004021834.jpg', '', '', '', '500g', 55),
(13, '500G', '', '', 'imagem1-alimento-vitaminado-vermelho-202004021833.png', 'imagem2-alimento-vitaminado-vermelho-202004021833.jpg', '', '', '', '500g', 54),
(14, '500G', '', '', 'imagem1-cantare-alfafa-e-vegetais-202004021835.png', 'imagem2-cantare-alfafa-e-vegetais-202004021835.jpg', '', '', '', '500g', 7),
(15, '500G', '', '123', 'imagem1-cantare-bananinha-202004021836.png', 'imagem2-cantare-bananinha-202004021836.jpg', '', '', '', '500g', 71),
(16, '5KG', '', '44806', 'imagem1-cantare-canario-202004021839.png', 'imagem2-500g-202005230938.jpeg', '', '', '', '5kg', 37),
(17, '500G', '', '44881', 'imagem1-cantare-curio-202004021839.png', 'imagem2-cantare-curio-202004021839.jpg', '', '', '', '500g', 35),
(18, '500G', '', '', 'imagem1-cantare-eco-bits-202004021926.png', 'imagem2-cantare-eco-bits-202004021926.jpg', '', '', '', '500g', 38),
(19, '500G', '', '', 'imagem1-alimento-trinca-ferro-pimenta-202004021638.png', 'imagem2-alimento-trinca-ferro-pimenta-202004021638.jpg', '', '', '', '500g', 68),
(20, '500G', '', '', 'imagem1-cantare-eco-canario-e-exoticos-202004021930.png', 'imagem2-cantare-eco-canario-e-exoticos-202004021932.jpg', '', '', '', '500g', 42),
(21, '500G', '', '', 'imagem1-cantare-eco-curio-e-silvestres-202004021931.png', 'imagem2-cantare-eco-curio-e-silvestres-202004021931.jpg', '', '', '', '500g', 39),
(22, '500G', '', '', 'imagem1-cantare-eco-psitacideos-202004021932.png', 'imagem2-cantare-eco-psitacideos-202004021932.jpg', '', '', '', '500g', 44),
(23, '500G', '', '', 'imagem1-cantare-eco-ring-neck-e-rosela-202004021934.png', 'imagem2-cantare-eco-ring-neck-e-rosela-202004021934.jpg', '', '', '', '500g', 40),
(24, '500G', '', '', 'imagem1-cantare-eco-sabia-e-passaro-preto-202004021936.png', 'imagem2-cantare-eco-sabia-e-passaro-preto-202004021936.jpg', '', '', '', '500g', 45),
(25, '500G', '', '', 'imagem1-cantare-eco-sticks-202004021936.png', 'imagem2-cantare-eco-sticks-202004021936.jpg', '', '', '', '500g', 46),
(26, '500G', '', '', 'imagem1-cantare-eco-trinca-ferro-202004021937.png', 'imagem2-cantare-eco-trinca-ferro-202004021937.jpg', '', '', '', '500g', 43),
(27, '500G', '', '', 'imagem1-cantare-granomix-202004021942.png', 'imagem2-cantare-granomix-202004021942.jpg', '', '', '', '500g', 72),
(28, '500G', '', '', 'imagem1-cantare-hamster-202004021949.png', 'imagem2-cantare-hamster-202004021949.jpg', '', '', '', '500g', 6),
(29, '500G', '', '', 'imagem1-cantare-mamao-202004021951.png', 'imagem2-cantare-mamao-202004021949.jpg', '', '', '', '500g', 70),
(30, '500G', '', '', 'imagem1-cantare-papagaio-bits-202004021953.png', 'imagem2-cantare-papagaio-bits-202004021953.jpg', '', '', '', '500g', 49),
(31, '500G', '', '', 'imagem1-cantare-papagaio-premium-202004021954.png', 'imagem2-cantare-papagaio-premium-202004021954.jpg', '', '', '', '500g', 9),
(32, '500G', '', '', 'imagem1-cantare-periquito-202004021956.png', 'imagem2-cantare-periquito-202004021956.jpg', '', '', '', '500g', 8),
(33, '500G', '', '', 'imagem1-cantare-periquito-calopsita-202004022001.png', 'imagem2-cantare-periquito-calopsita-202004022001.jpg', '', '', '', '500g', 50),
(34, '500G', '', '', 'imagem1-cantare-passaro-preto-premium-202004022002.png', 'imagem2-cantare-passaro-preto-premium-202004022002.jpg', '', '', '', '500g', 66),
(35, '500G', '', '', 'imagem1-cantare-sabia-e-passaro-preto-202004022003.png', 'imagem2-cantare-sabia-e-passaro-preto-202004022003.jpg', '', '', '', '500g', 48),
(36, '500G', '', '', 'imagem1-farinhada-com-cantaxantina-202004022008.png', 'imagem2-farinhada-com-cantaxantina-202004022008.jpg', '', '', '', '500g', 64),
(37, '500G', '', '', 'imagem1-farinhada-eco-canario-e-exoticos-202004022010.png', 'imagem2-farinhada-eco-canario-e-exoticos-202004022010.jpg', '', '', '', '500g', 56),
(38, '500G', '', '', 'imagem1-farinhada-eco-psitacideos-202004022011.png', 'imagem2-farinhada-eco-psitacideos-202004022011.jpg', '', '', '', '500g', 61),
(39, '500G', '', '', 'imagem1-farinhada-eco-psitacideos-com-frutas-202004022011.png', 'imagem2-farinhada-eco-psitacideos-com-frutas-202004022011.jpg', '', '', '', '500g', 60),
(40, '500G', '', '', 'imagem1-farinhada-eco-passaros-202004022056.jpg', '', '', '', '', '500g', 57),
(41, '500G', '', '', 'imagem1-farinhada-eco-trinca-ferro-202004022100.png', 'imagem2-farinhada-eco-trinca-ferro-202004022100.jpg', '', '', '', '500g', 59),
(42, '500G', '', '', 'imagem1-papa-de-ovo-fina-202004022103.png', 'imagem2-papa-de-ovo-fina-202004022103.jpg', '', '', '', '500g', 62),
(43, '500G', '', '', 'imagem1-papa-de-ovo-floculada-202004022103.png', 'imagem2-papa-de-ovo-floculada-202004022103.jpg', '', '', '', '500g', 63),
(48, '5KG', '', '456', 'imagem1-5kg-202005181920.png', 'imagem2-5kg-202005181920.jpg', '', '', '', '5kg', 71);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vitrine_subgrupo`
--

CREATE TABLE `vitrine_subgrupo` (
  `id_vitrine_subgrupo` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `nome_pagina` varchar(100) DEFAULT NULL,
  `imagem_capa` varchar(255) DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `id_vitrine_grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `vitrine_subgrupo`
--

INSERT INTO `vitrine_subgrupo` (`id_vitrine_subgrupo`, `descricao`, `status`, `nome_pagina`, `imagem_capa`, `url_amigavel`, `id_vitrine_grupo`) VALUES
(7, 'Alimentos Extrusados', 1, '', 'alimentos-extrusados-202004022107.jpg', NULL, 1),
(8, 'Alimentos Extrusados', 1, '', 'alimentos-extrusados-202004022107.jpg', NULL, 2),
(9, 'Farinhadas', 1, '', 'farinhadas-202004022108.jpg', NULL, 1),
(10, 'Alimentos Especiais', 1, '', 'alimentos-especiais-202004022107.jpg', NULL, 1);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id_banner`);

--
-- Índices de tabela `blog_categorias`
--
ALTER TABLE `blog_categorias`
  ADD PRIMARY KEY (`id_blog_categorias`);

--
-- Índices de tabela `blog_comentario`
--
ALTER TABLE `blog_comentario`
  ADD PRIMARY KEY (`id_blog_comentario`),
  ADD KEY `fk_blog_comentario_blog_postagem1_idx` (`id_blog_postagem`),
  ADD KEY `fk_blog_comentario_usuario_cliente1_idx` (`id_usuario_cliente`);

--
-- Índices de tabela `blog_imagens`
--
ALTER TABLE `blog_imagens`
  ADD PRIMARY KEY (`id_blog_imagens`);

--
-- Índices de tabela `blog_postagem`
--
ALTER TABLE `blog_postagem`
  ADD PRIMARY KEY (`id_blog_postagem`),
  ADD KEY `fk_blog_postagem_usuarios1_idx` (`id_usuarios`),
  ADD KEY `fk_blog_postagem_blog_subcategorias1_idx` (`id_blog_subcategorias`);

--
-- Índices de tabela `blog_postagem_galeria`
--
ALTER TABLE `blog_postagem_galeria`
  ADD PRIMARY KEY (`id_blog_postagem_galeria`),
  ADD KEY `fk_blog_postagem_galeria_blog_postagem1_idx` (`id_blog_postagem`);

--
-- Índices de tabela `blog_subcategorias`
--
ALTER TABLE `blog_subcategorias`
  ADD PRIMARY KEY (`id_blog_subcategorias`),
  ADD KEY `fk_blog_subcategorias_blog_categorias1_idx` (`id_blog_categorias`);

--
-- Índices de tabela `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id_cases`),
  ADD KEY `fk_cases_clientes1_idx` (`id_clientes`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_clientes`);

--
-- Índices de tabela `depoimentos`
--
ALTER TABLE `depoimentos`
  ADD PRIMARY KEY (`id_depoimentos`),
  ADD KEY `fk_depoimentos_clientes1_idx` (`id_clientes`);

--
-- Índices de tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`id_enderecos`);

--
-- Índices de tabela `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`id_equipe`);

--
-- Índices de tabela `equipe_contato`
--
ALTER TABLE `equipe_contato`
  ADD PRIMARY KEY (`id_equipe_contato`),
  ADD KEY `fk_equipe_contato_equipe1_idx` (`id_equipe`);

--
-- Índices de tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_eventos`);

--
-- Índices de tabela `galeria_grupo`
--
ALTER TABLE `galeria_grupo`
  ADD PRIMARY KEY (`id_galeria_grupo`);

--
-- Índices de tabela `galeria_imagem`
--
ALTER TABLE `galeria_imagem`
  ADD PRIMARY KEY (`id_galeria_imagem`),
  ADD KEY `fk_galeria_item_galeria_grupo_idx` (`id_galeria_grupo`);

--
-- Índices de tabela `informacoes`
--
ALTER TABLE `informacoes`
  ADD PRIMARY KEY (`id_informacoes`),
  ADD KEY `fk_informacoes_paginas1_idx` (`id_paginas`);

--
-- Índices de tabela `paginas`
--
ALTER TABLE `paginas`
  ADD PRIMARY KEY (`id_paginas`);

--
-- Índices de tabela `perguntas_frequentes`
--
ALTER TABLE `perguntas_frequentes`
  ADD PRIMARY KEY (`id_perguntas_frequentes`),
  ADD KEY `fk_perguntas_frequentes_servicos1_idx` (`id_servicos`);

--
-- Índices de tabela `rh_candidatos`
--
ALTER TABLE `rh_candidatos`
  ADD PRIMARY KEY (`id_rh_candidatos`);

--
-- Índices de tabela `rh_candidatos_caracteristicas_fisicas`
--
ALTER TABLE `rh_candidatos_caracteristicas_fisicas`
  ADD PRIMARY KEY (`id_rh_candidatos_caracteristicas_fisicas`),
  ADD KEY `fk_rh_candidatos_caracteristicas_fisicas_rh_candidatos1_idx` (`id_rh_candidatos`);

--
-- Índices de tabela `rh_candidatos_caracteristicas_profissionais`
--
ALTER TABLE `rh_candidatos_caracteristicas_profissionais`
  ADD PRIMARY KEY (`id_rh_candidatos_caracteristicas_profissionais`),
  ADD KEY `fk_rh_candidatos_caracteristicas_profissionais_rh_candidato_idx` (`id_rh_candidatos`);

--
-- Índices de tabela `rh_candidatos_dados_familiares`
--
ALTER TABLE `rh_candidatos_dados_familiares`
  ADD PRIMARY KEY (`id_rh_candidatos_dados_familiares`),
  ADD KEY `fk_rh_candidatos_dados_familiares_rh_candidatos1_idx` (`id_rh_candidatos`);

--
-- Índices de tabela `rh_candidatos_disponibilidade`
--
ALTER TABLE `rh_candidatos_disponibilidade`
  ADD PRIMARY KEY (`id_rh_candidatos_disponibilidade`),
  ADD KEY `fk_rh_candidato_disponibilidade_rh_candidatos1_idx` (`id_rh_candidatos`);

--
-- Índices de tabela `rh_candidatos_formacao_cursos`
--
ALTER TABLE `rh_candidatos_formacao_cursos`
  ADD PRIMARY KEY (`id_rh_candidatos_formacao_cursos`),
  ADD KEY `fk_rh_candidatos_formacao_cursos_rh_candidatos1_idx` (`id_rh_candidatos`);

--
-- Índices de tabela `rh_candidatos_saude_fisica_emocional`
--
ALTER TABLE `rh_candidatos_saude_fisica_emocional`
  ADD PRIMARY KEY (`id_rh_candidatos_saude_fisica_emocional`),
  ADD KEY `fk_rh_candidatos_saude_fisica_emocional_rh_candidatos1_idx` (`id_rh_candidatos`);

--
-- Índices de tabela `rh_candidatos_situacoes_informacoes`
--
ALTER TABLE `rh_candidatos_situacoes_informacoes`
  ADD PRIMARY KEY (`id_rh_candidatos_situacoes_informacoes`),
  ADD KEY `fk_rh_candidatos_situacoes_informacoes_rh_candidatos1_idx` (`id_rh_candidatos`);

--
-- Índices de tabela `rh_vagas`
--
ALTER TABLE `rh_vagas`
  ADD PRIMARY KEY (`id_rh_vagas`),
  ADD KEY `fk_vaga_clientes1_idx` (`id_clientes`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id_servicos`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`);

--
-- Índices de tabela `usuario_cliente`
--
ALTER TABLE `usuario_cliente`
  ADD PRIMARY KEY (`id_usuario_cliente`);

--
-- Índices de tabela `usuario_cliente_dados`
--
ALTER TABLE `usuario_cliente_dados`
  ADD PRIMARY KEY (`id_usuario_cliente_dados`),
  ADD KEY `fk_usuario_cliente_dados_usuario_cliente1_idx` (`id_usuario_cliente`);

--
-- Índices de tabela `vitrine_categoria`
--
ALTER TABLE `vitrine_categoria`
  ADD PRIMARY KEY (`id_vitrine_categoria`);

--
-- Índices de tabela `vitrine_grupo`
--
ALTER TABLE `vitrine_grupo`
  ADD PRIMARY KEY (`id_vitrine_grupo`);

--
-- Índices de tabela `vitrine_produto`
--
ALTER TABLE `vitrine_produto`
  ADD PRIMARY KEY (`id_vitrine_produto`),
  ADD KEY `fk_vitrine_produto_vitrine_subgrupo1_idx` (`id_vitrine_subgrupo`);

--
-- Índices de tabela `vitrine_produto_cores`
--
ALTER TABLE `vitrine_produto_cores`
  ADD PRIMARY KEY (`id_vitrine_produto_cores`),
  ADD KEY `fk_vitrine_produto_cores_vitrine_produto1_idx` (`id_vitrine_produto`);

--
-- Índices de tabela `vitrine_subgrupo`
--
ALTER TABLE `vitrine_subgrupo`
  ADD PRIMARY KEY (`id_vitrine_subgrupo`),
  ADD KEY `fk_vitrine_subgrupo_vitrine_grupo1_idx` (`id_vitrine_grupo`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `banner`
--
ALTER TABLE `banner`
  MODIFY `id_banner` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `blog_categorias`
--
ALTER TABLE `blog_categorias`
  MODIFY `id_blog_categorias` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `blog_comentario`
--
ALTER TABLE `blog_comentario`
  MODIFY `id_blog_comentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `blog_imagens`
--
ALTER TABLE `blog_imagens`
  MODIFY `id_blog_imagens` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `blog_postagem`
--
ALTER TABLE `blog_postagem`
  MODIFY `id_blog_postagem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `blog_postagem_galeria`
--
ALTER TABLE `blog_postagem_galeria`
  MODIFY `id_blog_postagem_galeria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `blog_subcategorias`
--
ALTER TABLE `blog_subcategorias`
  MODIFY `id_blog_subcategorias` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cases`
--
ALTER TABLE `cases`
  MODIFY `id_cases` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_clientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `depoimentos`
--
ALTER TABLE `depoimentos`
  MODIFY `id_depoimentos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `id_enderecos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `equipe`
--
ALTER TABLE `equipe`
  MODIFY `id_equipe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `equipe_contato`
--
ALTER TABLE `equipe_contato`
  MODIFY `id_equipe_contato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_eventos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `galeria_grupo`
--
ALTER TABLE `galeria_grupo`
  MODIFY `id_galeria_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `galeria_imagem`
--
ALTER TABLE `galeria_imagem`
  MODIFY `id_galeria_imagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `informacoes`
--
ALTER TABLE `informacoes`
  MODIFY `id_informacoes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `paginas`
--
ALTER TABLE `paginas`
  MODIFY `id_paginas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `perguntas_frequentes`
--
ALTER TABLE `perguntas_frequentes`
  MODIFY `id_perguntas_frequentes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rh_candidatos`
--
ALTER TABLE `rh_candidatos`
  MODIFY `id_rh_candidatos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rh_candidatos_caracteristicas_fisicas`
--
ALTER TABLE `rh_candidatos_caracteristicas_fisicas`
  MODIFY `id_rh_candidatos_caracteristicas_fisicas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rh_candidatos_caracteristicas_profissionais`
--
ALTER TABLE `rh_candidatos_caracteristicas_profissionais`
  MODIFY `id_rh_candidatos_caracteristicas_profissionais` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rh_candidatos_dados_familiares`
--
ALTER TABLE `rh_candidatos_dados_familiares`
  MODIFY `id_rh_candidatos_dados_familiares` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rh_candidatos_disponibilidade`
--
ALTER TABLE `rh_candidatos_disponibilidade`
  MODIFY `id_rh_candidatos_disponibilidade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rh_candidatos_formacao_cursos`
--
ALTER TABLE `rh_candidatos_formacao_cursos`
  MODIFY `id_rh_candidatos_formacao_cursos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rh_candidatos_saude_fisica_emocional`
--
ALTER TABLE `rh_candidatos_saude_fisica_emocional`
  MODIFY `id_rh_candidatos_saude_fisica_emocional` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rh_candidatos_situacoes_informacoes`
--
ALTER TABLE `rh_candidatos_situacoes_informacoes`
  MODIFY `id_rh_candidatos_situacoes_informacoes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rh_vagas`
--
ALTER TABLE `rh_vagas`
  MODIFY `id_rh_vagas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id_servicos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuario_cliente`
--
ALTER TABLE `usuario_cliente`
  MODIFY `id_usuario_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario_cliente_dados`
--
ALTER TABLE `usuario_cliente_dados`
  MODIFY `id_usuario_cliente_dados` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vitrine_categoria`
--
ALTER TABLE `vitrine_categoria`
  MODIFY `id_vitrine_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `vitrine_grupo`
--
ALTER TABLE `vitrine_grupo`
  MODIFY `id_vitrine_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `vitrine_produto`
--
ALTER TABLE `vitrine_produto`
  MODIFY `id_vitrine_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de tabela `vitrine_produto_cores`
--
ALTER TABLE `vitrine_produto_cores`
  MODIFY `id_vitrine_produto_cores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `vitrine_subgrupo`
--
ALTER TABLE `vitrine_subgrupo`
  MODIFY `id_vitrine_subgrupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `blog_comentario`
--
ALTER TABLE `blog_comentario`
  ADD CONSTRAINT `fk_blog_comentario_blog_postagem1` FOREIGN KEY (`id_blog_postagem`) REFERENCES `blog_postagem` (`id_blog_postagem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_blog_comentario_usuario_cliente1` FOREIGN KEY (`id_usuario_cliente`) REFERENCES `usuario_cliente` (`id_usuario_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `blog_postagem`
--
ALTER TABLE `blog_postagem`
  ADD CONSTRAINT `fk_blog_postagem_blog_subcategorias1` FOREIGN KEY (`id_blog_subcategorias`) REFERENCES `blog_subcategorias` (`id_blog_subcategorias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_blog_postagem_usuarios1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `blog_postagem_galeria`
--
ALTER TABLE `blog_postagem_galeria`
  ADD CONSTRAINT `fk_blog_postagem_galeria_blog_postagem1` FOREIGN KEY (`id_blog_postagem`) REFERENCES `blog_postagem` (`id_blog_postagem`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `blog_subcategorias`
--
ALTER TABLE `blog_subcategorias`
  ADD CONSTRAINT `fk_blog_subcategorias_blog_categorias1` FOREIGN KEY (`id_blog_categorias`) REFERENCES `blog_categorias` (`id_blog_categorias`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `cases`
--
ALTER TABLE `cases`
  ADD CONSTRAINT `fk_cases_clientes1` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `depoimentos`
--
ALTER TABLE `depoimentos`
  ADD CONSTRAINT `fk_depoimentos_clientes1` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `equipe_contato`
--
ALTER TABLE `equipe_contato`
  ADD CONSTRAINT `fk_equipe_contato_equipe1` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id_equipe`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `galeria_imagem`
--
ALTER TABLE `galeria_imagem`
  ADD CONSTRAINT `fk_galeria_item_galeria_grupo` FOREIGN KEY (`id_galeria_grupo`) REFERENCES `galeria_grupo` (`id_galeria_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `informacoes`
--
ALTER TABLE `informacoes`
  ADD CONSTRAINT `fk_informacoes_paginas1` FOREIGN KEY (`id_paginas`) REFERENCES `paginas` (`id_paginas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `perguntas_frequentes`
--
ALTER TABLE `perguntas_frequentes`
  ADD CONSTRAINT `fk_perguntas_frequentes_servicos1` FOREIGN KEY (`id_servicos`) REFERENCES `servicos` (`id_servicos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `rh_candidatos_caracteristicas_fisicas`
--
ALTER TABLE `rh_candidatos_caracteristicas_fisicas`
  ADD CONSTRAINT `fk_rh_candidatos_caracteristicas_fisicas_rh_candidatos1` FOREIGN KEY (`id_rh_candidatos`) REFERENCES `rh_candidatos` (`id_rh_candidatos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `rh_candidatos_caracteristicas_profissionais`
--
ALTER TABLE `rh_candidatos_caracteristicas_profissionais`
  ADD CONSTRAINT `fk_rh_candidatos_caracteristicas_profissionais_rh_candidatos1` FOREIGN KEY (`id_rh_candidatos`) REFERENCES `rh_candidatos` (`id_rh_candidatos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `rh_candidatos_dados_familiares`
--
ALTER TABLE `rh_candidatos_dados_familiares`
  ADD CONSTRAINT `fk_rh_candidatos_dados_familiares_rh_candidatos1` FOREIGN KEY (`id_rh_candidatos`) REFERENCES `rh_candidatos` (`id_rh_candidatos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `rh_candidatos_disponibilidade`
--
ALTER TABLE `rh_candidatos_disponibilidade`
  ADD CONSTRAINT `fk_rh_candidato_disponibilidade_rh_candidatos1` FOREIGN KEY (`id_rh_candidatos`) REFERENCES `rh_candidatos` (`id_rh_candidatos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `rh_candidatos_formacao_cursos`
--
ALTER TABLE `rh_candidatos_formacao_cursos`
  ADD CONSTRAINT `fk_rh_candidatos_formacao_cursos_rh_candidatos1` FOREIGN KEY (`id_rh_candidatos`) REFERENCES `rh_candidatos` (`id_rh_candidatos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `rh_candidatos_saude_fisica_emocional`
--
ALTER TABLE `rh_candidatos_saude_fisica_emocional`
  ADD CONSTRAINT `fk_rh_candidatos_saude_fisica_emocional_rh_candidatos1` FOREIGN KEY (`id_rh_candidatos`) REFERENCES `rh_candidatos` (`id_rh_candidatos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `rh_candidatos_situacoes_informacoes`
--
ALTER TABLE `rh_candidatos_situacoes_informacoes`
  ADD CONSTRAINT `fk_rh_candidatos_situacoes_informacoes_rh_candidatos1` FOREIGN KEY (`id_rh_candidatos`) REFERENCES `rh_candidatos` (`id_rh_candidatos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `rh_vagas`
--
ALTER TABLE `rh_vagas`
  ADD CONSTRAINT `fk_vaga_clientes1` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `usuario_cliente_dados`
--
ALTER TABLE `usuario_cliente_dados`
  ADD CONSTRAINT `fk_usuario_cliente_dados_usuario_cliente1` FOREIGN KEY (`id_usuario_cliente`) REFERENCES `usuario_cliente` (`id_usuario_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `vitrine_produto`
--
ALTER TABLE `vitrine_produto`
  ADD CONSTRAINT `fk_vitrine_produto_vitrine_subgrupo1` FOREIGN KEY (`id_vitrine_subgrupo`) REFERENCES `vitrine_subgrupo` (`id_vitrine_subgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `vitrine_produto_cores`
--
ALTER TABLE `vitrine_produto_cores`
  ADD CONSTRAINT `fk_vitrine_produto_cores_vitrine_produto1` FOREIGN KEY (`id_vitrine_produto`) REFERENCES `vitrine_produto` (`id_vitrine_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `vitrine_subgrupo`
--
ALTER TABLE `vitrine_subgrupo`
  ADD CONSTRAINT `fk_vitrine_subgrupo_vitrine_grupo1` FOREIGN KEY (`id_vitrine_grupo`) REFERENCES `vitrine_grupo` (`id_vitrine_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
