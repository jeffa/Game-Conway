function fetch_table() {

    var params = $.param([
        {name: "rows",      value: document.config.rows.value},
        {name: "cols",      value: document.config.cols.value},
        {name: "on",        value: document.config.on.value},
        {name: "off",       value: document.config.off.value},
        {name: "wechsler",  value: document.config.wechsler.value},
        //{name: "url",       value: document.config.url.value},
        //{name: "alpha",     value: document.config.url.alpha},
        {name: "fade",      value: document.config.fade.checked},
    ]);

    var url  = '/table' + '?' + params;
    _ajaxGET( url, '#spreadsheet' );
}

function _ajaxGET( url, id, err ) {

    if (!err) {
        err = '<div class="alert alert-error">'
            + '<button type="button" class="close" data-dismiss="alert">&times;</button>'
            + '<strong>Error!</strong>'
            + ' Ajax call failed: ' 
            + url 
            + '</div>'
    }

    $.ajax( {
        url: url,
        type: 'GET',
        success: function( data, status, xhr ) {
            $( id ).html( xhr.responseText );
        },
        error: function( xhr, status, error ) {
            $( id ).html( err );
        }
    });
}
