local t = Def.ActorFrame {};
local gc = Var("GameCommand");
local max_stages = PREFSMAN:GetPreference( "SongsPerPlay" );
--------------------------------------
t[#t+1] = Def.ActorFrame {
	InitCommand=function(s) s:xy(_screen.cx,_screen.cy+320):zoom(0.46) end,
	GainFocusCommand=function(self)
		self:diffusealpha(0):zoomy(0):smooth(0.2):zoomy(0.46):diffusealpha(1)
	end;
	OnCommand=function(self)
		self:diffusealpha(0):zoomy(0)
		if (GAMESTATE:GetNumPlayersEnabled() > 1 and gc:GetName() == "Versus") or (gc:GetName() == "Single" and GAMESTATE:GetNumPlayersEnabled() == 1) then
			self:smooth(0.2):zoomy(0.46):diffusealpha(1)
		end;
	end;
	LoseFocusCommand=function(s) s:smooth(0.1):zoomy(0):diffusealpha(0) end,
	OffCommand=function(s) s:smooth(0.2):addy(300):diffusealpha(0) end,
	LoadActor( gc:GetName()..".png" );
};

return t;
