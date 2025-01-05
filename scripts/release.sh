# setup dist/
rm -rf dist
mkdir -p dist/assets

# copy mod files to dist/
cp -r assets/1x dist/assets
cp -r assets/2x dist/assets
cp  kcvanilla.json dist/kcvanilla.json
cp  kcvanilla.lua dist/kcvanilla.lua
cp -r  jokers/ dist/jokers
cp  lovely.toml dist/lovely.toml
cp  readme.md dist/readme.md

# copy dist/ to Mods/
rm -rf ~/AppData/Roaming/Balatro/Mods/kcvanilla
cp -r dist ~/AppData/Roaming/Balatro/Mods/kcvanilla

# zip dist/
rm -f  kcvanilla-dist.zip
7z a kcvanilla-dist.zip dist