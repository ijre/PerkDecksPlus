local origInit = UpgradesTweakData.init
function UpgradesTweakData:init(data)
  origInit(self, data)

  if not BikerP:GetEnabled() then
    return
  end

  local newValsHealth = self.values.player.wild_health_amount
  local newValsArmour = self.values.player.wild_armor_amount
  local newValsPassiveArmour = self.values.player.passive_armor_multiplier

  table.insert(newValsHealth, 1.56)
  table.insert(newValsArmour, 1.56)
  table.insert(newValsPassiveArmour, 1.3)

  self.values.player.wild_health_amount = newValsHealth
  self.values.player.wild_armor_amount = newValsArmour
  self.values.player.passive_armor_multiplier = newValsPassiveArmour

  local newDefHealth = deep_clone(self.definitions.player_wild_health_amount_1)
  local newDefArmour = deep_clone(self.definitions.player_wild_armor_amount_1)
  local newDefPassiveArmour = deep_clone(self.definitions.player_passive_armor_multiplier_1)

  newDefHealth.upgrade.value = 2
  newDefArmour.upgrade.value = 2
  newDefPassiveArmour.upgrade.value = 3

  self.definitions.player_wild_health_amount_2 = newDefHealth
  self.definitions.player_wild_armor_amount_2 = newDefArmour
  self.definitions.player_passive_armor_multiplier_3 = newDefPassiveArmour


  self.values.player.less_health_wild_armor[2] = 0.08
  self.values.player.less_health_wild_cooldown[2] = 0.08
  self.values.player.less_armor_wild_health[2] = 0.08
  self.values.player.less_armor_wild_cooldown[2] = 0.08
end