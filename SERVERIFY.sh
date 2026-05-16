#!/bin/bash

# ask the user if they are sure they want to continue, default to yes
read -p "This will start the server. Are you sure you want to continue? (Y/n) " -n 1 -r
echo    # move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborting."
    exit 1
fi

echo "Removing clientside mods...";

# remove mods from folder
rm -rf ./mods/.connector/;
rm ./mods/threatengl*.jar;
rm ./mods/super_resolution*.jar;
rm ./mods/sodium*.jar;
rm ./mods/reeses-sodium*.jar;
rm ./mods/iris*.jar;
rm ./mods/3dskinlayers*.jar;
rm ./mods/shoulder*.jar;
rm ./mods/Shoulder*.jar;
rm ./mods/screenshot*.jar;
rm ./mods/particle*.jar;
rm ./mods/notenoughanimations*.jar;
rm ./mods/mousetweaks-x*.jar;
rm ./mods/controlling*.jar;
rm ./mods/moreculling*.jar;
rm ./mods/modelfix*.jar;
rm ./mods/libIPN*.jar;
rm ./mods/lambdynamiclights*.jar;
rm ./mods/hiddenrecipebook*.jar;
rm ./mods/gnetum*.jar;
rm ./mods/freecam*.jar;
rm ./mods/forgematica*.jar;
rm ./mods/flyspeed*.jar;
rm ./mods/flerovium*.jar;
rm ./mods/figura*.jar;
rm ./mods/Figura*.jar;
rm ./mods/fallingleaves*.jar;
rm ./mods/fabrishot*.jar;
rm ./mods/entityculling*.jar;
rm ./mods/entity_*_features*.jar;
rm ./mods/enhanced_attack*.jar;
rm ./mods/enchantment-descriptions*.jar;
rm ./mods/dynamicsurroundings*.jar;
rm ./mods/dynamic-fps*.jar;
rm ./mods/cwb-*.jar;
rm ./mods/createbetterfps*.jar;
rm ./mods/continuity*.jar;
rm ./mods/colorwheel*.jar;
rm ./mods/chatanimation*.jar;
rm ./mods/chat_heads*.jar;
rm ./mods/betterbiomeblend*.jar;
rm ./mods/bigcontraptions*.jar;
rm ./mods/betterbeds*.jar;
rm ./mods/athena*.jar;
rm ./mods/acceleratedrendering*.jar;
rm ./mods/TravelersTitles*.jar;
rm ./mods/Searchables*.jar;
rm ./mods/MouseTweaks*.jar;
rm ./mods/InventoryProfilesNext*.jar;
rm ./mods/ImmediatelyFast*.jar;
rm ./mods/Iceberg*.jar;
rm ./mods/GPUTape*.jar;
rm ./mods/Highlighter*.jar;
rm ./mods/CutThrough*.jar;
rm ./mods/Controlling*.jar;
rm ./mods/CleanF3*.jar;
rm ./mods/BetterGrassify*.jar;
rm ./mods/BetterAdvancements*.jar;
rm ./mods/BadOptimizations*.jar;
rm ./mods/AmbientSounds*.jar;
rm ./mods/modmenu*.jar;
rm ./mods/Palladium*.jar;
rm ./mods/Toadlib*.jar;
rm ./mods/EuphoriaPatcher*.jar;
rm ./mods/shut_up_gl_error*.jar;

echo "Server setup complete!";