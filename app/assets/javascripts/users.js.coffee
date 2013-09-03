jQuery ->
  $("#invite").submit (e) ->
    e.preventDefault()
    if $("#user_phone").val() and $("#user_register_number").val()
      $("#user_phone").val $("#user_phone").val().replace(/\s+/g, '')
      $("#user_register_number").val $("#user_register_number").val().replace(/\s+/g, '')
    @submit()

jQuery ->
  $('.users-table').dataTable
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
  $('#show-meeting-requests').dataTable(
    aoColumnDefs:[{bSortable: false, aTargets:[0,1,2,3]}]
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
  ).rowGrouping
            sGroupBy: "year"
            bHideGroupingColumn: false
            sGroupingClass: "info"

jQuery ->
  $('.best_in_place').best_in_place()
