 	
  	
  function changeTab(el, index){
  	$(".tabSelected").removeClass("tabSelected")
  	$(el).addClass("tabSelected")
  	if(index == 1) {
      $("#tab2").hide()
      $("#tab1").show()
  	} else if(index == 2) {
  	  $("#tab1").hide()
      $("#tab2").show()
  	}
  }