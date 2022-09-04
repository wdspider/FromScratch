-- Sets Steam Details for mod
function SteamDetails()
    ModBase.SetSteamWorkshopDetails(
        "FromScratch",
        [[
Version 3.2
Game version 137.14 or higher required
Designed for Colonize game mode
https://github.com/wdspider/FromScratch

A little mod that blanks out the whole map and then spawns a few basic things needed to start base creation.  The mod supports 3 difficulty levels: Easy, Medium, Hard.
You can also choose to start with a buddy, if desired.

Easy sets the whole map to turf; spawns 11 trees; and spawns 4 seeds, sticks, and stones.

Medium sets the whole map to Fresh Water (Deep) except for 441 center tiles: 320 Fresh Water (Shallow) and 121 Turf.  6 trees are spawned with 3 seeds, sticks, and stones.

Hard sets the whole map to Fresh Water (Deep) except for 16 center tiles: 12 Fresh Water (Shallow) and 4 Turf.  1 tree is spawned with 1 log, 1 mallet, 2 seeds, 3 sticks, and 3 stones.

To set difficulty:
Click on the yellow wand on the Main Menu which should bring up the Mod Menu.
In the Mod Menu, click on FromScratch and then the Options button.  This should bring up the Mod Settings window.
Within the Mod Settings window, there is a slider that will allow you to choose 1 through 3.

The Materializer is your source for missing inanimate map objects.
It currently provides:
• Crude Bucket
• Stone
• Deep Sea Water Wand
• Deep Water Wand
• Sea Water Wand
• Stone Wand
• Turf Wand
• Water Wand
• Clay Wand
• Sand Wand
• Hard Rock Mass Wand
• Metal Wand
• Coal Wand

The Regurgitater is your source for missing living map objects.
It currently provides:
• Apple Wand
• Berries Wand
• Mushroom Wand
• Pumpkin Wand
• Ceral Wand
• Weeds Wand
• Bullrush Wand
• Cotton Wand
• Cow Wand
• Grass Wand
• Sheep Wand
• Bees Wand
• Chicken Wand
• Wild Flowers Wand
• Flower Seeds

        ]],
        {
            "toolcompo",
            "difficult",
            "custom map",
            "autoblocks",
            "fun",
            "map",
            "tool",
            "tiles",
            "layout",
            "ground editor",
            "resources",
            "resourceediting"
        },
        "Logo.png"
    )
end
