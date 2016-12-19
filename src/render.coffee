
$cards = $("<main class='cards'/>").appendTo("body")

render_$card = ({back, suit, suit_name, rank, rank_name, value})->
	$card = $("<div class='card'/>")
	
	if back
		$card.addClass("back")
		# $card.html("<div class='center'>")
	else
		$card.addClass(suit_name)
		$card.addClass(rank_name)
		if rank_name in ["jack", "queen", "king"]
			$card.addClass("face-card")
		
		identification_html = "<div class='id'><div class='rank'>#{rank}</div><div class='suit'>#{suit}</div></div>"
		$card.html """
			<div class='header'>
				#{identification_html}
			</div>
			<div class='center'></div>
			<div class='header bottom'>
				#{identification_html}
			</div>
		"""
		
		rows = []
		for div in [3..1]
			if (value / div) is (value // div)
				break
		if div is 1
			div = 3
		added = 0
		while added < value
			if added + div > value
				n = value - added
				# TODO: place in middle sometimes
			else
				n = div
			added += div
			row = (suit for [1..n]).join(", ")
			$card.find(".center").prepend($("<div class='pip-row'>").text(row))
	
	$card

$.getJSON "cards.json", (card_sets)->
	
	export_only = location.hash.replace /#/, ""
	
	for set_name, cards of card_sets when (not export_only) or export_only is set_name
		$section = $("<section>").appendTo($cards)
		$section.addClass(set_name)
		$("<h2>").text(set_name).appendTo($section)
		for card in cards
			render_$card(card).appendTo($section)
		if export_only
			render_$card(back: yes).appendTo($section) for [cards.length...10*7]
	
	if (not export_only) or export_only is "Back"
		$("<h2>").text("Back").appendTo($cards)
		render_$card(back: yes).appendTo($cards)
