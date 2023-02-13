local t = Def.ActorFrame {};

t[#t+1] = LoadFont("Common large") .. {
    Text="INPUT MENU";
    InitCommand=cmd(Center;y,SCREEN_TOP+34;zoom,1);
  };
t[#t+1] = LoadFont("_montserrat light 30px") .. {
    Text="Please remember only PLAYER 1 is used\nin the theme, PLAYER 2 can not be used for versus.\nPLAYER 2 inputs are only used for DOUBLE style play.";
    InitCommand=cmd(Center;y,SCREEN_BOTTOM-260;zoom,0.6);
  };
t[#t+1] = LoadFont("_montserrat light 30px") .. {
    Text="VV Entertainment\nTheme by Gio#5300\nPlease support VV Entertainment\nofficial projects and artists.";
    InitCommand=cmd(Center;horizalign,right;x,SCREEN_RIGHT-10;y,SCREEN_BOTTOM-36;zoom,0.36);
  };
return t
