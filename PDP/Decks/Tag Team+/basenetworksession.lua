Hooks:PostHook(BaseNetworkSession, "send_to_peers", "TagTeamPEnd", function(self, name, tagged, owner, ...)
	if name and name=="end_tag_team" then
		if owner == managers.player:local_player() then
      TagTeamP.isTagging=false
		end
	end
end)