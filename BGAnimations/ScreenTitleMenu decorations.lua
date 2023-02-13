local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathG("","title"))..{
	  InitCommand=cmd(zoom,0.4;Center;addy,150);
	};
};

t[#t+1] = Def.ActorFrame{
  LoadActor(THEME:GetPathS("","MusicWheel change"))..{
    MenuLeftP1MessageCommand=cmd(queuecommand,"Play");
    MenuRightP1MessageCommand=cmd(queuecommand,"Play");
    MenuDownP1MessageCommand=cmd(queuecommand,"Play");
    MenuUpP1MessageCommand=cmd(queuecommand,"Play");
		PlayCommand=function(self)
            self:stop();
			self:play();
		end;
	};
	LoadActor(THEME:GetPathS("","leave"))..{
		OffCommand=function(self)
			self:play();
		end;
	};
};

return t
