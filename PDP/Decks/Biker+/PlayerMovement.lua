local origInit = PlayerMovement.init
function PlayerMovement:init(unit)
  origInit(self, unit)

  if BikerP.Helpers:IsUsingDeck(1) then
    if self._rally_skill_data then
      self._rally_skill_data.range_sq = self._rally_skill_data.range_sq * 1.25
    end
  end
end