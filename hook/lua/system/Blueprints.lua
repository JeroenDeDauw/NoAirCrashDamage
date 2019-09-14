local function isAirCrashWeapon(weapon)
    return weapon.DisplayName == 'Air Crash'
end

local function getWeaponsWithoutAirCrash(bp)
    local goodWeapons = {}

    for _, weapon in bp.Weapon do
        if isAirCrashWeapon(weapon) then
            weapon.Damage = 0
        end

        table.insert(goodWeapons, weapon)
    end

    return goodWeapons
end

local function removeAirCrashFromBlueprint(bp)
    if bp.Weapon ~= nil then
        bp.Weapon = getWeaponsWithoutAirCrash(bp)
    end
end

local oldModBlueprints = ModBlueprints

function ModBlueprints(all_bps)
    oldModBlueprints(all_bps)

    for _, bp in all_bps.Unit do
        removeAirCrashFromBlueprint(bp)
    end
end
