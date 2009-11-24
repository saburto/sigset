
jQuery.extend(jQuery.validator.messages, {
  required: "Este campo es obligatorio.",
  remote: "Debe ingresar este campo",
  email: "Debe ingresar una direcci&oacute;n de correo v\u00e1lida.",
  url: "Debe ingresar una URL v\u00e1lida.",
  date: "Por favor, escribe una fecha v\u00e1lida.",
  dateISO: "Por favor, escribe una fecha (ISO) v\u00e1lida.",  
  number: "Debe ingresar un n&uacute;mero entero v\u00e1lida.",
  digits: "Debe ingresar s&oacute;lo d&iacute;gitos.",
  creditcard: "Debe ingresar un n&uacute;mero de tarjeta v\u00e1lida.",
  equalTo: "Debe ingresar el mismo valor de nuevo.",
  accept: "Debe ingresar una valor con una extensi&oacute;n aceptada.",
  maxlength: jQuery.validator.format("No debe ingresar m&aacute;s de {0} caracteres."),
  minlength: jQuery.validator.format("No debe ingresar menos de {0} caracteres."),
  rangelength: jQuery.validator.format("Debe ingresar un valor entre {0} y {1} caracteres."),
  range: jQuery.validator.format("Debe ingresar un valor entre {0} y {1}."),
  max: jQuery.validator.format("Debe ingresar un valor igual o menor que {0}."),
  min: jQuery.validator.format("Debe ingresar un valor igual o mayor que {0}.")
});