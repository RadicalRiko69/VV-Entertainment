local t = Def.ActorFrame {};

t[#t+1] = LoadFont("Common large") .. {
    Text="LIVE OPTIONS";
    InitCommand=cmd(Center;y,SCREEN_TOP+34;zoom,1);
  };
return t
