---@meta Autonauts

-- ============================================================
-- Autonauts Mod API - Global Object Definitions
-- ============================================================
-- This file provides LuaCATS annotations for the global Mod*
-- objects injected by the Autonauts modding runtime, so that
-- the Lua Language Server (lua-language-server) does not flag
-- them as undefined globals.
-- ============================================================


-- ------------------------------------------------------------
-- ModBase
-- Core mod utilities: spawning items, exposing settings, etc.
-- ------------------------------------------------------------

---@class ModBase
ModBase = {}

---Disable the safety system that enforces a minimum number of
---spawned items in the world.
---@param disable boolean Pass `true` to disable safety checks.
function ModBase.DisableSafety(disable) end

---Spawn an item or entity into the world at the given tile coords.
---@param itemType string The internal game type string for the item.
---@param x integer The X tile coordinate.
---@param y integer The Y tile coordinate.
function ModBase.SpawnItem(itemType, x, y) end

---Expose a configurable variable in the Mod Settings UI.
---@param name string The display name shown in the settings menu.
---@param defaultValue number|boolean The default value for this variable.
---@param callback fun(newValue: number|boolean, variableName: string) Called when the value changes.
---@param minValue? number Optional minimum value (for numeric sliders).
---@param maxValue? number Optional maximum value (for numeric sliders).
function ModBase.ExposeVariable(name, defaultValue, callback, minValue, maxValue) end

---Set the Steam Workshop metadata for this mod.
---@param modName string The internal/short name of the mod.
---@param description string The full workshop description (supports multiline strings).
---@param tags string[] A list of tag strings shown on the Workshop page.
---@param logoFile string Filename of the preview image (e.g. `"Logo.png"`).
function ModBase.SetSteamWorkshopDetails(modName, description, tags, logoFile) end

-- ------------------------------------------------------------
-- ModTiles
-- Tile manipulation and world size queries.
-- ------------------------------------------------------------

---@class ModTiles
ModTiles = {}

---Set the tile type at the given world coordinates.
---@param x integer The X tile coordinate.
---@param y integer The Y tile coordinate.
---@param tileType string The internal tile type string.
function ModTiles.SetTile(x, y, tileType) end

---Get the width of the world in tiles (returns the total count;
---valid indices are 0 to GetTilesWide()-1).
---@return integer width
function ModTiles.GetTilesWide() end

---Get the height of the world in tiles (returns the total count;
---valid indices are 0 to GetTilesHigh()-1).
---@return integer height
function ModTiles.GetTilesHigh() end

---Clear items, bots, buildings, or other specifics in a rectangular area.
---@param x1 integer Left X coordinate (inclusive).
---@param y1 integer Top Y coordinate (inclusive).
---@param x2 integer Right X coordinate (inclusive).
---@param y2 integer Bottom Y coordinate (inclusive).
---@param clearItems boolean Whether to clear items.
---@param clearBots boolean Whether to clear bots.
---@param clearBuildings boolean Whether to clear buildings.
---@param clearOther boolean Whether to clear other world objects.
function ModTiles.ClearSpecificsInArea(x1, y1, x2, y2, clearItems, clearBots, clearBuildings, clearOther) end

-- ------------------------------------------------------------
-- ModTool
-- Custom tool creation.
-- ------------------------------------------------------------

---@class ModTool
ModTool = {}

---Create a custom craftable tool.
---@param name string The display name of the tool.
---@param ingredients string[] List of ingredient type strings required to craft it.
---@param ingredientCounts integer[] Quantities corresponding to each ingredient.
---@param extraIngredients string[] Additional optional ingredient type strings.
---@param validTiles string[] Tile types the tool can be used on.
---@param requiredItems string[] Items that must be present in the world for use (e.g. animals).
---@param requiredItemCounts integer[] Quantities for each required item.
---@param useRange number Radius/range within which the tool operates.
---@param modelPath string Path to the 3D model used to represent this tool.
---@param stackable boolean Whether the tool can be stacked.
---@param callback fun(uniqueID: any, x: integer, y: integer) Called when the tool is used on a tile.
---@param isBuilding boolean Whether this tool creates a building rather than a world item.
function ModTool.CreateTool(name, ingredients, ingredientCounts, extraIngredients, validTiles, requiredItems,
                            requiredItemCounts, useRange, modelPath, stackable, callback, isBuilding)
end

-- ------------------------------------------------------------
-- ModConverter
-- Custom converter/building creation.
-- ------------------------------------------------------------

---@class ModConverter
ModConverter = {}

---Create a custom converter building.
---@param name string The display name of the converter.
---@param acceptedTools string[] Tool names/types this converter accepts as input triggers.
---@param outputItems string[] Item types produced by this converter.
---@param outputCounts integer[] Quantities for each output item.
---@param modelPath string Path to the 3D model for this building.
---@param inputOffset integer[] [x, y] offset for the input slot indicator.
---@param outputOffset integer[] [x, y] offset for the output slot indicator.
---@param botInputOffset integer[] [x, y] offset for the bot input position.
---@param botOutputOffset integer[] [x, y] offset for the bot output position.
---@param requiresPower boolean Whether this converter requires a power source.
function ModConverter.CreateConverter(name, acceptedTools, outputItems, outputCounts, modelPath, inputOffset,
                                      outputOffset, botInputOffset, botOutputOffset, requiresPower)
end

-- ------------------------------------------------------------
-- ModVariable
-- Setting variables on objects, buildings, and recipes.
-- ------------------------------------------------------------

---@class ModVariable
ModVariable = {}

---Set an integer variable on a named object.
---@param objectName string The name of the object/tool/building.
---@param variableName string The internal variable key (e.g. "MaxUsage").
---@param value integer The integer value to set.
function ModVariable.SetVariableForObjectAsInt(objectName, variableName, value) end

---Set a global game variable by name.
---@param variableName string The internal global variable key.
---@param value number|integer The value to assign.
function ModVariable.SetVariable(variableName, value) end

---Set the ingredient requirements for a specific recipe output within a named converter.
---@param converterName string The name of the converter building.
---@param outputItem string The item type string that this recipe produces.
---@param ingredients string[] List of ingredient type strings.
---@param ingredientCounts integer[] Quantities for each ingredient.
---@param outputCount integer How many of the output item are produced.
function ModVariable.SetIngredientsForRecipeSpecific(converterName, outputItem, ingredients, ingredientCounts,
                                                     outputCount)
end

---Add a tool/recipe to a converter's list of accepted inputs.
---@param converterName string The name of the converter building.
---@param toolName string The tool or recipe name to register with the converter.
function ModVariable.AddRecipeToConverter(converterName, toolName) end

---Set the upgrade target for a building, linking it to its next tier.
---@param buildingName string The name of the base building.
---@param upgradeName string The name of the building it upgrades into.
function ModVariable.SetVariableForBuildingUpgrade(buildingName, upgradeName) end

-- ------------------------------------------------------------
-- ModPlayer
-- Player spawn and starting state.
-- ------------------------------------------------------------

---@class ModPlayer
ModPlayer = {}

---Set the tile coordinates where the player spawns at world start.
---@param x integer The X tile coordinate.
---@param y integer The Y tile coordinate.
function ModPlayer.SetPlayerStartLocation(x, y) end

-- ------------------------------------------------------------
-- ModBot
-- Bot spawning.
-- ------------------------------------------------------------

---@class ModBot
ModBot = {}

---Spawn a bot into the world with the given parameters.
---@param name string The bot's display name.
---@param p2 number Unknown parameter (position or config value).
---@param p3 number Unknown parameter.
---@param p4 number Unknown parameter.
---@param p5 number Unknown parameter.
---@param p6 number Unknown parameter.
---@param p7 number Unknown parameter.
---@param x integer The X tile coordinate to spawn at.
---@param y integer The Y tile coordinate to spawn at.
function ModBot.SpawnBot(name, p2, p3, p4, p5, p6, p7, x, y) end
