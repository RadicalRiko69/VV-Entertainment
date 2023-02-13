-- I got this idea for using a single sprite instead of PerChoiceScrollElement
-- from k//eternal's PROJEKTXV theme.
--
-- The "GameCommand" var is defined in ScreenSelectMaster.cpp:
--   LuaThreadVariable var("GameCommand", LuaReference::Create(&mc));
local style = "";

if ThemePrefs.Get("TeamPreference") == "Apoki" then
  style = "ChoiceApoki"
elseif ThemePrefs.Get("TeamPreference") == "Lechat" then
  style = "ChoiceLechat"
elseif ThemePrefs.Get("TeamPreference") == "Ovadozu" then
	style = "ChoiceOvadozu"
end;

local t = Def.ActorFrame{
	LoadActor(style)..{
		OnCommand=cmd(zoom,0.75);
		OffCommand=function(self, param)
			self:smooth(0.1):zoom(0):diffusealpha(0)
		end;
	}
};

return t
