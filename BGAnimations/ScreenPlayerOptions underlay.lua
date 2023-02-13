local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{
  LoadActor(THEME:GetPathS("","leave"))..{
		OffCommand=function(self)
						self:play();
		end;
	};
};

t[#t+1] = Def.ActorFrame{
  Def.Quad{
		InitCommand=function(self) self:Center():addy(-40):zoomto(960,960)
      :diffuse(color("#000000")):diffusealpha(0.8)
      :fadebottom(0.1):fadetop(0.1) end
	};
};


t[#t+1] = Def.ActorFrame{
  LoadActor(THEME:GetPathG("","Common fallback banner"))..{
		OnCommand=function(self)
						self:zoom(0.22):Center():y(SCREEN_CENTER_Y-320);
		end;
	};
};

--Song Text
t[#t+1] = LoadFont("Common large") .. {
	InitCommand=cmd(Center;y,SCREEN_BOTTOM-130;zoom,0.7;maxwidth,800);
	OnCommand=function(self)
	  local song = GAMESTATE:GetCurrentSong()
	  if song then
		self:settext(song:GetDisplayFullTitle());
	  else
		self:diffusealpha(0);
	  end;
	end;
};
t[#t+1] = LoadFont("_montserrat light 30px") .. {
	InitCommand=cmd(Center;y,SCREEN_BOTTOM-110;zoom,0.4;maxwidth,1400);
	OnCommand=function(self)
	  local song = GAMESTATE:GetCurrentSong()
	  if song then
		self:settext(song:GetDisplayArtist());
	  else
		self:diffusealpha(0);
	  end;
	end;
};

if not GAMESTATE:IsCourseMode() then
	local function JacketUpdate(self)
		local song = GAMESTATE:GetCurrentSong();
		local Jacket = self:GetChild("Jacket");
		
		if song then
			if song:HasJacket() then
				self:visible(true);
        Jacket:visible(true);
				Jacket:Load(song:GetJacketPath());
				Jacket:scaletoclipped(240,240);
      elseif song:HasBanner() then
          self:visible(true);
          Jacket:visible(true);
          Jacket:Load(song:GetBannerPath());
          Jacket:scaletoclipped(240,240);
      else
        self:visible(false);
			end;
		else
			Jacket:visible(false);
		end;
	end;
	t[#t+1] = Def.ActorFrame {
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-320;diffusealpha,1;SetUpdateFunction,JacketUpdate);
		Def.Sprite {
			Name="Jacket";
		};	
	};
end;

	
return t