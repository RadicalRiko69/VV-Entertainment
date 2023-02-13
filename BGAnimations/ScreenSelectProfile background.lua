local t = Def.ActorFrame {};
t[#t+1] = LoadActor(THEME:GetPathG("","backgrounds/gradient"))..{
	InitCommand=cmd(zoom,0.6;Center);
};
return t


