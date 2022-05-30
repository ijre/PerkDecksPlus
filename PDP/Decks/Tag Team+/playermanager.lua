Hooks:PostHook(PlayerManager, "end_tag_team", "TagTeamPEnd", function(self, tagged, owner)
	if tagged == self:local_player() then
		TagTeamP.isTagged=false

	end
end)

local origRegen = PlayerManager.body_armor_regen_multiplier
function PlayerManager:body_armor_regen_multiplier(...)
local mult = origRegen(self,...)
if TagTeamP.isTagged then mult = mult - 0.2
end
return mult
end