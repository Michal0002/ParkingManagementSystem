$(document).on('change', '#region-select', function(){
  var regionId = $(this).val();
  $.ajax({
    url: '/get_parking_spots',
    data: { region_id: regionId },
    success: function(data){
      var options = '';
      $.each(data, function(index, value){
        options += '<option value="' + value.id + '">' + value.name + '</option>';
      });
      $('#reservation_parking_spot_id').html(options);
    }
  });
});