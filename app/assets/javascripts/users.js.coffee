jQuery ->
  $("#invite").submit (e) ->
    console.log "submit"
    e.preventDefault()
    if $("#user_phone").val() and $("#user_register_number").val()
      $("#user_phone").val $("#user_phone").val().replace(/\s+/g, '')
      $("#user_register_number").val $("#user_register_number").val().replace(/\s+/g, '')
    @submit()
