local originit = SkillTreeTweakData.init

function SkillTreeTweakData:init()

	originit(self) 

	table.insert(self.specializations[12][1].upgrades, "player_passive_dodge_chance_1")
	table.insert(self.specializations[12][1].upgrades, "player_damage_dampener_outnumbered_strong")
	table.insert(self.specializations[12][1].upgrades, "melee_stacking_hit_damage_multiplier_1")
	table.insert(self.specializations[12][1].upgrades, "player_killshot_regen_armor_bonus")
	table.insert(self.specializations[12][1].upgrades, "player_tier_armor_multiplier_1")
	table.insert(self.specializations[12][1].upgrades, "player_tier_armor_multiplier_2")

	table.insert(self.specializations[12][3].upgrades, "player_stamina_regen_timer_multiplier")
	table.insert(self.specializations[12][3].upgrades, "player_stamina_regen_multiplier")
	table.insert(self.specializations[12][3].upgrades, "player_movement_speed_multiplier")
	table.insert(self.specializations[12][3].upgrades, "player_climb_speed_multiplier_1")

	table.insert(self.specializations[12][5].upgrades, "player_passive_dodge_chance_2")

	table.insert(self.specializations[12][7].upgrades, "player_passive_dodge_chance_3")

	table.insert(self.specializations[12][9].upgrades, "weapon_passive_armor_piercing_chance")
	table.insert(self.specializations[12][9].upgrades, "weapon_passive_swap_speed_multiplier_1")












end