 $("#checkall").click(function(){        
  if($("#checkall").prop("checked")) {
     $("input[type=checkbox]").prop("checked",true);
} else {$("input[type=checkbox]").prop("checked",false); }
 })
 $("#cancelchoice").click((e) => {
    $("input[type=checkbox]").prop("checked",false);
 });
