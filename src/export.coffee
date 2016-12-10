
fs = require "fs"
CardGameGenerator = require "card-game-generator"

cardSets = JSON.parse(fs.readFileSync("cards.json", "utf8"))

cgg = new CardGameGenerator {cardSets}

console.log "render cards"
cgg.renderCards
	page: "index.html"
	cardWidth: 240 + 5 * 2
	cardHeight: 336 + 5 * 2
	scale: 2
	debug: on
	to: "export/images/"
	(err)->
		throw err if err
		console.log "export Tabletop Simulator save"
		cgg.exportTabletopSimulatorSave
			to: "export/"
			saveName: "Techy Playing Cards"
			imagesURL: "https://raw.githubusercontent.com/1j01/techy-playing-cards/gh-pages/images"
			renderedImagesURL: "https://raw.githubusercontent.com/1j01/techy-playing-cards/gh-pages/images/export"
			(err)->
				throw err if err
				console.log "export save to Tabletop Simulator's Chest"
				cgg.exportSaveToTabletopSimulatorChest()
				console.log "done"
