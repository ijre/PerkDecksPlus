local origCheck = PlayerDamage._check_bleed_out
function PlayerDamage:_check_bleed_out(canSwan, ignoreMoveState)
  if not KingpinP:GetEnabled() or not managers.player:local_player() then
    origCheck(self, canSwan, ignoreMoveState)
    return
  end

  if managers.player:has_activate_temporary_upgrade("temporary", "chico_injector") then
    local plrHealth = self:get_real_health()

    if plrHealth <= 0 then
      self:set_health(0.1)
    end
  end

  origCheck(self, canSwan, ignoreMoveState)
end

local origDmgBullet = PlayerDamage.damage_bullet
function PlayerDamage:damage_bullet(data)
  origDmgBullet(self, data)

  if KingpinP.Helpers:IsUsingInjectorAtTier(5) then
    KingpinP.SpeedStacks = KingpinP.SpeedStacks + 0.02

    if KingpinP.SpeedStacks >= 0.3 then
      KingpinP.SpeedStacks = 0.3
    end
  elseif not managers.player:has_activate_temporary_upgrade("temporary", "chico_injector") then
    KingpinP.SpeedStacks = 0.0
  end
end