local origInit = SkillTreeTweakData.init
function SkillTreeTweakData:init()
  origInit(self)

  if not TagTeamP:GetEnabled() then
    return
  end

  table.insert(self.specializations[20][3].upgrades, "player_level_2_armor_multiplier_1")
  table.insert(self.specializations[20][3].upgrades, "player_level_2_armor_multiplier_2")
  table.insert(self.specializations[20][3].upgrades, "player_level_2_armor_multiplier_3")
  table.insert(self.specializations[20][3].upgrades, "player_level_2_armor_multiplier_4")

  table.insert(self.specializations[20][7].upgrades, "player_passive_health_multiplier_6")

  
  --table.insert(self.specializations[20][7].upgrades, "player_passive_health_multiplier_4")

end

