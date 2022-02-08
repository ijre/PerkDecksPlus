CrewChiefP = CrewChiefP or { }
CrewChiefP.Helpers = CrewChiefP.Helpers or class(CrewChiefP)

function CrewChiefP:GetEnabled()
  return DecksP and DecksP.Settings.CrewChiefP
end

function CrewChiefP.Helpers:IsUsingDeck(tier)
  if not self.super:GetEnabled() or not managers.player then
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
    return checkVal("team_damage_reduction_1")
  elseif tier == 3 then
    return checkVal("team_passive_stamina_multiplier_1")
  elseif tier == 5 then
    return checkVal("team_passive_health_multiplier")
  elseif tier == 7 then
    return checkVal("team_passive_armor_multiplier")
  elseif tier == 9 then
    return checkVal("team_hostage_health_multiplier")
  else
    return false
  end
end