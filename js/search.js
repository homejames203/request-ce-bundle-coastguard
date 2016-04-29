$(function(){
  var payload = JSON.stringify({"values": {"Search Query": bundle.urlParam('q'),"Results Found": $('#resultsFound').val()}});
  $.ajax({
      method: 'POST',
      url: 'app/api/v1/kapps/' + bundle.kappSlug() + '/forms/portal-searches/submissions?submit=true',
      dataType: "json",
      data:   payload,
      contentType: "application/json",
      
      // If form creation was successful run this code
      success: function(response, textStatus, jqXHR){
        console.log('Search Result Added');
      },
      // If there was an error, show the error
      error: function(jqXHR, textStatus, errorThrown){
        console.log('Search Submission Failed');
      }
  });
});