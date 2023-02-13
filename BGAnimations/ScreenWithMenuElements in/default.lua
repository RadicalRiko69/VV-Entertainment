
local t = Def.ActorFrame {
	InitCommand=cmd(Center);
};
t[#t+1] = Def.Quad {
	InitCommand=cmd(zoomto,SCREEN_WIDTH+1,SCREEN_HEIGHT);
	OnCommand=cmd(diffuse,color("0,0,0,1");linear,0.5;diffusealpha,0);
};

return t