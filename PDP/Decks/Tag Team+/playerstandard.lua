local origReload = PlayerStandard._start_action_reload
function PlayerStandard:_start_action_reload(t)
	if not TagTeamP:GetEnabled() then
		origReload(self,t) return end
	local weapon = self._equipped_unit:base()

	if weapon and weapon:can_reload() then
		local is_reload_not_empty = weapon:clip_not_empty()

		weapon:tweak_data_anim_stop("fire")

		local speed_multiplier = weapon:reload_speed_multiplier()
        
	    if TagTeamP.isTagging and TagTeamP.isTagged then
				speed_multiplier=speed_multiplier + 1.5
			elseif TagTeamP.isTagging then
				speed_multiplier=speed_multiplier + 1
			
			elseif TagTeamP.isTagged then
				speed_multiplier=speed_multiplier + 0.5
      end
		local empty_reload = weapon:clip_empty() and 1 or 0

		if weapon:use_shotgun_reload() then
			empty_reload = weapon:get_ammo_max_per_clip() - weapon:get_ammo_remaining_in_clip()
		end

		local tweak_data = weapon:weapon_tweak_data()
		local reload_anim = "reload"
		local reload_prefix = weapon:reload_prefix() or ""
		local reload_name_id = tweak_data.animations.reload_name_id or weapon.name_id
		local reload_default_expire_t = 2.6
		local reload_tweak = tweak_data.timers.reload_empty

		if is_reload_not_empty then
			reload_anim = "reload_not_empty"
			reload_default_expire_t = 2.2
			reload_tweak = tweak_data.timers.reload_not_empty
		end

		local reload_ids = Idstring(string.format("%s%s_%s", reload_prefix, reload_anim, reload_name_id))
		local result = self._ext_camera:play_redirect(reload_ids, speed_multiplier)

		Application:trace("PlayerStandard:_start_action_reload( t ): ", reload_ids)

		self._state_data.reload_expire_t = t + (reload_tweak or weapon:reload_expire_t(is_reload_not_empty) or reload_default_expire_t) / speed_multiplier

		weapon:start_reload()

		if not weapon:tweak_data_anim_play(reload_anim, speed_multiplier) then
			weapon:tweak_data_anim_play("reload", speed_multiplier)
			Application:trace("PlayerStandard:_start_action_reload( t ): ", reload_anim)
		end

		self._ext_network:send("reload_weapon", empty_reload, speed_multiplier)
	end
end