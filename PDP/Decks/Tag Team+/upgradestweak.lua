local origInit = UpgradesTweakData.init
function UpgradesTweakData:init(data)
  origInit(self, data)
  if not TagTeamP:GetEnabled() then
    return end

    table.insert(self.values.player.passive_health_multiplier, 1.6)

    self.definitions.player_passive_health_multiplier_6 = {
      name_id = "menu_player_health_multiplier",
      category = "feature",
      upgrade = {
        value = 6,
        upgrade = "passive_health_multiplier",
        category = "player"
      }
    }

    table.insert(self.values.player.level_2_armor_multiplier, 2)

    self.definitions.player_level_2_armor_multiplier_4 = {
      name_id = "menu_player_level_2_armor_multiplier",
      category = "feature",
      upgrade = {
        value = 4,
        upgrade = "level_2_armor_multiplier",
        category = "player"
      }
    }



end




--armor bonus for lwbv 35% and health of 20%
