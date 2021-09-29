local function LoseHealthGetDodge()
    if not YakuzaP:GetEnabled() or not Utils:IsInHeist() or not managers.player:has_category_upgrade("player", "movement_speed_damage_health_ratio_threshold_multiplier") then
        return 0
    end
    local player = managers.player:local_player()
local current_health = player:character_damage():health_ratio()
local chance = 0

if current_health <= 0.5 then 
    chance = chance+0.05
end
if current_health <= 0.25 then
    chance = chance+0.05
end

return chance


end

local orgcheck = PlayerManager.skill_dodge_chance
function PlayerManager:skill_dodge_chance(running, crouching, on_zipline, override_armor, detection_risk)
    if not YakuzaP:GetEnabled() then
      orgcheck(self, running, crouching, on_zipline, override_armor, detection_risk)
    end

    local player = managers.player and managers.player:local_player()
    local LostHealthDodge = LoseHealthGetDodge()
    if not crouching then 
        return LostHealthDodge + orgcheck(self, running, crouching, on_zipline, override_armor, detection_risk) 
    end

local chance = orgcheck(self, running, crouching, on_zipline, override_armor, detection_risk)    
    if self:has_category_upgrade("player", "armor_regen_damage_health_ratio_multiplier") then
        if not player:movement():current_state()._moving then 
            YakuzaP.resoluteC = true
            chance = chance+0.1
        else YakuzaP.resoluteC = false
        end
    end


    

return chance+LostHealthDodge

end

local orgmulti = PlayerManager.stamina_multiplier 
function PlayerManager:stamina_multiplier()
    local multi = orgmulti(self)

    if self:upgrade_value("player", "stamina_multiplier", 0) ~= 0
    and self:has_category_upgrade("player", "armor_regen_damage_health_ratio_multiplier") then
        multi = multi*1.5
    end

    return multi

end
