/**
 * Created by dima on 12.01.18.
 */

$(document).ready(function () {
    $.getJSON(
        '/users/all',
        function (json) {
            var select = '<select name="customername" form="customerForm">';
            for(var k in json){
                select += '<option>' + json[k] + '</option>';
            }
            $('#select').append(select);
        });

    $.getJSON(
        '/drugstore/all',
        function (json) {
            var row_count = 1;
            var table = '<caption>List of drugs in our farmacy</caption>'+
                '<thead>' +
                '<tr>' +
                '<th scope="col">#</th>' +
                '<th scope="col">Drug\'s name</th>' +
                '<th scope="col">Amount</th>' +
                '<th scope="col">Price</th>' +
                '<th scope="col">Amount for sale</th>' +
                '</tr>' +
                '</thead>' +
                '<tbody>';
            for(var k in json){
                table += '<tr><th scope="row">'+ (row_count++) + '</th>' + '<td>' + json[k].drug_name + '</td>' +
                    '<td>' + json[k].amount + '</td>' +
                    '<td>' + json[k].price+ '</td>' +
                    '<td>' +'<input type="number" name = "drugamont"  value="0" min="0" size="10" max="' + json[k].amount + '"/> '+ '</td>' +
                    '<td>' +'<input type="hidden" name = "drugname" value ="' + json[k].drug_name + '" /> '+ '</td>' +
                    '<td>' +'<input type="hidden" name = "drugprice" value ="' + json[k].price + '" /> '+ '</td>' +
                    '</tr>'
            }
            table += '</tbody>';
            $('table').append(table);
        });
});
