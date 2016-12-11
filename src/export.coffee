
fs = require "fs"
CardGameGenerator = require "card-game-generator"

cardSets = JSON.parse(fs.readFileSync("cards.json", "utf8"))

cgg = new CardGameGenerator {cardSets}

console.log "render cards"
cgg.renderCards
	page: "index.html"
	cardWidth: 240
	cardHeight: 336
	scale: 2
	debug: off
	to: "export/images/"
	(err)->
		throw err if err
		console.log "export Tabletop Simulator save"
		cgg.exportTabletopSimulatorSave
			to: "export/"
			saveName: "Techy Playing Cards"
			imagesURL: "https://raw.githubusercontent.com/1j01/techy-playing-cards/master/images"
			renderedImagesURL: "https://raw.githubusercontent.com/1j01/techy-playing-cards/master/images/export"
			(err)->
				throw err if err
				console.log "export save to Tabletop Simulator's Chest"
				cgg.exportSaveToTabletopSimulatorChest()
				console.log "done"
