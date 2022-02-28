KingpinP = KingpinP or
{
  SpeedStacks = 0.0
}

KingpinP.Helpers = KingpinP.Helpers or class(KingpinP)

function KingpinP:GetEnabled()
  return DecksP and DecksP.Settings.KingpinP
end

function KingpinP.Helpers:IsUsingDeck(tier, category)
  if not self.super:GetEnabled() or not managers.player or not managers.player:upgrade_value("temporary", "chico_injector", false) then
    return false end

  if not category or type(category) ~= "string" then
    category = "player"
  end

  local function checkVal(upgrade)
    local upgradeVal = managers.player:upgrade_value(category, upgrade)

    if type(upgradeVal) == "table" then
      return true
    elseif type(upgradeVal) == "number" then
      return upgradeVal > 0
    else
      return managers.player:has_category_upgrade(category, upgrade)
    end
  end

  if tier == 1 or not tier or tier % 2 ~= 1 or (type(tier) ~= "number" and tostring(tier) == "1") then
    return managers.player:upgrade_value("temporary", "chico_injector")
  elseif tier == 3 then
    return checkVal("passive_health_multiplier")
  elseif tier == 5 then
    return checkVal("chico_preferred_target")
  elseif tier == 7 then
    return checkVal("chico_injector_low_health_multiplier")
  elseif tier == 9 then
    return checkVal("passive_loot_drop_multiplier")
  else
    return false
  end
end

function KingpinP.Helpers:IsUsingInjectorAtTier(tier)
  return self:IsUsingDeck(tier) and managers.player:has_activate_temporary_upgrade("temporary", "chico_injector")
end