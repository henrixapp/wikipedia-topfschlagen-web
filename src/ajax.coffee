`/*
  (c) 2013, Henrik Reinstädtler
  Datei: ajax.js
  Diese Datei enthält die Standardajaxfunktion inklusive Fehlerausgabe über Bootstrapmessenger
  TODO:to coffeescruot
  */
//require(["bower_components/offline.js/offline.js"]);
define([],function ( )
{
return function(uri, method, data,isChached) {
      var daten = null;
    if(data!=null){daten = JSON.stringify(data);}
      request = {
        url: uri,
        type: method,
        contentType: "application/json",
        accepts: "application/json",
        cache: isChached,
        dataType: 'json',
        async:isChached,
        data: JSON.stringify(data),
        beforeSend: function(xhr) {

        },
        error: function(jqXHR) {
    return Messenger().post({
        message: 'Es ist ein Fehler aufgetreten:'+jqXHR.responseJSON.message,
        type: 'error'
    });
      }
      };
      return $.ajax(request);
    };
});`
