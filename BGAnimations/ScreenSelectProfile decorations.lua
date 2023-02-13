local t = Def.ActorFrame {};

t[#t+1] = LoadFont("Common large") .. {
    Text="LOG IN";
    InitCommand=cmd(Center;y,SCREEN_TOP+34;zoom,1);
  };

t[#t+1] = Def.ActorFrame{

	PlayerJoinedMessageCommand=function(self)
	  SCREENMAN:SetNewScreen("ScreenTitleMenu");
	end;
  
	OnCommand=function(self)
	  if GAMESTATE:IsSideJoined(PLAYER_2) then
		SCREENMAN:SetNewScreen("ScreenTitleMenu");
		SCREENMAN:SystemMessage("This is only compatible with P1! Sorry!");
	  end;
	end
};

return t;
