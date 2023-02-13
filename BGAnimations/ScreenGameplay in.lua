local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame{		--fadeleft_out animation
	Def.Quad{
		OnCommand=cmd(FullScreen;diffuse,color("#000000");
			Center;zoomx,SCREEN_WIDTH*2;zoomy,SCREEN_HEIGHT*2;sleep,1;decelerate,0.5;zoomy,0;
		);
	};
};
t[#t+1] = LoadActor(THEME:GetPathG("","ring"))..{
    OnCommand=cmd(Center;zoom,0;decelerate,0.2;zoom,0.5;linear,0.5;rotationz,-360;diffusealpha,0);
};
return t


