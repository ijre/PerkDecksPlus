TagTeamP = TagTeamP or {}

function TagTeamP:GetEnabled()
  return DecksP and DecksP.Settings.TagTeamP
end


function TagTeamP:IsUsingDeck(tier)
  if not self:GetEnabled() or not managers.player then
    return false end

  local function checkVal(upgrade)
    local upgradeVal = managers.player:upgrade_value("player", upgrade)

    if type(upgradeVal) == "table" then
      return true
    elseif type(upgradeVal) == "number" then
      return upgradeVal > 0
    else
      return false
    end
  end

  if tier == 1 or not tier or tier % 2 ~= 1 or (type(tier) ~= "number" and tostring(tier) == "1") then
    return checkVal("player_armor_regen_damage_health_ratio_multiplier_1")
  elseif tier == 3 then
    return checkVal("player_movement_speed_damage_health_ratio_multiplier")
  elseif tier == 5 then
    return checkVal("player_armor_regen_damage_health_ratio_multiplier_2")
  elseif tier == 7 then
    return checkVal("player_armor_regen_damage_health_ratio_multiplier_3")
  elseif tier == 9 then
    return checkVal("player_movement_speed_damage_health_ratio_threshold_multiplier")
  else
    return false
  end
end

-- local player_armor = managers.blackmarket:equipped_armor(data.works_with_armor_kit, true)
--if not table.contains(data.armors_allowed or {}, player_armor) then\nreturn\nend