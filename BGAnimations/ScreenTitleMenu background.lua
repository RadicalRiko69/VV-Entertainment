local t = Def.ActorFrame {};

local game = GAMESTATE:GetCurrentGame():GetName()

if game == "dance" then
  SPLASH = "dance"
elseif game == "pump" then
  SPLASH = "pump"
end;

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathG("","splash/"..SPLASH));
  	OnCommand=function(self)
		self:Center();
    	self:zoom(0.57);
  	end;
};

return t
