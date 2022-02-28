local origInit = UpgradesTweakData.init
function UpgradesTweakData:init(data)
  origInit(self, data)

  if not CrewChiefP:GetEnabled() then
    return end

  self.values.team.damage_dampener.team_damage_reduction =
  {
    0.90
  }

  self.values.team.stamina.passive_multiplier[1] = 2.0

  self.values.team.health.passive_multiplier =
  {
    1.15
  }

  self.values.team.armor.multiplier = { 1.1 }
end