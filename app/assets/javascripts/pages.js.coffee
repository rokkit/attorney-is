change_time =  ->
    console.log("d")
    date = new Date()
    d = $("#time_delimiter")
    h = $("#hour")
    m = $("#minute")
    d.toggleClass("white-delimiter")
    h.html date.getHours()
    m.html date.getMinutes()
jQuery ->

    setInterval change_time, 1000