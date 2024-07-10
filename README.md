# Tournament generator

## Introduction
This program is used to determine what item you like best among a list items; generating a [Round-robin tournament](https://en.wikipedia.org/wiki/Round-robin_tournament). Like so:

![Round-robin](https://upload.wikimedia.org/wikipedia/commons/b/b7/Round-robin_tournament_10teams_en.png)

Similar in concept to a "Tier-list", but only having to decide among 2 items at a time.

## Dependencies
- Racket interpreter

Compiled binaries coming soon? (Maybe)

## Instructions 
Create a `members/` directory where each file is a `.png`.

Then, run the program like so:

```shell
racket main.rkt
```

When the program ends, you'll have a nice bar chart of the results

## Demo video
This demo video shows a use case. In this case, determine which [Smiling Friends](https://en.wikipedia.org/wiki/Smiling_Friends) episode is best (with only a few episodes for brevity).


https://github.com/lima-limon-inc/Tournament-Generator/assets/65001595/c056a322-2f50-4516-a89b-46d3a0dbdfbf


## TODO
(a lot)

- [ ] Clean up the code
	- [ ] Remove repetitive code (possibly with the help of macros)
	- [ ] Use less constant variables (only 1 or 2 AATOW)
- [ ] Make the program receive command line arguments
	- [ ] Determine the members directory with said arguments
- [ ] Make the program a bit prettier
- [ ] Add more TODO items
