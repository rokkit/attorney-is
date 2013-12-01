jQuery ->
  $("#invite").submit (e) ->
    e.preventDefault()
    if $("#user_phone").val() and $("#user_register_number").val()
      $("#user_phone").val $("#user_phone").val().replace(/\s+/g, '')
      $("#user_register_number").val $("#user_register_number").val().replace(/\s+/g, '')
    @submit()


jQuery ->
  $("#users_base_index").dataTable
      sPaginationType: "bootstrap"
      bJQueryUI: false
      bProcessing: true
      bServerSide: true
      sAjaxSource: $('#users_base_index').data('source')
      oLanguage:
          sProcessing: "Подождите..."
          sLengthMenu: "Показать _MENU_ записей"
          sZeroRecords: "Записи отсутствуют."
          sInfo: "Записи с _START_ до _END_ из _TOTAL_ записей"
          sInfoEmpty: "Записи с 0 до 0 из 0 записей"
          sInfoFiltered: "(отфильтровано из _MAX_ записей)"
          sInfoPostFix: ""
          sSearch: "Поиск:"
          sUrl: ""
          oPaginate:
            sFirst: "Первая"
            sPrevious: "Предыдущая"
            sNext: "Следующая"
            sLast: "Последняя"
          oAria:
            sSortAscending: ": активировать для сортировки столбца по возрастанию"
            sSortDescending: ": активировать для сортировки столбцов по убыванию"
jQuery ->
  $('.users-table').dataTable
        aoColumnDefs:[{bSortable: false, aTargets:[4]}]
        bPaginate: false
        oLanguage:
            sProcessing: "Подождите..."
            sLengthMenu: "Показать _MENU_ записей"
            sZeroRecords: "Записи отсутствуют."
            sInfo: "Записи с _START_ до _END_ из _TOTAL_ записей"
            sInfoEmpty: "Записи с 0 до 0 из 0 записей"
            sInfoFiltered: "(отфильтровано из _MAX_ записей)"
            sInfoPostFix: ""
            sSearch: "Поиск:"
            sUrl: ""
            oPaginate:
              sFirst: "Первая"
              sPrevious: "Предыдущая"
              sNext: "Следующая"
              sLast: "Последняя"
            oAria:
              sSortAscending: ": активировать для сортировки столбца по возрастанию"
              sSortDescending: ": активировать для сортировки столбцов по убыванию"


jQuery ->
  $('.best_in_place').best_in_place()
  
jQuery ->
  $('#search_register_number').bind 'railsAutocomplete.select', (event, data) ->
    console.log(data.item.id)
    $("#founded_attorney a").text "#{data.item.label}"
    $("#founded_attorney a").attr 'href', "/users/#{data.item.id}/manage_abilities"
    $("#founded_attorney_common_link").attr 'href', "/users/#{data.item.id}/manage_abilities"
    
  $('#search_lastname').bind 'railsAutocomplete.select', (event, data) ->
    console.log(data.item.id)
    $("#founded_attorney a").text "#{data.item.label}"
    $("#founded_attorney a").attr 'href', "/users/#{data.item.id}/manage_abilities"
    $("#founded_attorney_common_link").attr 'href', "/users/#{data.item.id}/manage_abilities"
    
