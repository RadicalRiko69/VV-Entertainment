local t = Def.ActorFrame {};


local NAME = "";

if ThemePrefs.Get("TeamPreference") == "Apoki" then
  NAME = "apoki"
elseif ThemePrefs.Get("TeamPreference") == "Lechat" then
  NAME = "lechat"
elseif ThemePrefs.Get("TeamPreference") == "Ovadozu" then
  NAME = "ovadozu"
end;

t[#t+1] = LoadActor(NAME)..{
	InitCommand=cmd(Center);
	OnCommand=function(self)
		self:scale_or_crop_background()
	end;
};

return t
