local origInit = SkillTreeTweakData.init
function SkillTreeTweakData:init()
  origInit(self)

  if not BikerP:GetEnabled() then
    return
  end

  self.specializations[16][1].upgrades =
  { "player_wild_health_amount_2", "player_wild_armor_amount_2" }

  table.insert(self.specializations[16][3].upgrades, "player_passive_health_multiplier_1")
  table.insert(self.specializations[16][3].upgrades, "player_passive_health_multiplier_2")

  table.insert(self.specializations[16][5].upgrades, "player_passive_armor_multiplier_3")

  table.insert(self.specializations[16][7].upgrades, "player_kill_change_regenerate_speed")
end