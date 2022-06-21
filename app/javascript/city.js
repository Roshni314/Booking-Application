
$("#event_location_id").prop("disabled", true); // second dropdown is disable while first dropdown is empty
$("#event_city_id").change(function(){
  	var city = $(this).val();
  	if(city == ''){
  		$("#event_location_id").prop("disabled", true);
  	}else{
  		$("#event_location_id").prop("disabled", false);
  	}
  	$.ajax({
	    url: "/events/new",
	    method: "GET",  
	    dataType: "json",
	    data: {city: city},
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (response) {
	      	console.log(response);
	      	var locations = response["locations"];
	      	$("#event_location_id").empty();

	      	$("#event_location_id").append('<option>Select location</option>');
	      	for(var i = 0; i < locations.length; i++){
	      		$("#event_location_id").append('<option value="' + locations[i]["id"] + '">' +locations[i]["name"] + '</option>');
	      	}
	    }
  	});
});
