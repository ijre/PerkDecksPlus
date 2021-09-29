local prevArmour = 1.0
local armourBreakTime = 0.0
local absorptionTimer = 1.0

local origUpdate = PlayerManager.update
function PlayerManager:update(t, dt)
  origUpdate(self, t, dt)

  if BikerP.Helpers:IsUsingDeck(9) then
    local locPly = self:local_player()

    if not locPly then
      return end

    local currArmour = locPly:character_damage():armor_ratio()

    if currArmour == 0 and prevArmour ~= 0 then
      armourBreakTime = t

      self:set_damage_absorption({ }, 5.0)
    elseif (currArmour ~= 0 and prevArmour == 0) or (currArmour == 0 and prevArmour == 0 and t - armourBreakTime >= absorptionTimer) then
      self:set_damage_absorption({ }, -5.0)
    end

    prevArmour = currArmour
  end
end