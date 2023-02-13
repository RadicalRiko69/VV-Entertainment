local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{
	Def.Quad{
		  InitCommand=function(self) self:Center():y(SCREEN_BOTTOM-150):zoomto(SCREEN_WIDTH*2,300)
		:diffuse(color("#000000")):diffusealpha(0.7)
		:fadetop(0.8) end
	};
	Def.Quad{
		InitCommand=function(self) self:Center():y(SCREEN_TOP+150):zoomto(SCREEN_WIDTH*2,300)
	  :diffuse(color("#000000")):diffusealpha(0.7)
	  :fadebottom(0.8) end
  };
};

	
return t