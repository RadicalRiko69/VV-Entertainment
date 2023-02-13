local t = Def.ActorFrame {};

t[#t+1] = LoadFont("Common large") .. {
    Text="SELECT PLAY STYLE";
    InitCommand=cmd(Center;y,SCREEN_TOP+34;zoom,1);
  };
t[#t+1] = Def.ActorFrame{
  LoadActor(THEME:GetPathG("","button/arrow")) .. {
    InitCommand=cmd(Center;addy,-40;linear,0.3;zoom,0.4;addx,180);
    MenuRightP1MessageCommand=cmd(finishtweening;addx,20;linear,0.2;addx,-20);
    MenuDownP1MessageCommand=cmd(finishtweening;addx,20;linear,0.2;addx,-20);
  };
  LoadActor(THEME:GetPathG("","button/arrow")) .. {
    InitCommand=cmd(Center;rotationz,180;addy,-40;linear,0.3;zoom,0.4;addx,-180);
    MenuLeftP1MessageCommand=cmd(finishtweening;addx,-20;linear,0.2;addx,20);
    MenuUpP1MessageCommand=cmd(finishtweening;addx,-20;linear,0.2;addx,20);
  };
};

t[#t+1] = Def.ActorFrame{
  LoadActor(THEME:GetPathS("","ding"))..{
    MenuLeftP1MessageCommand=cmd(queuecommand,"Play");
    MenuRightP1MessageCommand=cmd(queuecommand,"Play");
    MenuDownP1MessageCommand=cmd(queuecommand,"Play");
    MenuUpP1MessageCommand=cmd(queuecommand,"Play");
		PlayCommand=function(self)
          self:stop();
					self:play();
		end;
	};
  LoadActor(THEME:GetPathS("","confirm"))..{
		OffCommand=function(self)
			self:play();
		end;
	};
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
return t
