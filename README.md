# [Techy Playing Cards][]

A simple set of playing cards made with [Card Game Generator][]

## Import into [Tabletop Simulator][]

Without installing, you can save [`Techy Playing Cards.json`][] to `%USERPROFILE%\Documents\My Games\Tabletop Simulator\Saves\Chest\`

Then in Tabletop Simulator, go to **Host > Chest > Saved Objects** and find **Techy Playing Cards**.


## Installation

* [Clone the repo][Cloning a repository]
* Install [Node.js][] if you don't have a somewhat recent version
* Open a console in the project directory
* Run `npm install`


## Update cards

`npm run export` will render the cards and export to Tabletop Simulator's Chest.

You can `set PARALLEL_EXPORT=ON` before running `export` to speed it up significantly if it's on a powerful enough machine,
bf it's not powerful enough it might freeze up the entire computer.


[Techy Playing Cards]: http://1j01.github.io/techy-playing-cards/
[`Techy Playing Cards.json`]: https://raw.githubusercontent.com/1j01/techy-playing-cards/master/export/Techy%20Playing%20Cards.json
[Node.js]: https://nodejs.org/en/
[Tabletop Simulator]: http://store.steampowered.com/app/286160/
[Card Game Generator]: https://github.com/1j01/card-game-generator
[Cloning a repository]: https://help.github.com/articles/cloning-a-repository/
