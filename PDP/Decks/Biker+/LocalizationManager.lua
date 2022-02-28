local origText = LocalizationManager.text
function LocalizationManager:text(string_id, ...)
  if not BikerP:GetEnabled() then
    return origText(self, string_id, ...)
  end

  return
  string_id == "menu_deck16_1" and "Bikers Are Loudmouths"
  or
  string_id == "menu_deck16_1_desc" and "##Riding a bike all day has necessitated the ability to shout over the loud engines.##\n\nYour shout distance is increased by ##25%##.\n\nEvery time you and your crew performs a kill you will gain ##10## health and ##10## armor. This cannot occur more than ##4## times every ##4## seconds."
  or
  string_id == "menu_deck16_3" and "Bikers Eat Gas Station Hot Dogs"
  or
  string_id == "menu_deck16_3_desc" and "##Being on the road all the time means you can't always eat what you want. Sometimes the only food available is a gas station hot dog. As such, you've packed on a bit more bulk.##\n\nYou gain ##30%## more health.\n\nEvery ##10%## health missing will increase the amount of armor gained from kills by ##2##."
  or
  string_id == "menu_deck16_5" and "Leather Jackets and Helmets"
  or
  string_id == "menu_deck16_5_desc" and "##Leather jackets and helmets are all the rage with bikers. They keep you warm, but most importantly protected from the elements.##\n\nYou gain ##30%## more armor.\n\nEvery ##10%## health missing will reduce the ##4## second cooldown to kill regen by ##0.2## seconds."
  or
  string_id == "menu_deck16_7" and "Speedy Recovery"
  or
  string_id == "menu_deck16_7_desc" and "##When in the fray, it's important to keep your wits about you. Getting back onto your feet (and then back on your ride) is crucial for staying alive.##\n\nKilling an enemy speeds up your armor recovery time depending on how much armor you have. The more armor the less recovery speed gained per kill.\nArmor recovery speed is reset whenever your armor recovers.\n\nEvery ##10%## armor missing will increase the amount of health gained from kills by ##2##."
  or
  string_id == "menu_deck16_9" and "Adrenaline"
  or
  string_id == "menu_deck16_9_desc" and "##The heat of battle (and your ride's engine) fills you with adrenaline, allowing you to keep going for longer than others (or yourself) might expect. Who knows the true limits of a biker?##\n\nYou gain ##50% ##damage absorption for ##0.2## seconds when your armor gets depleted. If you regain armor, the effect is cut short.\n\nEvery ##10%## armor missing will reduce the ##4## second cooldown to kill regen by ##0.2## seconds."
  or origText(self, string_id, ...)
end