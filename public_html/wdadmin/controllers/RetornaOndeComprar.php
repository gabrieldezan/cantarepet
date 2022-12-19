<?php

require_once "../class/Clientes.class.php";

$Clientes = new Clientes();
$Clientes->setCidade($_POST['vsCidade']);
$Clientes->setEstado($_POST['vsEstado']);

if ($Clientes->consulta_onde_comprar()):
    print $Clientes->getRetorno_dados();
else:
    print 0;
endif;