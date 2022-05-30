local text_original = LocalizationManager.text
local testAllStrings = false
function LocalizationManager:text(string_id, ...)

  if not TagTeamP:GetEnabled() then
    return text_original(self, string_id, ...)
  end
return

-- string_id == "menu_deck5_1" and "Brawl Mastery"
--or
-- string_id == "menu_deck5_1_desc" and "Your armor is increased by 45% for ballistic vests."

--or string_id == "menu_deck5_3" and "Phoenix Spirit"
string_id == "menu_deck20_3_desc" and "Your maximum health is increased by ##20%##. Your armor is increased by ##100%## for ballistic vests."

--or string_id == "menu_deck5_5" and "Resist Guard"
--or string_id == "menu_deck5_5_desc" and "##Through sheer focus, you are able to dodge bullets while remaining stationary and crouched.##\n\nYou gain an additional ##10%## dodge when standing still and crouching.\n\nWhen your health is below ##25%##, you will gain up to an additional ##20%## armor recovery rate. \n\nYour chance to dodge is increased by an additional ##15%##."

--or string_id == "menu_deck5_7" and "Resolute Counter"
or string_id == "menu_deck20_7_desc" and "Your maximum health is increased by ##40%##."

--or string_id == "menu_deck5_9" and "Like a Dragon"
--or string_id == "menu_deck5_9_desc" and "##Like a dragon, you are able to weave around enemy attacks when your situation gets dire.\nEnemies are also more intimidated by you.##\n\nYou gain ##5%## extra dodge when below ##50%## health, and another ##5%## dodge when below ##25%## health. \n\nAll berserker effects in this perk deck will start at ##50%## health instead of ##25%##. \n\nAll your weapons have a ##25%## chance to pierce enemy armor. \nThe time between swapping weapons is reduced for you by ##80%##.\n\nKilling an enemy at medium range has a ##75%## chance to spread panic among your enemies.\nPanic will make enemies go into short bursts of uncontrollable fear.\nThis cannot occur more than once every ##1## second."


or testAllStrings == true and string_id
or text_original(self, string_id, ...)

end