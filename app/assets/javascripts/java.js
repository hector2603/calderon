
function ajaxServicios(){
	$.ajax({ url: "/types.json"}).done(function(data) {
		for (i = 0; i < data.length; i++) { 
		    //console.log(data[i]);
    		$("#boton_servicios").append( "<li><a href=/services?tipo_id="+data[i].id+">"+data[i].nombre+"</a></li>" );
		}
	});
}

function cotiza(){
  $(function(){
  	var c = $("#vehiculo");
  	c.change(function(){
  		if(c.val()!="seleccione"){
  			var v = $("#clase");
  			v.html('<option value="seleccione">Seleccione</option>');
  			$.ajax({ url: "/soat_privates.json?vehiculo="+c.val()}).done(function(data) {
  				console.log(data);
  				for (i = 0; i < data.length; i++) { 
  		    		$("#clase").append( "<option value='"+data[i].clase+"'>"+data[i].clase+"</option>" );
  				}
  			});
  			v.change(function(){
  				if(v.val()!="seleccione"){
  					$.ajax({ url: "/soat_privates.json?vehiculo="+c.val()+"&clase="+v.val()}).done(function(data) {
  						console.log(c.val()+"----"+v.val()+"---");
  						console.log(data[0]);
  						var total = parseInt(data[0].contribucion)+parseInt(data[0].prima)+parseInt(data[0].tasa);
  				    	$("#valor").html( "El Valor del Soat es: $ "+currency(total,00));
  					});
  				}else{
  					$("#valor").html("");
  				}
  			});
  		}else{
  			var v = $("#clase");
  			v.html('<option value="seleccione">Seleccione</option>');
  		}
  	});
  })
}



function currency(value, decimals, separators) {
    decimals = decimals >= 0 ? parseInt(decimals, 0) : 2;
    separators = separators || ['.', "'", ','];
    var number = (parseFloat(value) || 0).toFixed(decimals);
    if (number.length <= (4 + decimals))
        return number.replace('.', separators[separators.length - 1]);
    var parts = number.split(/[-.]/);
    value = parts[parts.length > 1 ? parts.length - 2 : 0];
    var result = value.substr(value.length - 3, 3) + (parts.length > 1 ?
        separators[separators.length - 1] + parts[parts.length - 1] : '');
    var start = value.length - 6;
    var idx = 0;
    while (start > -3) {
        result = (start > 0 ? value.substr(start, 3) : value.substr(0, 3 + start))
            + separators[idx] + result;
        idx = (++idx) % 2;
        start -= 3;
    }
    return (parts.length == 3 ? '-' : '') + result;
}



var min=8;
var max=26;
function increaseFontSize() {

   var p = document.getElementsByTagName('body');
   for(i=0;i<p.length;i++) {

      if(p[i].style.fontSize) {
         var s = parseInt(p[i].style.fontSize.replace("px",""));
      } else {

         var s = 16;
      }
      if(s!=max) {
  		localStorage["tamañoActual"] = s + 1;
         s += 1;
      }
      p[i].style.fontSize = s+"px"

   }
}
function decreaseFontSize() {
   var p = document.getElementsByTagName('body');
   for(i=0;i<p.length;i++) {

      if(p[i].style.fontSize) {
         var s = parseInt(p[i].style.fontSize.replace("px",""));
      } else {

         var s = 16;
      }
      if(s!=min) {
      	localStorage["tamañoActual"] = s - 1;
         s -= 1;
      }
      p[i].style.fontSize = s+"px"

   }
}

function accesibilidad(){
	//console.log("Tamaño de la letra:  "+localStorage["tamañoActual"] );
	var p = document.getElementsByTagName('body');
	for(i=0;i<p.length;i++) {
      p[i].style.fontSize = localStorage["tamañoActual"]+"px"

   }
   if(localStorage["contraste"]=="true"){
   	accesibiliza();
   }
}





function accesibiliza(){
    var body = $("#cuerpo");// se ontiene el bodi de la página
    var class_name = "accesible"; // esta es la clase de css que se le va a asignar
    var bool = body.hasClass( "accesible" ); // se pregunta si tiene la clase, pasa saber si la pone o la quita
    if(bool){//ya la tiene. Remueve.
		body.removeClass(class_name); // remueve la clase
		localStorage["contraste"]=false;
    }
    else {//no tiene, agrega clase.
		body.addClass(class_name); // adiere la clase
		localStorage["contraste"]=true; 
    }
}


