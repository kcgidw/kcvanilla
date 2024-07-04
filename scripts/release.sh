rm -rf dist \
&& mkdir -p dist/assets \
&& cp -r assets/1x dist/assets \
&& cp -r assets/2x dist/assets \
&& cp  kcvanilla.lua dist/kcvanilla.lua \
&& rm -rf ~/AppData/Roaming/Balatro/Mods/kcvanilla \
&& cp -r dist ~/AppData/Roaming/Balatro/Mods/kcvanilla