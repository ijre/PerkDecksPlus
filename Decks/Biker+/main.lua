BikerP = BikerP or { }
BikerP.Helpers = BikerP.Helpers or class(BikerP)

function BikerP:GetEnabled()
  return DecksP and DecksP.Settings.BikerP
end

function BikerP.Helpers:IsUsingDeck(tier)
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
    return checkVal("wild_health_amount")
  elseif tier == 3 then
    return checkVal("less_health_wild_armor")
  elseif tier == 5 then
    return checkVal("less_health_wild_cooldown")
  elseif tier == 7 then
    return checkVal("less_armor_wild_health")
  elseif tier == 9 then
    return checkVal("less_armor_wild_cooldown")
  else
    return false
  end
end