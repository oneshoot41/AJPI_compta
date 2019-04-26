import 'bootstrap';
import $ from "jquery";
import Amber from 'amber';

$(document).ready(function(){
    var select_user = $("#select_user").find(":selected").val();
    var select_item = $("#paid-select").find(":selected").val();
    var selected_user = $("#select_user").val();
    var year = $("#year").attr("value");
    var month = $("#month").attr("value");
    
    // Affichage ou non des méthodes de paiements
    if (select_item == "true") {
        $("#payment_method").show();
    } else {
        $("#payment_method").hide();
    };

    $("#paid-select").change(function() {
        $("#payment_method").toggle();
    });

    // Affichage des Clients ou Fournisseurs
 
    if (select_user == "provider") {
        $("#customers").hide();
        $("#providers").show();
        $("#type").show();
    } else if(select_user == "customer") {
        $("#providers").hide();
        $("#customers").show();
        $("#type").hide();
    } else {
        $("#providers").hide();
        $("#customers").hide();
    };
    

    $("#select_user").change(function() {
        $("#customers").toggle();
        $("#providers").toggle();
        $("#type").toggle();
        
        if(selected_user == "customer"){
            selected_user = "provider";
        } else {
            selected_user = "customer"
        };

        if(selected_user == "provider"){
            $("#select_provider").attr("name", "user_id");
            $("#select_customer").attr("name", "");
            $("#select_type").attr("name", "type");
        } else {
            $("#select_customer").attr("name", "user_id");
            $("#select_provider").attr("name", "");
            $("#select_type").attr("name", "");
        }
    });

    $("#category_filter").change(function(){
        $.ajax({
            url: "/invoice_category/json?c=" + $(this).val() + "&p=1" + "&y=" + year + "&m=" + month, 
            success: function(invoices){
                $("#tbody_paid").html("");
                invoices.forEach(element => {
                    var date = new Date(element.date);
                    var datef = date.getDate() + '/' + (date.getMonth() + 1) + '/' +  date.getFullYear();
                    $("#tbody_paid").append("<tr class=\"border-b border-black \"><td class=\"border-l border-black\"><a class=\"no-underline text-green hover:text-red transition bg-white rounded\" href=\"/invoices/" + element.id + "\">" + element.name + "</a></td>" + "<td class=\"border-l border-black\">" + datef + "</td>" + "<td class=\"border-l border-black\">" + element.amount + "</td>" + "<td class=\"border-l border-black\">" + (element.amount + element.amount*(element.tva/100)) + "</td>" + "<td class=\"border-l border-black\">" + element.type + "</td></tr>" );
                });
            }
        });
    });

    $("#category_filter_unpaid").change(function(){
        $.ajax({
            url: "/invoice_category/json?c=" + $(this).val() + "&p=0" + "&y=" + year + "&m=" + month, 
            success: function(invoices){
                $("#tbody_paid").html("");
                invoices.forEach(element => {
                    $("#tbody_paid").append("<tr><td class=\"border-l border-black\"><a class=\"no-underline text-green hover:text-red transition bg-white rounded\" href=\"/invoices/" + element.id + "\">" + element.name + "</a></td>" + "<td class=\"border-l border-black\">" + element.date + "</td>" + "<td class=\"border-l border-black\">" + element.amount + "</td>" + "<td class=\"border-l border-black\">" + (element.amount + element.amount*(element.tva/100)) + "</td>" + "<td class=\"border-l border-black\">" + element.type + "</td></tr>" );
                });
            }
        });
    });
});
