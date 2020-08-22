
fs = require "fs"
CardGameGenerator = require "card-game-generator"

cardSets = JSON.parse(fs.readFileSync("cards.json", "utf8"))

cgg = new CardGameGenerator {cardSets}

console.log "Render cards..."
cgg.renderCards
	page: "index.html"
	cardWidth: 240
	cardHeight: 336
	scale: 2
	debug: off
	to: "export/images/"
	(err)->
		throw err if err
		console.log "Export Tabletop Simulator save..."
		cgg.exportTabletopSimulatorSave
			to: "export/"
			saveName: "Techy Playing Cards"
			renderedImagesURL: "https://raw.githubusercontent.com/1j01/techy-playing-cards/master/export/images"
			(err)->
				throw err if err
				console.log "Export save to Tabletop Simulator's Chest..."
				try
					cgg.exportSaveToTabletopSimulatorChest()
				catch error
					if error.message.match(/TABLETOP_SIMULATOR_FOLDER/)
						console.error(error.message)
						console.log "Done! (other than exporting to Tabletop Simulator's Chest)"
						return
					else
						throw error
				console.log "Done!"
