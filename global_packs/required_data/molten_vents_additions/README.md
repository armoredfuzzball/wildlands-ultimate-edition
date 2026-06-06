# TFMG Molten Vents Datapack

A standalone datapack that adds Galena and Bauxite molten vents from Create: The Factory Must Grow to the Molten Vents mod.

## Installation

1. Copy the entire `tfmg_molten_vents_datapack` folder into your world's `datapacks` folder:
   - For single-player: `.minecraft/saves/<world_name>/datapacks/`
   - For servers: `<server>/world/datapacks/`

2. In-game, reload datapacks with `/reload` or restart the world

## Configuration

To enable molten block conversion, you must configure the Molten Vents mod config files:

### 1. Add blocks to custom_blocks.json
Edit `config/molten_vents/custom_blocks.json`:
```json
{"values":["asurine","veridium","crimsite","ochrum","scorchia","scoria","galena","bauxite"]}
```

### 2. Create conductive configs

**config/molten_vents/conductive/galena.json:**
```json
{"values":["tfmg:galena","molten_vents:dormant_molten_galena","molten_vents:active_molten_galena"]}
```

**config/molten_vents/conductive/bauxite.json:**
```json
{"values":["tfmg:bauxite","molten_vents:dormant_molten_bauxite","molten_vents:active_molten_bauxite"]}
```

### 3. Create convertible configs

**config/molten_vents/convertible/galena.json:**
```json
{"values":["minecraft:lava"]}
```

**config/molten_vents/convertible/bauxite.json:**
```json
{"values":["minecraft:lava"]}
```

## Features

- **Galena Vents**: Generate on land (depth 80-100) with 1/10 chunk rarity
- **Aquatic Galena Vents**: Generate underwater (depth 20-35) with 1/1000 chunk rarity
- **Bauxite Vents**: Generate on land (depth 80-100) with 1/10 chunk rarity
- **Aquatic Bauxite Vents**: Generate underwater (depth 20-35) with 1/1000 chunk rarity

All vents use TFMG's cut and polished block variants for decoration.

## Requirements

- Minecraft 1.21.1
- NeoForge
- Create: Molten Vents mod
- Create: The Factory Must Grow (TFMG) mod

## Notes

- This datapack only adds worldgen features. The molten block conversion behavior requires config files (see Configuration above).
- Generated structures use tfmg blocks, so TFMG must be installed.
- Works alongside the base Molten Vents features (asurine, veridium, crimsite, etc.)
