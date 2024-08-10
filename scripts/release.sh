rm -rf dist \
&& mkdir -p dist/assets \
&& cp -r assets/1x dist/assets \
&& cp -r assets/2x dist/assets \
&& cp  kcvanilla.lua dist/kcvanilla.lua \
&& cp -r  jokers/ dist/jokers \
&& cp  lovely.toml dist/lovely.toml \
&& cp  readme.md dist/readme.md \
&& rm -rf ~/AppData/Roaming/Balatro/Mods/kcvanilla \
&& cp -r dist ~/AppData/Roaming/Balatro/Mods/kcvanilla \
&& rm -f  kcvanilla-dist.zip \
&& 7z a kcvanilla-dist.zip dist