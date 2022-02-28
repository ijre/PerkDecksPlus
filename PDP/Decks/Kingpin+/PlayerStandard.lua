local origSwapMulti = PlayerStandard._get_swap_speed_multiplier
function PlayerStandard:_get_swap_speed_multiplier()
  local origVal = origSwapMulti(self)

  if KingpinP.Helpers:IsUsingInjectorAtTier(3) then
    origVal = origVal * 1.8
  end

  return origVal
end

local origMaxMoveSpeed = PlayerStandard._get_max_walk_speed
function PlayerStandard:_get_max_walk_speed(t, forceRun)
  local origVal = origMaxMoveSpeed(self, t, forceRun)

  if KingpinP.Helpers:IsUsingInjectorAtTier(5) then
    origVal = origVal * 1.20 + KingpinP.SpeedStacks
  end

  return origVal
end