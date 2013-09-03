jQuery ->
  $("#invite").submit (e) ->
    e.preventDefault()
    if $("#user_phone").val() and $("#user_register_number").val()
      $("#user_phone").val $("#user_phone").val().replace(/\s+/g, '')
      $("#user_register_number").val $("#user_register_number").val().replace(/\s+/g, '')
    @submit()

jQuery ->
  $('.users-table').dataTable
        "bPaginate": false
jQuery ->
  $('#show-meeting-requests').dataTable(
    aoColumnDefs:[{bSortable: false, aTargets:[0,1,2,3]}]
  ).rowGrouping
            sGroupBy: "year"
            bHideGroupingColumn: false
            sGroupingClass: "info"
