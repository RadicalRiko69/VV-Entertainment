local gc = Var("GameCommand");
local item_width = 260;
local item_height = 36;

return Def.ActorFrame {
	OnCommand=function(self) self:diffusealpha(1) end;
	OffCommand=function(self) self:diffusealpha(0) end;
	Def.ActorFrame {
		GainFocusCommand=function(self) self:stoptweening():diffusealpha(1):zoomx(1) end;
		LoseFocusCommand=function(self) self:stoptweening():diffusealpha(0):zoomx(0) end;
			Def.Quad {InitCommand=function(self) self:zoomto(300,30):vertalign(bottom):y(item_height/2.2):diffuse(color("#869fff")):fadeleft(1):faderight(1) end,},	
	};	
	Def.BitmapText {
		Font="_montserrat light 30px";
		Text=THEME:GetString("ScreenTitleMenu",gc:GetText());
		InitCommand=function(self) self:maxwidth(320):zoom(0.8) end;
		GainFocusCommand=function(self) self:stoptweening():diffusealpha(1):zoom(0.9) end;
		LoseFocusCommand=function(self) self:stoptweening():diffusealpha(0.1):zoom(0.7) end;
	};
};