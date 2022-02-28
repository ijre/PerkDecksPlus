YakuzaP = YakuzaP or {}

function YakuzaP:GetEnabled()
  return DecksP and DecksP.Settings.YakuzaP
end

function YakuzaP:IsUsingDeck(tier)
  if not self:GetEnabled() or not managers.player then
    return false end

  local function checkVal(upgrade)
    local upgradeVal = managers.player:upgrade_value("player", upgrade, 0)

    if type(upgradeVal) == "table" then
      return true
    elseif type(upgradeVal) == "number" then
      return upgradeVal
    else
      return false
    end
  end

  if tier == 1 or not tier or tier % 2 ~= 1 or (type(tier) ~= "number" and tostring(tier) == "1") then
    return checkVal("killshot_regen_armor_bonus")
  elseif tier == 3 then
    return checkVal("movement_speed_multiplier")
  elseif tier == 5 then
    return checkVal("passive_dodge_chance") == 2
  elseif tier == 7 then
    return checkVal("passive_dodge_chance") >= 3
  elseif tier == 9 then
    return checkVal("armor_piercing_chance")
  else
    return false
  end
end