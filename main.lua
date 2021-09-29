DecksP = DecksP or { }
DecksP.Settings =
{
  YakuzaP = true,
  BikerP = true,
  KingpinP = true
}

local settingsPath = ModPath .. "Settings/"
local savePath = SavePath .. "PDP.txt"

Hooks:Add("LocalizationManagerPostInit", "PDP_OnLocalizeInit", function(LM)
  LM:load_localization_file(settingsPath .. "en.txt")
end)

function DecksP:Load()
  local file = io.open(savePath, "r")

  if file then
    for k, v in pairs(json.decode(file:read("*all"))) do
      self.Settings[k] = v
    end

    file:close()
  else
    self:Save()
  end
end

function DecksP:Save()
  local file = io.open(savePath, "w+")

  file:write(json.encode(self.Settings))
  file:close()
end

Hooks:Add("MenuManagerInitialize", "PDP_OnMenuInit", function(MM)
  MenuCallbackHandler.PDP_OnYakuza = function(self, option)
    DecksP.Settings.YakuzaP = option:value() == "on"
    DecksP:Save()
  end

  MenuCallbackHandler.PDP_OnBiker = function(self, option)
    DecksP.Settings.BikerP = option:value() == "on"
    DecksP:Save()
  end

  MenuCallbackHandler.PDP_OnKingpin = function(self, option)
    DecksP.Settings.KingpinP = option:value() == "on"
    DecksP:Save()
  end

  DecksP:Load()
  MenuHelper:LoadFromJsonFile(settingsPath .. "menu.txt", DecksP, DecksP.Settings)
end)