return Def.ActorFrame{
	Def.Sprite{		--Normal song jacket item
		Name="SongJacket";
		SetMessageCommand=function(self,param)
			local song = param.Song
			if song then
				local path = song:GetJacketPath();
				local bn = song:GetBannerPath();
				if path then
					self:Load(path);
					self:scaletoclipped(152,152);
					self:MaskDest();
					self:diffusealpha(1);
					self:visible(true);
				else
					path = song:GetBannerPath();
				if path then
						self:Load(path);
						self:scaletoclipped(152,152);
				else
					self:Load(THEME:GetPathG("","Common fallback banner"));
				end;
			end;
			end;
		end;
	};
};
--]]
