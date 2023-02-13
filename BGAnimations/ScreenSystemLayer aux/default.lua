local t = Def.ActorFrame {};
t[#t+1] = LoadActor("time")..{
};
t[#t+1] = LoadActor("life")..{
    InitCommand=function(self)
		self:xy(SCREEN_RIGHT-22,SCREEN_TOP+16);
		self:zoomx(0.11);
		self:zoomy(0.36);
	end;
};
t[#t+1] = LoadActor(THEME:GetPathG("","logo"))..{
	InitCommand=cmd(zoom,0.65;x,SCREEN_LEFT+30;y,SCREEN_BOTTOM-20);
};
return t