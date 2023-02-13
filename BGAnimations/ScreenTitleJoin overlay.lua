local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame{
	LoadFont("_montserrat light 30px") .. {
		Text="Press ENTER to begin!";
		InitCommand=cmd(Center;y,SCREEN_BOTTOM-140;zoom,0.8);
	};
};
return t
