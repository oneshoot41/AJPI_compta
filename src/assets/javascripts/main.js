import 'bootstrap';
import $ from "jquery";
import Amber from 'amber';

$(document).ready(function(){
    var select_user = $("#select_user").find(":selected").val();
    var select_item = $("#paid-select").find(":selected").val();
    var selected_user = $("#select_user").val();
    
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
    
});
