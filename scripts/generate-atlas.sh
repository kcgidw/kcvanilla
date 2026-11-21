# convert joker sprites in assets/originals to 2x/ and 1x/ atlases
aseprite -b assets/originals/**.png --sheet assets/2x/jokeratlas.png
aseprite -b assets/2x/jokeratlas.png --scale 0.5 --save-as assets/1x/jokeratlas.png