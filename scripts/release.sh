# if release/ doesn't exist, create it
if [ ! -d "release" ]; then
  mkdir release
fi

# copy only relevant mod files to kcvanilla-dist/
rm -rf release/kcvanilla-dist
mkdir -p release/kcvanilla-dist
cp -r assets/1x release/kcvanilla-dist/assets
cp -r assets/2x release/kcvanilla-dist/assets
cp -r jokers/ release/kcvanilla-dist/jokers
cp -r localization/ release/kcvanilla-dist/localization
cp  kcvanilla.json release/kcvanilla-dist/kcvanilla.json
cp  kcvanilla.lua release/kcvanilla-dist/kcvanilla.lua
cp  lovely.toml release/kcvanilla-dist/lovely.toml
cp  readme.md release/kcvanilla-dist/readme.md
cp  manifest.json release/kcvanilla-dist/manifest.json
cp  icon.png release/kcvanilla-dist/icon.png

# copy kcvanilla-dist/ to Mods/
rm -rf ~/AppData/Roaming/Balatro/Mods/kcvanilla
cp -r release/kcvanilla-dist ~/AppData/Roaming/Balatro/Mods/kcvanilla

# copy kcvanilla-dist/ to thunderstore mods/
rm -rf ~/AppData/Roaming/r2modmanPlus-local/Balatro/profiles/Default/mods/kcvanilla
cp -r release/kcvanilla-dist ~/AppData/Roaming/r2modmanPlus-local/Balatro/profiles/Default/mods/kcvanilla

# zip
rm -f release/kcvanilla-dist.zip
(cd release/kcvanilla-dist && 7z a ../kcvanilla-dist.zip *)