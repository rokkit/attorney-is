###
delete link text and move it to title
###

jQuery ->
	$(".actions").find("a").each ->
		$this = $(this)
		text = $this.text()
		$this.attr "title", text
		# $this.empty()
