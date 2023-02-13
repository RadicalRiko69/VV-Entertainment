local t = Def.ActorFrame {};

t[#t+1] = LoadActor(THEME:GetPathG("","scroll/apoki"))..{
    InitCommand=cmd(zoom,0.5;Center;y,SCREEN_BOTTOM-170);
    OnCommand=cmd(texcoordvelocity,0.04,0);
  };

return t
