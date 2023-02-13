
local t = Def.ActorFrame {
	
};
t[#t+1] = Def.Quad {
	InitCommand=cmd(y,SCREEN_BOTTOM;zoomto,SCREEN_WIDTH*2,SCREEN_HEIGHT*2);
	OnCommand=cmd(diffuse,color("0,0,0,1");diffusealpha,0;linear,0.5;diffusealpha,1);
};

t[#t+1] = LoadActor("tr") .. {
	InitCommand=cmd(Center);
	OffCommand=function(self)
			self:zoom(1);
			self:blend(Blend.Add);
			self:sleep(0.5);
			self:linear(0.5);
			self:diffusealpha(0);
	end;
};
return t