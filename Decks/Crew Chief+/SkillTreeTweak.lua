local origInit = SkillTreeTweakData.init
function SkillTreeTweakData:init()
  origInit(self)

  if CrewChiefP:GetEnabled() then
    table.insert(self.specializations[1][9].upgrades, "temporary_loose_ammo_give_team")
  end
end