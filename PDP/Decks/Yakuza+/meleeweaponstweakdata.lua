local origInit = BlackMarketTweakData._init_melee_weapons
function BlackMarketTweakData:_init_melee_weapons(data)
  origInit(self, data)

  if not YakuzaP:IsUsingDeck(1) then
    return end

  self.melee_weapons.fight.stats.charge_time = 1
  self.melee_weapons.fight.expire_t = 0.69
  self.melee_weapons.fight.repeat_expire_t = 0.6875

  self.melee_weapons.fists.stats.charge_time = self.melee_weapons.fight.stats.charge_time
  self.melee_weapons.fists.expire_t = self.melee_weapons.fight.expire_t
  self.melee_weapons.fists.repeat_expire_t = self.melee_weapons.fight.repeat_expire_t
end