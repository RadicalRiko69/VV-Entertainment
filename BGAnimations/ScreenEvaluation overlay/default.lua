local t = Def.ActorFrame {};

local NAME = "";

if ThemePrefs.Get("TeamPreference") == "Apoki" then
  NAME = "apoki"
elseif ThemePrefs.Get("TeamPreference") == "Lechat" then
  NAME = "lechat"
elseif ThemePrefs.Get("TeamPreference") == "Ovadozu" then
  NAME = "ovadozu"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(THEME:GetPathB("","ScreenGameplay overlay/"..NAME));
  OnCommand=function(self)
	self:zoom(0.7);
	self:x(SCREEN_CENTER_X);
	self:y(SCREEN_CENTER_Y-420);
  end;
};
t[#t+1] = LoadFont("_montserrat light 30px") .. {
	InitCommand=cmd(Center;y,SCREEN_TOP+14;zoom,0.5;uppercase,true);
	OnCommand=function(self)
  	self:settext(NAME.."'S PLAYLIST");
	end;
};

t[#t+1] = LoadFont("Common large") .. {
	InitCommand=cmd(Center;y,SCREEN_TOP+34;zoom,1;uppercase,true);
	OnCommand=function(self)
  	self:settext("YOUR PERFORMANCE");
	end;
};

--Song Text
t[#t+1] = LoadFont("Common large") .. {
  InitCommand=cmd(Center;zoom,0.7;y,SCREEN_CENTER_Y-130;maxwidth,800);
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
  InitCommand=cmd(Center;y,SCREEN_CENTER_Y-104;zoom,0.4;maxwidth,1400);
  OnCommand=function(self)
    local song = GAMESTATE:GetCurrentSong()
    if song then
      self:settext(song:GetDisplayArtist());
    else
      self:diffusealpha(0);
    end;
  end;
};

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathG("","Common fallback banner"))..{
		  OnCommand=function(self)
						  self:zoom(0.164):Center():y(SCREEN_CENTER_Y-260);
		  end;
	  };
};

if not GAMESTATE:IsCourseMode() then
	local function JacketUpdate(self)
		local song = GAMESTATE:GetCurrentSong();
		local Jacket = self:GetChild("Jacket");
		local height = Jacket:GetHeight();
		
		if song then
			if song:HasJacket() then
				Jacket:visible(true);
				Jacket:Load(song:GetJacketPath());
				Jacket:scaletoclipped(180,180);
      elseif song:HasBanner() then
          Jacket:visible(true);
          Jacket:Load(song:GetBannerPath());
          Jacket:scaletoclipped(180,180);
			end;
		else
			Jacket:visible(false);
		end;
		
	end;
	t[#t+1] = Def.ActorFrame {
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-260;diffusealpha,1;SetUpdateFunction,JacketUpdate);
		Def.Sprite {
			Name="Jacket";
		};	
	};
end;

t[#t+1] = Def.Sound{
		File=GAMESTATE:GetCurrentSong():GetMusicPath();
		OnCommand=function(self)
			local audio = self:get()
			audio:volume(1)
			self:play()
		end;
		OffCommand=function(self)
			self:stop()
		end;
	};
	--Header Text
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(zoom,5;addy,500);
	--Score
	
		LoadFont("_montserrat black 30px")..{
			InitCommand=function(self)
				if PLAYER_1 then
					self:horizalign(left);
					self:x(SCREEN_LEFT+5);
					self:y(20);
					self:zoom(0.2);
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
									self:settext("0%");	
								end
							end;
						self:settext("Reach: "..value.."%");		
			end;
		};
		--Max Combo
		LoadFont("_montserrat black 30px")..{
			InitCommand=function(self)
				if PLAYER_1 then
					self:horizalign(left);
					self:x(SCREEN_LEFT+5);
					self:y(50);
					self:zoom(0.2);
				end;
			end;
			OnCommand=cmd(playcommand,"Change");
			ChangeCommand=function(self)
						self:settext("Comments: "..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):MaxCombo());			
			end;
		};
		--Notes Hit
		LoadFont("_montserrat black 30px")..{
			InitCommand=function(self)
				if PLAYER_1 then
					self:horizalign(left);
					self:x(SCREEN_LEFT+5);
					self:y(30);
					self:zoom(0.2);
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
						self:settext("Likes: "..current.."K");
					else
						self:settext("Likes: 0");
					end
				if current >= 1050 then
					self:settext("Likes: "..extra.."M");
				elseif current >= 1000 then
					self:settext("Likes: 1M");
				end
				--SCREENMAN:SystemMessage(extra);
			end;
		};		
		--Misses
		LoadFont("_montserrat black 30px")..{
			InitCommand=function(self)
				if PLAYER_1 then
					self:horizalign(left);
					self:x(SCREEN_LEFT+5);
					self:y(40);
					self:zoom(0.2);
				end;
			end;
			OnCommand=cmd(playcommand,"Change");
			ChangeCommand=function(self)
						self:settext("Dislikes: "..STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_Miss"));	
			end;
		};
		--Name
		LoadFont("_montserrat black 30px") .. {
			InitCommand=cmd(maxwidth,580;zoom,0.2);
			OnCommand=function(self)
				if PLAYER_1 then
					self:horizalign(left);
					self:x(SCREEN_LEFT+5);
				end;
			end;
		
			
			BeginCommand=function(self)
				local profile = PROFILEMAN:GetProfile(PLAYER_1);
				local name = profile:GetDisplayName();
				
				if GAMESTATE:IsHumanPlayer(PLAYER_1) == true then
					if name=="" and SCREENMAN:GetTopScreen():GetName() ~= "ScreenDemonstration" then
						if PLAYER_1 then
							self:settext("Dancer: @User name");
						end
					else
						self:settext("Dancer: @"..name );
					end
				end	
				
			end;
		};
		--Level
		LoadFont("_montserrat black 30px") .. {
			InitCommand=function(self)
				if PLAYER_1 then
					self:horizalign(left);
					self:x(SCREEN_LEFT+5);
					self:y(10);
					self:zoom(0.2);
				end;
			end;
			OnCommand=function(self)
			  if GAMESTATE:GetCurrentSteps(PLAYER_1) then
				  local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();
				  local lvl = GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter();
				  local desc = "";
					  if lvl >= 20 then
						  desc = "Intense";
					elseif lvl >= 17 then
						desc = "Extreme";
					elseif lvl >= 14 then
						desc = "Difficult";
					elseif lvl >= 11 then
						desc = "Confusing";
					elseif lvl >= 8 then
						desc = "Intimidating";
					elseif lvl >= 5 then
						desc = "Moderate";
					elseif lvl >= 2 then
						desc = "Easy";
					else
						desc = "Beginner";
						end;
				  if diff == "Difficulty_Beginner" then
					  self:settext("Intensity: "..desc.." - Lv."..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
				  elseif diff == "Difficulty_Easy" then
					  self:settext("Intensity: "..desc.." - Lv."..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
				  elseif diff == "Difficulty_Medium" then
					  self:settext("Intensity: "..desc.." - Lv."..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
				  elseif diff == "Difficulty_Hard" then
					  self:settext("Intensity: "..desc.." - Lv."..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
				  elseif diff == "Difficulty_Challenge" then
					  self:settext("Intensity: "..desc.." - Lv."..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
				  elseif diff == "Difficulty_Edit" then
					  self:settext("Intensity: "..desc.." - Lv."..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
				  else
					  self:settext("what do I put here?");
				  end
			  end;
		  end;
		};
	  };
	return t