# [Techy Playing Cards][]

## Installation

* Clone the repo
* Have [Node.js][]
* Open a console in the project directory 
* `npm i`


## Import into [Tabletop Simulator][]

Without installing, you can save [Techy Playing Cards.json][] to `%USERPROFILE%\Documents\My Games\Tabletop Simulator\Saves\Chest\`

If installed, you can just `npm run export-to-tabletop-simulator`

In Tabletop Simulator, go to Host > Chest > Saved Objects and find Card Game.


## Update cards

* `npm run export`
* `npm run export-to-tabletop-simulator`

You can `set PARALLEL_EXPORT=ON` before running `export` to speed it up significantly if it's on a powerful enough machine.
(If it's not powerful enough it might freeze up the entire computer.)


[Techy Playing Cards]: http://1j01.github.io/techy-playing-cards/
[Techy Playing Cards.json]: https://raw.githubusercontent.com/1j01/techy-playing-cards/gh-pages/data/export/Techy%20Playing%20Cards.json
[Node.js]: https://nodejs.org/en/
[Tabletop Simulator]: http://store.steampowered.com/app/286160/
