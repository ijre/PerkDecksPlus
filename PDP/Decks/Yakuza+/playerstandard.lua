local origStartMelee = PlayerStandard._do_action_melee
function PlayerStandard:_do_action_melee(time, input, skipDmg)
  origStartMelee(self, time, input, skipDmg)

  local melee = managers.blackmarket:equipped_melee_weapon()

  if not YakuzaP:IsUsingDeck(1) or not table.contains({ "fight", "fists" }, melee) then
    return end

  local debug = ijreDebug and 5 or 1.75

  local attack = self._ext_camera:play_redirect(self:get_animation("melee_attack"), debug)

  local animVars = tweak_data.blackmarket.melee_weapons[melee].anim_attack_vars

  if animVars then
    self._melee_attack_var = animVars and math.random(#animVars)
    self._camera_unit:anim_state_machine():set_parameter(attack, animVars[self._melee_attack_var], 1)
  end
end