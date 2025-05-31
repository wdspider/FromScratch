local function requireGameTypes()
    local gt = {}

    gt.Bots = {}
    gt.Bots.AnyBot = "Worker"

    gt.Buildings = {}
    gt.Buildings.BrickHouse = "BrickHut"
    gt.Buildings.Hut = "Hut"
    gt.Buildings.LogCabin = "LogCabin"
    gt.Buildings.Mansion = "Mansion"
    gt.Buildings.StoneCottage = "StoneCottage"

    gt.Items = {}
    gt.Items.AppleTree = "TreeApple"
    gt.Items.AsterSeeds = "FlowerSeeds01"
    gt.Items.Bees = "BeesNest"
    gt.Items.Berries = "Berries"
    gt.Items.BerriesBush = "Bush"
    gt.Items.Bullrush = "Bullrushes"
    gt.Items.ChamomileSeeds = "FlowerSeeds07"
    gt.Items.CeralCrop = "CropWheat"
    gt.Items.Chicken = "AnimalChicken"
    gt.Items.Clay = "Clay"
    gt.Items.CottonCrop = "CropCotton"
    gt.Items.Cow = "AnimalCow"
    gt.Items.Crank = "Crank"
    gt.Items.DelphiniumSeeds = "FlowerSeeds03"
    gt.Items.GearCrude = "CogCrude"
    gt.Items.GladioliSeeds = "FlowerSeeds06"
    gt.Items.Grain = "WheatSeed"
    gt.Items.Grass = "Grass"
    gt.Items.Log = "Log"
    gt.Items.HardRockMass = "TallBoulder"
    gt.Items.MetalPole = "MetalPoleCrude"
    gt.Items.MetalPlate = "MetalPlateCrude"
    gt.Items.Mushroom = "Mushroom"
    gt.Items.Plank = "Plank"
    gt.Items.Pole = "Pole"
    gt.Items.PrimroseSeeds = "FlowerSeeds04"
    gt.Items.PumpkinCrop = "CropPumpkin"
    gt.Items.Rivets = "Rivets"
    gt.Items.RoseSeeds = "FlowerSeeds05"
    gt.Items.RoughStoneBlock = "StoneBlockCrude"
    gt.Items.Sand = "Sand"
    gt.Items.Seed = "TreeSeed"
    gt.Items.Sheep = "AnimalSheep"
    gt.Items.Soil = "Soil"
    gt.Items.Stick = "Stick"
    gt.Items.Stone = "Rock"
    gt.Items.Straw = "Straw"
    gt.Items.Tree = "TreePine"
    gt.Items.TulipSeeds = "FlowerSeeds02"
    gt.Items.Turf = "Turf"
    gt.Items.Water = "Water"
    gt.Items.Weeds = "Weed"
    gt.Items.WheelGood = "Wheel"
    gt.Items.WildFlowers = "FlowerWild"

    gt.Tiles = {}
    gt.Tiles.Clay = "ClaySoil"
    gt.Tiles.Coal = "CoalSoil"
    gt.Tiles.Metal = "IronSoil"
    gt.Tiles.Sand = "Sand"
    gt.Tiles.SeaWaterDeep = "SeaWaterDeep"
    gt.Tiles.SeaWaterShallow = "SeaWaterShallow"
    gt.Tiles.Stone = "StoneSoil"
    gt.Tiles.Soil = "Soil"
    gt.Tiles.Swamp = "Swamp"
    gt.Tiles.Tilled = "SoilTilled"
    gt.Tiles.Turf = "Empty"
    gt.Tiles.WaterDeep = "WaterDeep"
    gt.Tiles.WaterShallow = "WaterShallow"

    gt.Tools = {}
    gt.Tools.BucketCrude = "ToolBucketCrude"
    gt.Tools.Mallet = "ToolMallet"
    gt.Tools.PickCrude = "ToolPickStone"
    gt.Tools.Pick = "ToolPick"
    gt.Tools.Shears = "ToolShears"
    gt.Tools.ScytheCrude = "ToolScytheStone"

    gt.Variables = {}
    gt.Variables.Durability = "MaxUsage"
    gt.Variables.PowerUse = "LinkedEnergy"
    gt.Variables.RequireFloors = "Floors"
    gt.Variables.RequireWalls = "Walls"
    gt.Variables.Tier = "Tier"
    gt.Variables.TurfChance = "TurfChance"
    gt.Variables.Unlocked = "Unlocked"

    return gt
end
local GameTypes = requireGameTypes()

local function requireEnums()
    local e = {}

    e.Difficulty = {}
    e.Difficulty.Easy = 1
    e.Difficulty.Medium = 2
    e.Difficulty.Hard = 3

    return e
end
local Enums = requireEnums()

local function requireExposedVariables()
    local ev = {}

    ev.Difficulty = {}
    ev.Difficulty.Name = "Difficulty (1 - Easy, 2 - Medium, 3 - Hard)"
    ev.Difficulty.DefaultValue = Enums.Difficulty.Easy
    ev.Difficulty.CurrentValue = ev.Difficulty.DefaultValue
    ev.Difficulty.Callback = function(newValue, variableName)
        ev.Difficulty.CurrentValue = math.floor(newValue)
    end

    ev.SpawnBot = {}
    ev.SpawnBot.Name = "Include buddy?"
    ev.SpawnBot.DefaultValue = false
    ev.SpawnBot.CurrentValue = ev.SpawnBot.DefaultValue
    ev.SpawnBot.Callback = function(newValue, variableName)
        ev.SpawnBot.CurrentValue = newValue
    end

    ev.WandDurability = {}
    ev.WandDurability.Name = "Wand Durability (Number of uses)"
    ev.WandDurability.DefaultValue = 1
    ev.WandDurability.CurrentValue = ev.WandDurability.DefaultValue
    ev.WandDurability.Callback = function(newValue, variableName)
        ev.WandDurability.CurrentValue = math.floor(newValue)
    end

    ev.WaterWandDurability = {}
    ev.WaterWandDurability.Name = "Water Wand Durability (Number of uses)"
    ev.WaterWandDurability.DefaultValue = 10
    ev.WaterWandDurability.CurrentValue = ev.WaterWandDurability.DefaultValue
    ev.WaterWandDurability.Callback = function(newValue, variableName)
        ev.WaterWandDurability.CurrentValue = math.floor(newValue)
    end

    ev.Set = function()
        ModBase.ExposeVariable(
            ev.Difficulty.Name,
            ev.Difficulty.DefaultValue,
            ev.Difficulty.Callback,
            Enums.Difficulty.Easy,
            Enums.Difficulty.Hard
        )

        ModBase.ExposeVariable(ev.SpawnBot.Name, ev.SpawnBot.DefaultValue, ev.SpawnBot.Callback)

        ModBase.ExposeVariable(ev.WandDurability.Name, ev.WandDurability.DefaultValue, ev.WandDurability.Callback, 1, 100)
        ModBase.ExposeVariable(
            ev.WaterWandDurability.Name,
            ev.WaterWandDurability.DefaultValue,
            ev.WaterWandDurability.Callback,
            1,
            100
        )
    end

    return ev
end
local ExposedVariables = requireExposedVariables()

local function requireTools()
    local t = {}

    t.Names = {}
    t.Names.AppleWand = "Apple Wand"
    t.Names.BeesWand = "Bees Wand"
    t.Names.BerriesWand = "Berries Wand"
    t.Names.BullrushWand = "Bullrush Wand"
    t.Names.CeralWand = "Ceral Wand"
    t.Names.ChickenWand = "Chicken Wand"
    t.Names.ClayWand = "Clay Wand"
    t.Names.CoalWand = "Coal Wand"
    t.Names.CottonWand = "Cotton Wand"
    t.Names.CowWand = "Cow Wand"
    t.Names.DeepSeaWaterWand = "Deep Sea Water Wand"
    t.Names.DeepWaterWand = "Deep Water Wand"
    t.Names.FlowersWand = "Wild Flowers Wand"
    t.Names.GrassWand = "Grass Wand"
    t.Names.HardRockMassWand = "Hard Rock Mass Wand"
    t.Names.MetalWand = "Metal Wand"
    t.Names.MushroomWand = "Mushroom Wand"
    t.Names.PumpkinWand = "Pumpkin Wand"
    t.Names.SandWand = "Sand Wand"
    t.Names.SeaWaterWand = "Sea Water Wand"
    t.Names.SheepWand = "Sheep Wand"
    t.Names.StoneWand = "Stone Wand"
    t.Names.TurfWand = "Turf Wand"
    t.Names.WaterWand = "Water Wand"
    t.Names.WeedsWand = "Weeds Wand"

    local callbacks = {}
    callbacks.AppleWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.Turf)
        ModBase.SpawnItem(GameTypes.Items.AppleTree, x, y)
    end
    callbacks.BeesWand = function(uniqueID, x, y)
        -- Seems to be a required param (135.15)
    end
    callbacks.BerriesWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.Turf)
        ModBase.SpawnItem(GameTypes.Items.BerriesBush, x, y)
    end
    callbacks.BullrushWand = function(uniqueID, x, y)
        -- Seems to be a required param (135.15)
    end
    callbacks.CeralWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.Soil)
        ModBase.SpawnItem(GameTypes.Items.CeralCrop, x, y)
    end
    callbacks.ChickenWand = function(uniqueID, x, y)
        -- Seems to be a required param (135.15)
    end
    callbacks.ClayWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.Clay)
    end
    callbacks.CoalWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.Coal)
    end
    callbacks.CottonWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.Soil)
        ModBase.SpawnItem(GameTypes.Items.CottonCrop, x, y)
    end
    callbacks.CowWand = function(uniqueID, x, y)
        -- Seems to be a required param (135.15)
    end
    callbacks.DeepSeaWaterWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.SeaWaterDeep)
    end
    callbacks.DeepWaterWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.WaterDeep)
    end
    callbacks.FlowersWand = function(uniqueID, x, y)
        ModBase.SpawnItem(GameTypes.Items.WildFlowers, x, y)
    end
    callbacks.GrassWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.Turf)
        ModBase.SpawnItem(GameTypes.Items.Grass, x, y)
    end
    callbacks.HardRockMassWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.Turf)
        ModBase.SpawnItem(GameTypes.Items.HardRockMass, x, y)
    end
    callbacks.MetalWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.Metal)
    end
    callbacks.MushroomWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.Soil)
        ModBase.SpawnItem(GameTypes.Items.Mushroom, x, y)
    end
    callbacks.PumpkinWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.Soil)
        ModBase.SpawnItem(GameTypes.Items.PumpkinCrop, x, y)
    end
    callbacks.SandWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.Sand)
    end
    callbacks.SeaWaterWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.SeaWaterShallow)
    end
    callbacks.SheepWand = function(uniqueID, x, y)
        -- Seems to be a required param (135.15)
    end
    callbacks.StoneWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.Stone)
    end
    callbacks.TurfWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.Turf)
    end
    callbacks.WaterWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.WaterShallow)
    end
    callbacks.WeedsWand = function(uniqueID, x, y)
        ModTiles.SetTile(x, y, GameTypes.Tiles.Soil)
        ModBase.SpawnItem(GameTypes.Items.Weeds, x, y)
    end

    t.Create = function()
        ModTool.CreateTool(
            t.Names.WaterWand,
            { GameTypes.Tools.BucketCrude, GameTypes.Items.Turf },
            { 1, 3 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Tools/ToolBucketMetal",
            false,
            callbacks.WaterWand,
            false
        )

        ModTool.CreateTool(
            t.Names.AppleWand,
            { t.Names.BerriesWand },
            { 1 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Crops/TreeApple",
            false,
            callbacks.AppleWand,
            false
        )

        ModTool.CreateTool(
            t.Names.BeesWand,
            { t.Names.ChickenWand },
            { 1 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            { GameTypes.Items.Bees },
            { 1 },
            1.0,
            "Models/Other/BeesNest",
            false,
            callbacks.BeesWand,
            false
        )

        ModTool.CreateTool(
            t.Names.BerriesWand,
            { GameTypes.Items.Stone, GameTypes.Items.Turf, GameTypes.Items.Water },
            { 1, 3, 3 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Crops/Bush",
            false,
            callbacks.BerriesWand,
            false
        )

        ModTool.CreateTool(
            t.Names.BullrushWand,
            { t.Names.CottonWand },
            { 1 },
            {},
            { GameTypes.Tiles.Swamp },
            { GameTypes.Items.Bullrush },
            { 1 },
            1.0,
            "Models/Crops/Bullrushes",
            false,
            callbacks.BullrushWand,
            false
        )

        ModTool.CreateTool(
            t.Names.CeralWand,
            { GameTypes.Tools.ScytheCrude, GameTypes.Items.Turf, GameTypes.Items.Water },
            { 1, 3, 3 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Crops/CropWheat",
            false,
            callbacks.CeralWand,
            false
        )

        ModTool.CreateTool(
            t.Names.ChickenWand,
            { GameTypes.Items.Grain, GameTypes.Items.Soil },
            { 5, 2 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            { GameTypes.Items.Chicken },
            { 1 },
            1.0,
            "Models/Animals/AnimalChicken",
            false,
            callbacks.ChickenWand,
            false
        )

        ModTool.CreateTool(
            t.Names.ClayWand,
            { GameTypes.Tools.BucketCrude, GameTypes.Items.Sand, GameTypes.Items.Water },
            { 1, 3, 3 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Special/Mortar",
            false,
            callbacks.ClayWand,
            false
        )

        ModTool.CreateTool(
            t.Names.CoalWand,
            { GameTypes.Tools.Pick, GameTypes.Items.MetalPole, GameTypes.Items.Rivets },
            { 1, 1, 4 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Other/Dirt",
            false,
            callbacks.CoalWand,
            false
        )

        ModTool.CreateTool(
            t.Names.CottonWand,
            { GameTypes.Tools.ScytheCrude, GameTypes.Items.Grain, GameTypes.Items.Water },
            { 1, 5, 5 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Crops/CropCotton",
            false,
            callbacks.CottonWand,
            false
        )

        ModTool.CreateTool(
            t.Names.CowWand,
            { GameTypes.Items.Straw, GameTypes.Items.Turf, GameTypes.Items.Water },
            { 4, 2, 3 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            { GameTypes.Items.Cow },
            { 1 },
            1.0,
            "Models/Animals/AnimalCow",
            false,
            callbacks.CowWand,
            false
        )

        ModTool.CreateTool(
            t.Names.DeepWaterWand,
            { t.Names.WaterWand },
            { 1 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf, GameTypes.Tiles.WaterShallow, GameTypes.Tiles.Swamp },
            {},
            {},
            1.0,
            "Models/Tools/ToolBucketMetal",
            false,
            callbacks.DeepWaterWand,
            false
        )

        ModTool.CreateTool(
            t.Names.FlowersWand,
            { t.Names.BeesWand, t.Names.GrassWand },
            { 1, 1 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Tilled, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Crops/Flower01",
            false,
            callbacks.FlowersWand,
            false
        )

        ModTool.CreateTool(
            t.Names.GrassWand,
            { GameTypes.Tools.ScytheCrude, GameTypes.Items.Turf, GameTypes.Items.Water },
            { 1, 5, 5 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Crops/Grass",
            false,
            callbacks.GrassWand,
            false
        )

        ModTool.CreateTool(
            t.Names.HardRockMassWand,
            { t.Names.StoneWand, GameTypes.Items.Stone },
            { 1, 10 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Parts/Stone/StoneBlockCrude",
            false,
            callbacks.HardRockMassWand,
            false
        )

        ModTool.CreateTool(
            t.Names.MetalWand,
            { GameTypes.Tools.PickCrude, GameTypes.Items.Stone, GameTypes.Items.RoughStoneBlock },
            { 1, 5, 3 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Tools/ToolPick",
            false,
            callbacks.MetalWand,
            false
        )

        ModTool.CreateTool(
            t.Names.MushroomWand,
            { t.Names.BerriesWand },
            { 1 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Crops/Mushroom",
            false,
            callbacks.MushroomWand,
            false
        )

        ModTool.CreateTool(
            t.Names.PumpkinWand,
            { t.Names.BerriesWand },
            { 1 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Crops/CropPumpkin",
            false,
            callbacks.PumpkinWand,
            false
        )

        ModTool.CreateTool(
            t.Names.SandWand,
            { GameTypes.Tools.BucketCrude, GameTypes.Tools.Mallet, GameTypes.Items.Stone },
            { 1, 1, 4 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Special/Sand",
            false,
            callbacks.SandWand,
            false
        )

        ModTool.CreateTool(
            t.Names.SeaWaterWand,
            { t.Names.WaterWand },
            { 1 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Tools/ToolBucketMetal",
            false,
            callbacks.SeaWaterWand,
            false
        )

        ModTool.CreateTool(
            t.Names.DeepSeaWaterWand,
            { t.Names.SeaWaterWand },
            { 1 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Tools/ToolBucketMetal",
            false,
            callbacks.DeepSeaWaterWand,
            false
        )

        ModTool.CreateTool(
            t.Names.SheepWand,
            { t.Names.CowWand },
            { 1 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            { GameTypes.Items.Sheep },
            { 1 },
            1.0,
            "Models/Animals/AnimalSheep",
            false,
            callbacks.SheepWand,
            false
        )

        ModTool.CreateTool(
            t.Names.StoneWand,
            { GameTypes.Tools.PickCrude, GameTypes.Items.Soil, GameTypes.Items.Water },
            { 1, 3, 3 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Tools/ToolPickStone",
            false,
            callbacks.StoneWand,
            false
        )

        ModTool.CreateTool(
            t.Names.TurfWand,
            { t.Names.GrassWand, t.Names.WaterWand },
            { 2, 1 },
            {},
            {
                GameTypes.Tiles.Clay,
                GameTypes.Tiles.Coal,
                GameTypes.Tiles.Metal,
                GameTypes.Tiles.Sand,
                GameTypes.Tiles.Stone
            },
            {},
            {},
            1.0,
            "Models/Other/Turf",
            false,
            callbacks.TurfWand,
            false
        )

        ModTool.CreateTool(
            t.Names.WeedsWand,
            { GameTypes.Items.Soil, GameTypes.Items.Berries, GameTypes.Items.Water },
            { 1, 3, 3 },
            {},
            { GameTypes.Tiles.Soil, GameTypes.Tiles.Turf },
            {},
            {},
            1.0,
            "Models/Crops/Weed",
            false,
            callbacks.WeedsWand,
            false
        )
    end

    t.SetVariables = function()
        ModVariable.SetVariableForObjectAsInt(GameTypes.Tools.BucketCrude, GameTypes.Variables.Unlocked, 1)
        ModVariable.SetVariable(GameTypes.Variables.TurfChance, 60)

        ModVariable.SetVariableForObjectAsInt(t.Names.AppleWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.BerriesWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.DeepSeaWaterWand, GameTypes.Variables.Durability,
            ExposedVariables.WaterWandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.DeepWaterWand, GameTypes.Variables.Durability,
            ExposedVariables.WaterWandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.MushroomWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.PumpkinWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.SeaWaterWand, GameTypes.Variables.Durability,
            ExposedVariables.WaterWandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.StoneWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.TurfWand, GameTypes.Variables.Durability,
            ExposedVariables.WaterWandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.WaterWand, GameTypes.Variables.Durability,
            ExposedVariables.WaterWandDurability.CurrentValue)

        ModVariable.SetVariableForObjectAsInt(t.Names.CeralWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.ClayWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.SandWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.WeedsWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)

        ModVariable.SetVariableForObjectAsInt(t.Names.BullrushWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.CowWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.CottonWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.GrassWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.HardRockMassWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.SheepWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)

        ModVariable.SetVariableForObjectAsInt(t.Names.BeesWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.ChickenWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.FlowersWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
        ModVariable.SetVariableForObjectAsInt(t.Names.MetalWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)

        ModVariable.SetVariableForObjectAsInt(t.Names.CoalWand, GameTypes.Variables.Durability,
            ExposedVariables.WandDurability.CurrentValue)
    end

    return t
end
local Tools = requireTools()

local function requireConverters()
    local c = {}

    c.Names = {}
    c.Names.Materializer = "Materializer"
    c.Names.MaterializerL2 = "Materializer L2"
    c.Names.MaterializerL3 = "Materializer L3"
    c.Names.MaterializerL4 = "Materializer L4"
    c.Names.MaterializerL5 = "Materializer L5"
    c.Names.Regurgitater = "Regurgitater"
    c.Names.RegurgitaterL2 = "Regurgitater L2"
    c.Names.RegurgitaterL3 = "Regurgitater L3"
    c.Names.RegurgitaterL4 = "Regurgitater L4"

    c.AssignRecipes = function()
        ModVariable.SetIngredientsForRecipeSpecific(
            c.Names.Materializer,
            GameTypes.Items.Stone,
            { GameTypes.Items.Turf, GameTypes.Items.Stick },
            { 3, 1 },
            1
        )
        ModVariable.SetIngredientsForRecipeSpecific(
            c.Names.Materializer,
            GameTypes.Tools.BucketCrude,
            { GameTypes.Items.Plank },
            { 4 },
            1
        )

        ModVariable.SetIngredientsForRecipeSpecific(
            c.Names.RegurgitaterL4,
            GameTypes.Items.AsterSeeds,
            { Tools.Names.FlowersWand },
            { 1 },
            1
        )
        ModVariable.SetIngredientsForRecipeSpecific(
            c.Names.RegurgitaterL4,
            GameTypes.Items.ChamomileSeeds,
            { Tools.Names.FlowersWand },
            { 1 },
            1
        )
        ModVariable.SetIngredientsForRecipeSpecific(
            c.Names.RegurgitaterL4,
            GameTypes.Items.DelphiniumSeeds,
            { Tools.Names.FlowersWand },
            { 1 },
            1
        )
        ModVariable.SetIngredientsForRecipeSpecific(
            c.Names.RegurgitaterL4,
            GameTypes.Items.GladioliSeeds,
            { Tools.Names.FlowersWand },
            { 1 },
            1
        )
        ModVariable.SetIngredientsForRecipeSpecific(
            c.Names.RegurgitaterL4,
            GameTypes.Items.PrimroseSeeds,
            { Tools.Names.FlowersWand },
            { 1 },
            1
        )
        ModVariable.SetIngredientsForRecipeSpecific(
            c.Names.RegurgitaterL4,
            GameTypes.Items.RoseSeeds,
            { Tools.Names.FlowersWand },
            { 1 },
            1
        )
        ModVariable.SetIngredientsForRecipeSpecific(
            c.Names.RegurgitaterL4,
            GameTypes.Items.TulipSeeds,
            { Tools.Names.FlowersWand },
            { 1 },
            1
        )

        -- Need to manually readd recipes to the converter due to game bug (140.2)
        ModVariable.AddRecipeToConverter(c.Names.Materializer, Tools.Names.DeepSeaWaterWand)
        ModVariable.AddRecipeToConverter(c.Names.Materializer, Tools.Names.DeepWaterWand)
        ModVariable.AddRecipeToConverter(c.Names.Materializer, Tools.Names.SeaWaterWand)
        ModVariable.AddRecipeToConverter(c.Names.Materializer, Tools.Names.StoneWand)
        ModVariable.AddRecipeToConverter(c.Names.Materializer, Tools.Names.TurfWand)
        ModVariable.AddRecipeToConverter(c.Names.Materializer, Tools.Names.WaterWand)

        ModVariable.AddRecipeToConverter(c.Names.MaterializerL2, Tools.Names.ClayWand)
        ModVariable.AddRecipeToConverter(c.Names.MaterializerL2, Tools.Names.SandWand)

        ModVariable.AddRecipeToConverter(c.Names.MaterializerL3, Tools.Names.HardRockMassWand)

        ModVariable.AddRecipeToConverter(c.Names.MaterializerL4, Tools.Names.MetalWand)

        ModVariable.AddRecipeToConverter(c.Names.MaterializerL5, Tools.Names.CoalWand)

        ModVariable.AddRecipeToConverter(c.Names.Regurgitater, Tools.Names.AppleWand)
        ModVariable.AddRecipeToConverter(c.Names.Regurgitater, Tools.Names.BerriesWand)
        ModVariable.AddRecipeToConverter(c.Names.Regurgitater, Tools.Names.MushroomWand)
        ModVariable.AddRecipeToConverter(c.Names.Regurgitater, Tools.Names.PumpkinWand)

        ModVariable.AddRecipeToConverter(c.Names.RegurgitaterL2, Tools.Names.CeralWand)
        ModVariable.AddRecipeToConverter(c.Names.RegurgitaterL2, Tools.Names.WeedsWand)

        ModVariable.AddRecipeToConverter(c.Names.RegurgitaterL3, Tools.Names.BullrushWand)
        ModVariable.AddRecipeToConverter(c.Names.RegurgitaterL3, Tools.Names.CottonWand)
        ModVariable.AddRecipeToConverter(c.Names.RegurgitaterL3, Tools.Names.CowWand)
        ModVariable.AddRecipeToConverter(c.Names.RegurgitaterL3, Tools.Names.GrassWand)
        ModVariable.AddRecipeToConverter(c.Names.RegurgitaterL3, Tools.Names.SheepWand)

        ModVariable.AddRecipeToConverter(c.Names.RegurgitaterL4, Tools.Names.BeesWand)
        ModVariable.AddRecipeToConverter(c.Names.RegurgitaterL4, Tools.Names.ChickenWand)
        ModVariable.AddRecipeToConverter(c.Names.RegurgitaterL4, Tools.Names.FlowersWand)
    end

    c.Create = function()
        ModConverter.CreateConverter(
            c.Names.Materializer,
            {
                GameTypes.Items.Stone,
                Tools.Names.DeepSeaWaterWand,
                Tools.Names.DeepWaterWand,
                Tools.Names.SeaWaterWand,
                Tools.Names.StoneWand,
                Tools.Names.TurfWand,
                Tools.Names.WaterWand
            },
            { GameTypes.Items.Log, GameTypes.Items.Plank, GameTypes.Items.Pole },
            { 2, 4, 4 },
            "Models/Other/Gnome4",
            { 0, 0 },
            { 0, 0 },
            { 0, 1 },
            { 1, 0 },
            false
        )
        ModConverter.CreateConverter(
            c.Names.MaterializerL2,
            { Tools.Names.ClayWand, Tools.Names.SandWand },
            { GameTypes.Bots.AnyBot, GameTypes.Items.GearCrude, GameTypes.Items.Stone },
            { 1, 2, 4 },
            "Models/Other/Gnome4",
            { 0, 0 },
            { 0, 0 },
            { 0, 1 },
            { 1, 0 },
            false
        )
        ModConverter.CreateConverter(
            c.Names.MaterializerL3,
            { Tools.Names.HardRockMassWand },
            { GameTypes.Bots.AnyBot, GameTypes.Items.Clay, GameTypes.Items.Sand },
            { 1, 4, 4 },
            "Models/Other/Gnome4",
            { 0, 0 },
            { 0, 0 },
            { 0, 1 },
            { 1, 0 },
            false
        )
        ModConverter.CreateConverter(
            c.Names.MaterializerL4,
            { Tools.Names.MetalWand },
            { GameTypes.Bots.AnyBot, GameTypes.Items.Crank, GameTypes.Items.WheelGood },
            { 1, 2, 4 },
            "Models/Other/Gnome4",
            { 0, 0 },
            { 0, 0 },
            { 0, 1 },
            { 1, 0 },
            false
        )
        ModConverter.CreateConverter(
            c.Names.MaterializerL5,
            { Tools.Names.CoalWand },
            { GameTypes.Bots.AnyBot, GameTypes.Items.MetalPlate, GameTypes.Items.MetalPole, GameTypes.Items.Rivets },
            { 1, 2, 4, 4 },
            "Models/Other/Gnome4",
            { 0, 0 },
            { 0, 0 },
            { 0, 1 },
            { 1, 0 },
            false
        )

        ModConverter.CreateConverter(
            c.Names.Regurgitater,
            { Tools.Names.AppleWand, Tools.Names.BerriesWand, Tools.Names.MushroomWand, Tools.Names.PumpkinWand },
            { GameTypes.Items.Log, GameTypes.Items.Plank, GameTypes.Items.Pole, GameTypes.Items.Stone },
            { 2, 4, 4, 2 },
            "Models/Other/Gnome3",
            { 0, 0 },
            { 0, 0 },
            { 0, 1 },
            { 1, 0 },
            false
        )
        ModConverter.CreateConverter(
            c.Names.RegurgitaterL2,
            { Tools.Names.CeralWand, Tools.Names.WeedsWand },
            { GameTypes.Bots.AnyBot, GameTypes.Items.GearCrude, GameTypes.Items.Stone },
            { 1, 2, 4 },
            "Models/Other/Gnome3",
            { 0, 0 },
            { 0, 0 },
            { 0, 1 },
            { 1, 0 },
            false
        )
        ModConverter.CreateConverter(
            c.Names.RegurgitaterL3,
            {
                Tools.Names.BullrushWand,
                Tools.Names.CottonWand,
                Tools.Names.CowWand,
                Tools.Names.GrassWand,
                Tools.Names.SheepWand
            },
            { GameTypes.Bots.AnyBot, GameTypes.Items.Clay, GameTypes.Items.Sand },
            { 1, 4, 4 },
            "Models/Other/Gnome3",
            { 0, 0 },
            { 0, 0 },
            { 0, 1 },
            { 1, 0 },
            false
        )
        ModConverter.CreateConverter(
            c.Names.RegurgitaterL4,
            {
                Tools.Names.BeesWand,
                Tools.Names.ChickenWand,
                Tools.Names.FlowersWand
            },
            { GameTypes.Bots.AnyBot, GameTypes.Items.Crank, GameTypes.Items.WheelGood },
            { 1, 2, 4 },
            "Models/Other/Gnome3",
            { 0, 0 },
            { 0, 0 },
            { 0, 1 },
            { 1, 0 },
            false
        )
    end

    c.SetVariables = function()
        -- Upgrades
        ModVariable.SetVariableForBuildingUpgrade(c.Names.Materializer, c.Names.MaterializerL2)
        ModVariable.SetVariableForBuildingUpgrade(c.Names.MaterializerL2, c.Names.MaterializerL3)
        ModVariable.SetVariableForBuildingUpgrade(c.Names.MaterializerL3, c.Names.MaterializerL4)
        ModVariable.SetVariableForBuildingUpgrade(c.Names.MaterializerL4, c.Names.MaterializerL5)
        ModVariable.SetVariableForBuildingUpgrade(c.Names.Regurgitater, c.Names.RegurgitaterL2)
        ModVariable.SetVariableForBuildingUpgrade(c.Names.RegurgitaterL2, c.Names.RegurgitaterL3)
        ModVariable.SetVariableForBuildingUpgrade(c.Names.RegurgitaterL3, c.Names.RegurgitaterL4)

        ModVariable.SetVariableForObjectAsInt(c.Names.MaterializerL3, GameTypes.Variables.RequireFloors, 1)
        ModVariable.SetVariableForObjectAsInt(c.Names.RegurgitaterL3, GameTypes.Variables.RequireFloors, 1)

        ModVariable.SetVariableForObjectAsInt(c.Names.MaterializerL4, GameTypes.Variables.RequireFloors, 1)
        ModVariable.SetVariableForObjectAsInt(c.Names.MaterializerL4, GameTypes.Variables.RequireWalls, 1)
        ModVariable.SetVariableForObjectAsInt(c.Names.RegurgitaterL4, GameTypes.Variables.RequireFloors, 1)
        ModVariable.SetVariableForObjectAsInt(c.Names.RegurgitaterL4, GameTypes.Variables.RequireWalls, 1)

        ModVariable.SetVariableForObjectAsInt(c.Names.MaterializerL5, GameTypes.Variables.RequireFloors, 1)
        ModVariable.SetVariableForObjectAsInt(c.Names.MaterializerL5, GameTypes.Variables.RequireWalls, 1)
    end

    return c
end
local Converters = requireConverters()

local function requireWorldCreation()
    local wc = {}

    local mapWidth = 0
    local mapHeight = 0

    local centerX = 0
    local centerY = 0

    wc.InitializeWorld = function()
        mapWidth = ModTiles.GetTilesWide() - 1
        mapHeight = ModTiles.GetTilesHigh() - 1

        centerX = math.floor(mapWidth / 2)
        centerY = math.floor(mapHeight / 2)

        ModPlayer.SetPlayerStartLocation(centerX, centerY)

        -- Ensure starting marker is not cleared
        ModTiles.ClearSpecificsInArea(0, 0, mapWidth, mapHeight, false, true, true, true)

        local difficultySpecifics = {
            [Enums.Difficulty.Easy] = function()
                -- Workaround for map in create menu not updating properly (135.17)
                for x = 0, mapWidth, 1 do
                    for y = 0, mapHeight, 1 do
                        ModTiles.SetTile(x, y, GameTypes.Tiles.Turf)
                    end
                end
            end,
            [Enums.Difficulty.Medium] = function()
                for x = 0, mapWidth, 1 do
                    for y = 0, mapHeight, 1 do
                        ModTiles.SetTile(x, y, GameTypes.Tiles.WaterDeep)
                    end
                end

                for x = centerX - 10, centerX + 10, 1 do
                    for y = centerY - 10, centerY + 10, 1 do
                        ModTiles.SetTile(x, y, GameTypes.Tiles.WaterShallow)
                    end
                end

                for x = centerX - 5, centerX + 5, 1 do
                    for y = centerY - 5, centerY + 5, 1 do
                        ModTiles.SetTile(x, y, GameTypes.Tiles.Turf)
                    end
                end
            end,
            [Enums.Difficulty.Hard] = function()
                for x = 0, mapWidth, 1 do
                    for y = 0, mapHeight, 1 do
                        ModTiles.SetTile(x, y, GameTypes.Tiles.WaterDeep)
                    end
                end

                for x = centerX - 1, centerX + 2, 1 do
                    for y = centerY - 1, centerY + 2, 1 do
                        ModTiles.SetTile(x, y, GameTypes.Tiles.WaterShallow)
                    end
                end

                for x = centerX, centerX + 1, 1 do
                    for y = centerY, centerY + 1, 1 do
                        ModTiles.SetTile(x, y, GameTypes.Tiles.Turf)
                    end
                end
            end
        }

        difficultySpecifics[ExposedVariables.Difficulty.CurrentValue]()
    end

    wc.SpawnStartingItems = function()
        if (ExposedVariables.SpawnBot.CurrentValue) then
            ModBot.SpawnBot("Wilson", 2, 2, 2, 4, 4, 4, centerX, centerY)
        end

        local difficultySpecifics = {
            [Enums.Difficulty.Easy] = function()
                for y = centerY + 3, centerY + 13, 1 do
                    ModBase.SpawnItem(GameTypes.Items.Tree, centerX + 3, y)
                end

                local function SpawnRandomItem(itemName)
                    local x
                    local y

                    repeat
                        x = math.random(centerX - 10, centerX + 10)
                        y = math.random(centerY - 10, centerY + 10)
                    until (x ~= centerX + 3 and (y < centerY + 3 or y > centerY + 13))

                    ModBase.SpawnItem(itemName, x, y)
                end

                SpawnRandomItem(GameTypes.Items.Seed)
                SpawnRandomItem(GameTypes.Items.Seed)
                SpawnRandomItem(GameTypes.Items.Seed)
                SpawnRandomItem(GameTypes.Items.Seed)

                SpawnRandomItem(GameTypes.Items.Stone)
                SpawnRandomItem(GameTypes.Items.Stone)
                SpawnRandomItem(GameTypes.Items.Stone)
                SpawnRandomItem(GameTypes.Items.Stone)

                SpawnRandomItem(GameTypes.Items.Stick)
                SpawnRandomItem(GameTypes.Items.Stick)
                SpawnRandomItem(GameTypes.Items.Stick)
                SpawnRandomItem(GameTypes.Items.Stick)
            end,
            [Enums.Difficulty.Medium] = function()
                for y = centerY, centerY + 5, 1 do
                    ModBase.SpawnItem(GameTypes.Items.Tree, centerX + 3, y)
                end

                local function SpawnRandomItem(itemName)
                    local x
                    local y

                    repeat
                        x = math.random(centerX - 10, centerX + 10)
                        y = math.random(centerY - 10, centerY + 10)
                    until (x ~= centerX + 3 and (y < centerY or y > centerY + 5))

                    ModBase.SpawnItem(itemName, x, y)
                end

                SpawnRandomItem(GameTypes.Items.Seed)
                SpawnRandomItem(GameTypes.Items.Seed)
                SpawnRandomItem(GameTypes.Items.Seed)

                SpawnRandomItem(GameTypes.Items.Stone)
                SpawnRandomItem(GameTypes.Items.Stone)
                SpawnRandomItem(GameTypes.Items.Stone)

                SpawnRandomItem(GameTypes.Items.Stick)
                SpawnRandomItem(GameTypes.Items.Stick)
                SpawnRandomItem(GameTypes.Items.Stick)
            end,
            [Enums.Difficulty.Hard] = function()
                ModBase.SpawnItem(GameTypes.Items.Tree, centerX + 1, centerY + 1)

                local function SpawnRandomItem(itemName)
                    local x
                    local y

                    repeat
                        x = math.random(centerX - 1, centerX + 2)
                        y = math.random(centerY - 1, centerY + 2)
                    until (x ~= centerX + 1 and y ~= centerY + 1)

                    ModBase.SpawnItem(itemName, x, y)
                end

                SpawnRandomItem(GameTypes.Items.Log)

                SpawnRandomItem(GameTypes.Tools.Mallet)

                SpawnRandomItem(GameTypes.Items.Seed)
                SpawnRandomItem(GameTypes.Items.Seed)

                SpawnRandomItem(GameTypes.Items.Stone)
                SpawnRandomItem(GameTypes.Items.Stone)
                SpawnRandomItem(GameTypes.Items.Stone)

                SpawnRandomItem(GameTypes.Items.Stick)
                SpawnRandomItem(GameTypes.Items.Stick)
                SpawnRandomItem(GameTypes.Items.Stick)
            end
        }

        difficultySpecifics[ExposedVariables.Difficulty.CurrentValue]()
    end

    return wc
end
local WorldCreation = requireWorldCreation()

-- Exposes variables to Mod Settings
function Expose()
    ExposedVariables.Set()
end

-- Create custom converters / buildings / tools
function Creation()
    Tools.Create()

    Converters.Create()
end

-- Called before loading into world
function BeforeLoad()
    -- Prevent game from spawning minimum number of items
    ModBase.DisableSafety(true)

    Tools.SetVariables()

    Converters.SetVariables()
    Converters.AssignRecipes()
end

-- Called after loading into new world
function AfterLoad_CreatedWorld()
    WorldCreation.InitializeWorld()

    WorldCreation.SpawnStartingItems()
end

-- Called after loading into existing world
function AfterLoad_LoadedWorld()
end

-- Called every frame
function OnUpdate(timeDelta)
end
