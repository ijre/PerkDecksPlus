local originit = BlackMarketTweakData._init_melee_weapons
function BlackMarketTweakData:_init_melee_weapons(typedata)
originit(self,typedata)
self.melee_weapons.fists.expire_t = 0.8
self.melee_weapons.fists.repeat_expire_t = 0.45


self.melee_weapons.fight.expire_t = 0.8
self.melee_weapons.fight.repeat_expire_t = 0.45

end