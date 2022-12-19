$(document).ready(function () {

    vsUrl = $("#vsUrl").val();

    $("#botao_consulta_clientes").click(function () {
        $("#botao_consulta_clientes").html('<i class="fas fa-spinner fa-pulse"></i>');
        $("#botao_consulta_clientes").prop("disabled", true);
        consulta_clientes();
    });
});

function consulta_clientes() {

    var vsCidade = $("#vsCidade").val();
    var vsEstado = $("#vsEstado").val();
    vsHtml = "";

    $.ajax({
        url: vsUrl + "wdadmin/controllers/RetornaOndeComprar.php",
        type: "POST",
        dataType: "json",
        async: true,
        data: ({
            vsCidade: vsCidade,
            vsEstado: vsEstado
        }),
        success: function (data) {
            if (data != 0) {
                $("#ht__list__wrap").html("");
                for (i = 0; i < data.length; i++) {
                    $("#ht__list__wrap").append(
                            "<div class=\"ht__list__product\">" +
                            "<div class=\"ht__list__thumb\">" +
                            "<img src=\"" + vsUrl + "wdadmin/uploads/clientes/" + data[i].imagem + "\" alt=\"" + data[i].descricao + "\" title=\"" + data[i].descricao + "\">" +
                            "</div>" +
                            "<div class=\"htc__list__details\">" +
                            "<h2><a href=\"#\">" + data[i].descricao + "</a></h2>" +
                            "<p><i class=\"fas fa-map-marked-alt\"></i> " + data[i].endereco + ", " + data[i].cidade + " " + data[i].estado + "<br><i class=\"fas fa-phone\"></i> (45) 3036-8300</p>" +
                            "</div>" +
                            "</div>"
                            );
                }
            } else {
                $("#ht__list__wrap").html("");
                $("#ht__list__wrap").append(
                        "<tr>" +
                        "<td align=\"center\" colspan=\"10\"><h1 class='color-azul'>Nenhuma empresa encontrada!</h1></td>" +
                        "</tr>"
                        );
            }

            $('#botao_consulta_clientes').html('<i class="fas fa-search"></i>');
            $("#botao_consulta_clientes").prop("disabled", false);
        },
        error: function (data) {
            $("#botao_consulta_clientes").html('<i class="fas fa-search"></i>');
            $("#botao_consulta_clientes").prop("disabled", false);
            alert('Erro: ' + data);
        }
    });
}