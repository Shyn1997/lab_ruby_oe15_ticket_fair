$(document).ready(function() {
  $(".readonly").on('keydown paste', function(e){
    e.preventDefault();
  });

  $('#defaultOpen').click();
});

$(document).ready(function() {
  $("#tg-buton1").hide();
  $("#tg-buton2").hide();
});

$(document).ready(function(){
  $("#buton1").click(function(){
    $("#tg-buton1").toggle();
  });
});

$(document).ready(function(){
  $("#buton2").click(function(){
    $("#tg-buton2").toggle();
  });
});

$(document).ready(function() {
  $(".readonly").on('keydown paste', function(e){
    e.preventDefault();
  });

  $('#defaultOpen').click();
});

$(document).ready(function(){
  $(".startPoint").change(function(){
    var url = $(this).attr('data-url');
    $.ajax({
      url: url,
      method: 'get',
      dataType: "json",

    }).done(function(result){
        // console.log(result);
        $( ".startPoint" ).autocomplete({
          source: result
        });
      })
  });
});

$(document).ready(function(){
  $(".boarding-point").click(function(){
    $(this).parents(".bus-time").children(".boardingPointPanel").toggle();
  });
});

$(document).ready(function(){
  $(".button-show").click(function(){
    var status = $(this).attr("show");
    if (status == "false") {
        $(this).attr("show","true");
        $(this).html("Chọn chỗ");
      } else {
        $(this).attr("show","false");
        $(this).html("Ẩn");
      }
    $(this).parents(".bus-time").children(".bookingbroading").toggle();
  });
});

$(document).ready(function(){
  $(".show-bus-time").click(function(){
    var status = $(this).attr("show");
    if (status == "false") {
      $(this).attr("show","true");
      $(this).html("Đóng");
      $(this).attr("style", "background: rgb(136, 136, 136)");
    } else {
      $(this).attr("show","false");
      $(this).html("Xem chuyến xe");
      $(this).removeAttr("style");
    }
    $(this).parents(".search-item").children(".bus-time-list").toggle();
  });
});

$(document).ready(function(){
  $(".seatpick-available").click(function(){
    var status = $(this).attr("data-status");
    var seat_code = $(this).attr("data-code");
    var seat_id = $(this).attr("data-id");
    if (status == "selected") {
      $(this).attr("data-status", "available");
      var attr_name = ".ticket-" + seat_id;
      $(this).parents(".bus-time-booking").find(".list_ticket").children().remove(attr_name);
      $(this).parent("li").attr("class","seat sleeper available");
      $(this).parents(".bus-time-booking").find(".selectedSeat").html('');
      $(".ticket").each(function(index){
        var seat = $(this).attr("data-seat");

        $(this).parents(".bus-time-booking").find(".selectedSeat").append(seat + ", ");
      });
    }
    else if (status == "available") {
      var trip_id = $(this).attr("data-trip");

      var bus_station = $(this).attr("data-bus-station");
      var fare = parseFloat($(this).attr("data-fare"));
      var total = parseFloat($(this).parents(".bus-time-booking").find(".total").html()) + fare;
      var n = $(".ticket").size();
      $(this).attr("data-status", "selected");
      $(this).parents(".bus-time-booking").find(".list_ticket").append("<div class='ticket ticket-"+seat_id+"' data-seat='"+seat_code+"' ><input type='hidden' class='booking-ticket' name='customer[tickets_attributes][" + n + "][seat_id]' value='" + seat_id +"' id='customer_tickets_attributes_0_trip_id'><input type='hidden' name='customer[tickets_attributes][" + n + "][trip_id]' value='" + trip_id +"' id='customer_tickets_attributes_0_trip_id'></div>");
      $(this).parent("li").attr("class","seat sleeper selected");
      $(this).parents(".bus-time-booking").find(".selectedSeat").html('');
      $(".ticket").each(function(index){
        var seat = $(this).attr("data-seat");

        $(this).parents(".bus-time-booking").find(".selectedSeat").append(seat + ", ");
      });

      $(this).parents(".bus-time-booking").find(".total").html(fare);
    }
  });
});
