local function fixAPHTrackersKingpin(newTime)
  if not AdditionalPocoHudTrackers or not AdditionalPocoHudTrackers.Prefs.ChicoInjector then
    return
  end

  local playertime = managers.player:player_timer():time()

  local buff = PocoHud3.buffs.ChicoInjectorCooldown

  if not buff or buff.dying then
    AdditionalPocoHudTrackers:Buff(PocoHud3, PocoHud3Class,
    {
        key = "ChicoInjector",
        good = true,
        icon = AdditionalPocoHudTrackers.KingpinDeckIcons,
        iconRect = {0, 0, 64, 64},
        text = AdditionalPocoHudTrackers.TrackerNames.ChicoInjector,
        st = playertime,
        et = playertime + newTime
    })
  else
    buff.data.et = playertime + newTime
  end
end

local origOnKill = PlayerManager.on_killshot
function PlayerManager:on_killshot(victim, varient, hs, wepId)
  origOnKill(self, victim, varient, hs, wepId)

  if not KingpinP:GetEnabled() or managers.blackmarket:equipped_grenade() ~= "chico_injector" then
    return end

  if not victim:base():char_tweak() then
    return end

  local tags = victim:base():char_tweak().tags

  if table.contains(tags, "special") then
    self:speed_up_grenade_cooldown(1)
    fixAPHTrackersKingpin(self:get_timer_remaining("replenish_grenades"))
  end
end