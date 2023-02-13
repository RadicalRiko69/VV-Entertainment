local t = Def.ActorFrame {};
t[#t+1] = LoadActor("disclaimer")..{
    InitCommand=cmd(zoom,0.57;Center);
};

t[#t+1] = Def.ActorFrame {
	InitCommand=function(self)
		--Reset the vars, player options, etc here.
		ResetGame();
	end;
  };
return t


