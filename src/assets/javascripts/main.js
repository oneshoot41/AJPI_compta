import 'bootstrap';
import $ from "jquery";
import Amber from 'amber';

$(document).ready(function(){
    var select_user = $("#select_user").find(":selected").val();
    var select_item = $("#paid-select").find(":selected").val();

    if (select_item == "true") {
        $("#payment_method").show();
    } else {
        $("#payment_method").hide();
    };

    if (select_user == "provider") {
        $("#customers").hide();
        $("#providers").show();
    } else if(select_user == "customer") {
        $("#providers").hide();
        $("#customers").show();
    } else {
        $("#providers").hide();
        $("#customers").hide();
    };

    $("#select_user").change(function() {
        $("#customers").toggle();
        $("#providers").toggle();
    });

    $("#paid-select").change(function() {
        $("#payment_method").toggle();
    });
});
