local function isAirCrashWeapon(weapon)
    return weapon.DisplayName == 'Air Crash'
end

local function removeAirCrashFromBlueprint(bp)
    if bp.Weapon ~= nil then
        for _, weapon in bp.Weapon do
            if isAirCrashWeapon(weapon) then
                weapon.Damage = 1
            end
        end
    end
end

local oldModBlueprints = ModBlueprints

function ModBlueprints(all_bps)
    oldModBlueprints(all_bps)

    for _, bp in all_bps.Unit do
        removeAirCrashFromBlueprint(bp)
    end
end
