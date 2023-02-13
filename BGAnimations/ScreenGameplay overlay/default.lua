local t = Def.ActorFrame {};

--Characters
local NAME = "";

if ThemePrefs.Get("TeamPreference") == "Apoki" then
  NAME = "apoki"
elseif ThemePrefs.Get("TeamPreference") == "Lechat" then
  NAME = "lechat"
elseif ThemePrefs.Get("TeamPreference") == "Ovadozu" then
	NAME = "ovadozu"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(NAME);
  OnCommand=function(self)
	self:zoom(0.4);
	self:x(SCREEN_RIGHT-40);
	self:y(SCREEN_CENTER_Y+180);
  end;
};

--Icons
t[#t+1] = LoadActor("icons") .. {
	InitCommand=function(self)
			self:x(SCREEN_RIGHT-40);
			self:y(SCREEN_BOTTOM-220);
			self:zoom(0.5);
	end;
};
--Score
t[#t+1] = LoadFont("_futura 30px")..{
	InitCommand=function(self)
		if PLAYER_1 then
			self:x(SCREEN_RIGHT-40);
			self:y(SCREEN_BOTTOM-262);
			self:zoom(0.6);
		end;
	end;
	OnCommand=cmd(playcommand,"Change");
	JudgmentMessageCommand=cmd(playcommand,"Change");
	ChangeCommand=function(self)
		self:stoptweening()
		local PSS = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1);
		local total = PSS:GetCurrentPossibleDancePoints();
		local current = PSS:GetActualDancePoints();
		local extra = string.format( "%.1f", current/1000 );
			if current >= 0.1 then
				self:settext(current.."K");
			else
				self:settext("0");
			end
		if current >= 1050 then
			self:settext(extra.."M");
		elseif current >= 1000 then
			self:settext("1M");
		end
		--SCREENMAN:SystemMessage(extra);
	end;
};
--Following
t[#t+1] = LoadFont("_futura 30px")..{
	InitCommand=function(self)
		if PLAYER_1 then
			self:horizalign(left);
			self:x(SCREEN_CENTER_X-116);
			self:y(SCREEN_TOP+40);
			self:zoom(0.6);
		end;
	end;
	OnCommand=cmd(playcommand,"Change");
	JudgmentMessageCommand=cmd(playcommand,"Change");
	ChangeCommand=function(self)
	self:stoptweening()
		local PSS = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1);
				local total = PSS:GetCurrentPossibleDancePoints();
				local current = PSS:GetActualDancePoints();	
					if total == 0 then
						value = 0
					else
						value = math.floor(current/total*10000)/100
						if value < 0 then
							value = 0
							self:settext("Following       |            0%");	
						end
					end;
				self:settext("Following       |            "..value.."%");	
	end;
};
--Max Combo
t[#t+1] = LoadFont("_futura 30px")..{
	InitCommand=function(self)
		if PLAYER_1 then
			self:x(SCREEN_RIGHT-40);
			self:y(SCREEN_BOTTOM-194);
			self:zoom(0.5);
		end;
	end;
	OnCommand=cmd(playcommand,"Change");
	JudgmentMessageCommand=cmd(playcommand,"Change");
	ChangeCommand=function(self)
				self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):MaxCombo());
				self:zoom(0.6);			
	end;
};
--Share Button
t[#t+1] = LoadFont("_futura 30px")..{
	InitCommand=function(self)
			self:x(SCREEN_RIGHT-40);
			self:y(SCREEN_BOTTOM-120);
			self:zoom(0.5);
			self:settext("Share");
	end;
};
--Jacket
if not GAMESTATE:IsCourseMode() then
	local function JacketUpdate(self)
		local song = GAMESTATE:GetCurrentSong();
		local Jacket = self:GetChild("Jacket");
		local height = Jacket:GetHeight();
		
		if song then
			if song:HasJacket() then
				Jacket:visible(true);
				Jacket:Load(song:GetJacketPath());
				Jacket:scaletoclipped(50,50);
			elseif song:HasBanner() then
				Jacket:visible(true);
				Jacket:Load(song:GetBannerPath());
				Jacket:scaletoclipped(50,50);
			end;
		else
			Jacket:visible(false);
		end;
		
	end;
	t[#t+1] = Def.ActorFrame {
		LoadActor(THEME:GetPathG("","button/badge")) .. {
			OnCommand=cmd(zoomto,50,50);
		};	
		LoadActor(THEME:GetPathG("","button/mask")) .. {
			OnCommand=cmd(MaskSource;zoomto,50,50);
		};
		OnCommand=cmd(MaskDest;thump;effectclock,"beatnooffset";x,SCREEN_RIGHT-40;y,SCREEN_BOTTOM-70;diffusealpha,1;SetUpdateFunction,JacketUpdate);
		Def.Sprite {
			Name="Jacket";
		};
	};
end;
--Name
t[#t+1] = LoadFont("_futura 30px") .. {
	InitCommand=cmd(maxwidth,580;zoom,0.8);
	OnCommand=function(self)
		if PLAYER_1 then
			self:horizalign(left);
			self:x(SCREEN_LEFT+14);
			self:y(SCREEN_BOTTOM-160);
		end;
	end;

	BeginCommand=function(self)
		local profile = PROFILEMAN:GetProfile(PLAYER_1);
		local name = profile:GetDisplayName();
		
		if GAMESTATE:IsHumanPlayer(PLAYER_1) == true then
			if name=="" and SCREENMAN:GetTopScreen():GetName() ~= "ScreenDemonstration" then
				if PLAYER_1 then
					self:settext("@User name");
				end
			else
				self:settext("@"..name );
			end
		end	
		
	end;
};
--Level
t[#t+1] = LoadFont("_futura 30px") .. {
	InitCommand=function(self)
		if PLAYER_1 then
			self:horizalign(left);
			self:x(SCREEN_LEFT+14);
			self:y(SCREEN_BOTTOM-120);
			self:zoom(0.6);
		end;
	end;
	OnCommand=function(self)
	  if GAMESTATE:GetCurrentSteps(PLAYER_1) then
		  local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();
		  local lvl = GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter();
		  local desc = "";
		  	if lvl >= 20 then
			  	desc = "#Intense";
			elseif lvl >= 17 then
				desc = "#Extreme";
			elseif lvl >= 14 then
				desc = "#Difficult";
			elseif lvl >= 11 then
				desc = "#Confusing";
			elseif lvl >= 8 then
				desc = "#Intimidating";
			elseif lvl >= 5 then
				desc = "#Moderate";
			elseif lvl >= 2 then
				desc = "#Easy";
			else
				desc = "#Beginner";
	  	  	end;
		  if diff == "Difficulty_Beginner" then
			  self:settext(desc.."  #Lv"..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
		  elseif diff == "Difficulty_Easy" then
			  self:settext(desc.."  #Lv"..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
		  elseif diff == "Difficulty_Medium" then
			  self:settext(desc.."  #Lv"..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
		  elseif diff == "Difficulty_Hard" then
			  self:settext(desc.."  #Lv"..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
		  elseif diff == "Difficulty_Challenge" then
			  self:settext(desc.."  #Lv"..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
		  elseif diff == "Difficulty_Edit" then
			  self:settext(desc.."  #Lv"..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
		  else
			  self:settext("what do I put here?");
		  end
	  end;
  end;
};
t[#t+1] = LoadFont("_futura 30px")..{
	InitCommand=function(self)
		if PLAYER_1 then
			self:horizalign(left);
			self:x(SCREEN_LEFT+72);
			self:y(SCREEN_BOTTOM-120);
			self:zoom(0.6);
		end;
	end;
	OnCommand=function(self)
	  if GAMESTATE:GetCurrentSteps(PLAYER_1) then
		local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter();
		
	end
  end
  };
t[#t+1] = Def.ActorFrame{
	-- CURRENT SONG NAME
LoadFont("_futura 30px")..{	
	InitCommand=function(self)
		if PLAYER_1 then
			self:horizalign(left);
			self:maxwidth(800);
			self:x(SCREEN_LEFT+44);
			self:y(SCREEN_BOTTOM-82);
			self:zoom(0.6);
		end;
	end;
	OnCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		if song then
			self:settext(song:GetDisplayFullTitle().."  -  "..song:GetDisplayArtist());
			self:diffusealpha(1);
		else
			self:diffusealpha(0);
		end;
	end;
	};
};

t[#t+1] = LoadActor("music") .. {
	InitCommand=function(self)
			self:x(SCREEN_LEFT+20);
			self:y(SCREEN_BOTTOM-80);
			self:zoom(0.2);
	end;
};

return t
