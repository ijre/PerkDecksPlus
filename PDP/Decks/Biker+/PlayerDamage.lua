local Absorbing = false
local AbsorbTimerLength = nil
local AbsorbDuration = 2.0
local DmgAbsorbVal = 10.0

local origUpdate = PlayerDamage.update
function PlayerDamage:update(unit, time, delta)
  origUpdate(self, unit, time, delta)
  if not BikerP.Helpers:IsUsingDeck(9) then
    return end

  AbsorbTimerLength = AbsorbTimerLength or time + AbsorbDuration

  if time > AbsorbTimerLength or self:get_real_armor() > 0 then
    Absorbing = false
  end

  if Absorbing then
    managers.player:set_damage_absorption(LuaNetworking:LocalPeerID(), DmgAbsorbVal)
  else
    managers.player:set_damage_absorption(LuaNetworking:LocalPeerID(), -DmgAbsorbVal)
  end
end

local origCalcArmour = PlayerDamage._calc_armor_damage
function PlayerDamage:_calc_armor_damage(data)
  local prevArmour = self:get_real_armor()
  local ret = origCalcArmour(self, data)

  if BikerP.Helpers:IsUsingDeck(9) and prevArmour ~= 0 and self:get_real_armor() == 0 then
    Absorbing = true
    AbsorbTimerLength = nil
  end

  return ret
end