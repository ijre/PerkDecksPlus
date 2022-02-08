local origInit = PlayerMovement.init
function PlayerMovement:init(unit)
  origInit(self, unit)

  if CrewChiefP.Helpers:IsUsingDeck(1) then
    if self._rally_skill_data then
      self._rally_skill_data.range_sq = self._rally_skill_data.range_sq * managers.player:upgrade_value("player", "passive_intimidate_range_mul", 1.0)
    end
  end
end