/*
 Template Name: Opatix - Admin & Dashboard Template
 Author: Myra Studio
 File: Mask js
*/


$(document).ready(function(){$('[data-toggle="input-mask"]').each(function(a,e){var t=$(e).data("maskFormat"),n=$(e).data("reverse");null!=n?$(e).mask(t,{reverse:n}):$(e).mask(t)})});