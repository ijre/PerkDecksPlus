local origReloadSpeed = NewRaycastWeaponBase.reload_speed_multiplier
function NewRaycastWeaponBase:reload_speed_multiplier()
  local origVal = origReloadSpeed(self)

  if KingpinP.Helpers:IsUsingInjectorAtTier(3) then
    origVal = origVal * 1.5
  end

  return origVal
end