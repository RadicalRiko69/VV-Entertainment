return Def.ActorFrame{
	Def.ActorFrame{
		LoadActor(THEME:GetPathG("","backgrounds/lechat")) ..{
			OnCommand=cmd(zoom,0.7);
			GainFocusCommand=cmd(finishtweening;decelerate,0.2;diffusealpha,1);
			LoseFocusCommand=cmd(finishtweening;stopeffect;decelerate,0.2;diffusealpha,0);
		};
	};
	Def.ActorFrame{
		LoadActor("info") ..{
			OnCommand=cmd(zoom,0.46;addy,340);
			GainFocusCommand=cmd(finishtweening;addx,20;diffusealpha,0;decelerate,0.2;addx,-20;diffusealpha,1);
			LoseFocusCommand=cmd(finishtweening;stopeffect;decelerate,0.2;diffusealpha,0);
		};
	};
};