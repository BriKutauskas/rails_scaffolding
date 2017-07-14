$("document").ready(function() {

  $("#add_new_animal_button").on(
    "click",
    function() {
      // Data to be submitted
      newAnimal = {
        // create the animal object
        "animal": {
          // the animal has a name
          "common_name": $("#animal_common_name").val(),
          // the animal has a latin name
          "latin_name": $("#animal_latin_name").val(),
          // the animal has a kingdom
          "kingdom": $("#animal_kingdom").val()
        }
      } // end new_animal

      // give an alert to show newAnimal object. Use JSON.stringify to show the object, otherwise the alert will just show [object Object]
      // alert("Sending message: " + JSON.stringify(newAnimal));
      // create the Ajax call.
      $.ajax({
        // tell the server that we are talking JSON
        dataType: 'json',
        // tell the server what resource to retrieve
        url: '/animals',
        // the HTTP method to store information on the server
        method: 'POST',
        // data to be sent. In this case it is the newAnimal object that was created
        data: newAnimal,
        // call this function if call to server was successful
        success: function(dataFromServer) {
          add_to_animal_list(dataFromServer);
        },
        // call this function if call to server was not successful
        error: function(jqXHR, textStatus, errorThrown) {
          alert("Add new animal failed: " + errorThrown);
        }
      });// end ajax

  });// end add animal

  $("#add_new_sighting_button").on(
    "click",
    function() {
      // Data to be submitted
      newSighting = {
        "sighting": {
          "date": $("#sighting_date").val(),
          "time": $("#sighting_time").val(),
          "latitude": $("#sighting_latitude").val(),
          "longitude": $("#sighting_longitude").val(),
          "region": $("#sighting_region").val(),
          "animal_id": $("#animal_id").val()
        }
      }

      $.ajax({
        dataType: 'json',
        url: '/sightings',
        method: 'POST',
        data: newSighting,
        success: function(dataFromServer) {
          add_to_sighting_list(dataFromServer);
        },
        error: function(jqXHR, textStatus, errorThrown) {
          alert("Add new sighting failed: " + errorThrown);
        }
      });
  });// end add wine


}); // end document ready

// Function to be called after data has been successfully submitted
  function add_to_animal_list(data) {
    $("#animal_list").append(

        '<tr><td>' +
    data.common_name + "</td><td>" + data.latin_name + "</td><td>" + data.kingdom + "</td><td><a href='/animals/" + data.id + "'" + ">Show</a></td><td><a href='/animals/" + data.id + "/edit'" + ">Edit</a></td><td><a data-confirm='Are you sure?' data-method='delete' rel='nofollow' href='/animals/" + data.id + "'" + ">Destroy</a></td></tr>"
    );
  }

  function add_to_sighting_list(data) {
  $("#sighting_list").append(
    '<li><a href="' + '/sightings/' + data.id + '">' +
    new Date(data.time).toLocaleTimeString(['en-GB'], {hour: '2-digit', minute:'2-digit'}) + " " + data.date + "</a></li>");
}
