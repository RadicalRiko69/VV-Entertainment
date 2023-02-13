local t = Def.ActorFrame {};
t[#t+1] = LoadActor(THEME:GetPathG("","backgrounds/world")) ..{
		InitCommand=cmd(Center);
		OnCommand=function(self)
			self:scale_or_crop_background()
		end;
	};

return t
