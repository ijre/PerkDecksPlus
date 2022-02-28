local text_original = LocalizationManager.text
local testAllStrings = false
function LocalizationManager:text(string_id, ...)
  if not YakuzaP:GetEnabled() then
    return text_original(self, string_id, ...)
  end

return  string_id == "menu_deck12_1" and "Brawl Mastery"
or string_id == "menu_deck12_1_desc" and "##Your mastery of the brawling technique allows you to deal more damage with fists or empty palm katas.##\n\nYour second and each consecutive melee hit within ##1## second of the last one will deal ##10## times its normal damage.\n\nWhen your health is below ##25%##, you will gain up to ##20%## armor recovery rate.\n##Entering this state negates regeneration effects.## \nBonuses scale linearly with health.\n\nYour chance to dodge is increased by ##15%##."

or string_id == "menu_deck12_3" and "Phoenix Spirit"
or string_id == "menu_deck12_3_desc" and "##The spirit of the phoenix flows within you.##\n\nYour stamina starts regenerating ##25%## earlier and ##25%## faster.\n\nYou gain ##10%## additional movement speed and ##20%## increased speed while climbing ladders. \n\nWhen your health is below ##25%##, you will gain up to ##20%## movement speed."

or string_id == "menu_deck12_5" and "Resist Guard"
or string_id == "menu_deck12_5_desc" and "##Through sheer focus you can dodge bullets while remaining stationary and crouched.##\n\nYou gain an additional ##10%## dodge when standing still and crouching.\n\nWhen your health is below ##25%##, you will gain up to an additional ##20%## armor recovery rate. \n\nYour chance to dodge is increased by an additional ##15%##."

or string_id == "menu_deck12_7" and "Resolute Counter"
or string_id == "menu_deck12_7_desc" and "##Keeping focus while remaining stationary and crouched allows you to counter attack incoming blows.##\n\nWhen your health is below ##25%##, you will gain up to an additional ##20%## armor recovery rate.\n\nYour chance to dodge is increased by an additional ##15%##."

or string_id == "menu_deck12_9" and "Like a Dragon"
or string_id == "menu_deck12_9_desc" and "##Like a dragon, you are able to weave around enemy attacks when your situation gets dire.##\n\nYou gain ##5%## extra dodge when below ##50%## health, and another ##5%## dodge when below ##25%## health. \n\nAll berserker effects in this perk deck will start at ##50%## health instead of ##25%##. \n\nAll your weapons have a ##25%## chance to pierce enemy armor. \nThe time between swapping weapons is reduced for you by ##80%##."


or testAllStrings == true and string_id
or text_original(self, string_id, ...)

end