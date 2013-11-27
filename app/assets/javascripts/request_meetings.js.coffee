###
delete link text and move it to title
###

jQuery ->
	$(".actions").find("a").each ->
		$this = $(this)
		text = $this.text()
		$this.attr "title", text
		# $this.empty()
        
jQuery ->
  $('#show-meeting-requests').dataTable(
    aoColumnDefs:[{bSortable: false, aTargets:[0,1,2,3]}]
    bLengthChange: false
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
          sPrevious: "Предыдущая "
          sNext: "Следующая"
          sLast: "Последняя"
        oAria:
          sSortAscending: ": активировать для сортировки столбца по возрастанию"
          sSortDescending: ": активировать для сортировки столбцов по убыванию"
  ).rowGrouping(
            sGroupBy: "day"
            bHideGroupingColumn: false
            iGroupingColumnIndex: 1
            sGroupingClass: "info").columnFilter aoColumns: [
                                                     null, { type: "text"},{ sSelector: "#periodFilter", type: "date-range", sRangeFormat: "начало периода {from} конец периода {to}" }
                                                 ]
jQuery ->
  $(".hasDatepicker").attr('readonly', true)