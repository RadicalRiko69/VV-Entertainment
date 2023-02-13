local NumPlayers = GAMESTATE:GetNumPlayersEnabled()
local game = GAMESTATE:GetCurrentGame():GetName()

if game == "dance" then
  PAD = "dance"
elseif game == "pump" then
  PAD = "pump"
end;
local t = Def.ActorFrame{
	Def.ActorFrame{
		GainFocusCommand=function(s) s:stoptweening():smooth(0.3):zoom(1) end,GainFocusCommand=function(s) s:stoptweening():smooth(0.3):zoom(1)
		end,
		PlayCommand=function(s)
			if s:GetVisible() then SOUND:PlayAnnouncer("select style comment double") end
		end,LoseFocusCommand=function(s) s:stoptweening():smooth(0.3):zoom(0.825) end,
		LoadActor("pad"..PAD) ..{
			InitCommand=function(s) s:diffusealpha(0):zoomx(1):xy(2,288) end,
			OnCommand=function(s) s:zoom(0):decelerate(0.5):diffusealpha(1.0):zoom(1) end,
			GainFocusCommand=function(s) s:smooth(0.3):diffusealpha(1):diffuseshift():effectcolor1(Color.White)
				:effectcolor2(color("#ffc3ff")):effectperiod(2)
			end,
			LoseFocusCommand=function(s) s:stopeffect():diffuse(color("#353535")) end,
		};
	};
};



return t;
