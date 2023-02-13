local t =		Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{		--fadeleft_out animation
	Def.Quad{
		OnCommand=cmd(FullScreen;diffuse,color("#000000");
			Center;zoomx,SCREEN_WIDTH*2;zoomy,SCREEN_HEIGHT*2;decelerate,0.5;zoomy,0;
		);
	};
};

return t