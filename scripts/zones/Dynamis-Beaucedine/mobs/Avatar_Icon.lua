-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Avatar Icon
-- Map Position: http://images1.wikia.nocookie.net/__cb20090312005233/ffxi/images/thumb/b/b6/Bea.jpg/375px-Bea.jpg
-----------------------------------
require("scripts/globals/dynamis");
require("scripts/globals/status");
require("scripts/globals/msg");

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID());
end;

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, beaucedineYagudoList, 1);
end;

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();
    -- Time Bonus: 010 020
    if (mobID == 17326839 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(15);
        mob:addInBattlefieldList();
    elseif (mobID == 17326849 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(15);
        mob:addInBattlefieldList();
    -- HP Bonus: 005 013 018 023 028 030
    elseif (mobID == 17326834 or mobID == 17326842 or mobID == 17326847 or mobID == 17326852 or mobID == 17326857 or mobID == 17326859) then
        player:restoreHP(2000);
        player:messageBasic(dsp.msg.basic.RECOVERS_HP,(player:getMaxHP()-player:getHP()));
    -- MP Bonus: 012 019 022 025 027 106
    elseif (mobID == 17326841 or mobID == 17326848 or mobID == 17326851 or mobID == 17326854 or mobID == 17326856 or mobID == 17326935) then
        player:restoreMP(2000);
        player:messageBasic(dsp.msg.basic.RECOVERS_MP,(player:getMaxMP()-player:getMP()));
    end
end;
