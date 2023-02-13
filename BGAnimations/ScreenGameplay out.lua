local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{		--fadeleft_out animation
	Def.Quad{
		OnCommand=cmd(FullScreen;diffuse,color("#000000");
			Center;zoomx,SCREEN_WIDTH*2;zoomy,0;sleep,1;decelerate,0.5;zoomy,SCREEN_HEIGHT*2;
		);
	};
};

return t