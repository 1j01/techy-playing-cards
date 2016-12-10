
fs = require("fs")

suits = ['♣️', '♦️', '♥️', '♠️']
suit_names = ['club', 'diamond', 'heart', 'spade']
ranks = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
rank_names = ['ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king']

card_sets = {}

for variation in ["monochrome", "duochrome", "quadrichrome"]
	card_set = []
	
	for suit, suit_i in suits
		for rank, rank_i in ranks
			card_set.push({
				suit, suit_name: suit_names[suit_i]
				rank, rank_name: rank_names[rank_i]
				value: rank_i + 1
			})

	for suit, suit_i in suits
		card_set.push({
			suit, suit_name: suit_names[suit_i]
			rank: 'JOKER', rank_name: 'JOKER'
			value: 0
		})
	
	card_sets[variation] = card_set


fs.writeFile "cards.json", JSON.stringify(card_sets, null, "\t"), "utf8", (err)->
	throw err if err
	console.log "Wrote cards.json"
