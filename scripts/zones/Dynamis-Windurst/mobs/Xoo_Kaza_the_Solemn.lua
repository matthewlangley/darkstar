-----------------------------------
-- Area: Dynamis - Windurst
--  Mob: Xoo Kaza the Solemn
-- Boss Trigger for RDM NM
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------

mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobSpawn(mob)
    mob:setLocalVar("dynamis_currency", 1449)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)

    local bossTrigger = GetServerVariable("[DynaWindurst]Boss_Trigger")

    if bossTrigger == 0 or bossTrigger == 1 or bossTrigger == 4 or bossTrigger == 5 then
        SetServerVariable("[DynaWindurst]Boss_Trigger", bossTrigger + 2)
        SpawnMob(17543586) -- 110
        SpawnMob(17543587) -- 111
    end

    -- If 3 first boss trigger are killed -> pop the last trigger
    if GetServerVariable("[DynaWindurst]Boss_Trigger") == 7 then
        SpawnMob(17543590) -- 114
        SpawnMob(17543591) -- 115
        SpawnMob(17543592) -- 116
        SetServerVariable("[DynaWindurst]Boss_Trigger", 8)
    end

end