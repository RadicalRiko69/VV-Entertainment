local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{

  PlayerJoinedMessageCommand=function(self)
    SCREENMAN:SetNewScreen("ScreenTitleMenu");
  end;

  OnCommand=function(self)
    if GAMESTATE:IsSideJoined(PLAYER_2) then
      SCREENMAN:SetNewScreen("ScreenTitleMenu");
      SCREENMAN:SystemMessage("This is only compatible with P1! Sorry!");
    end;
  end
};

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
  OffCommand=function(self)
    SOUND:StopMusic();
  end;
};

t[#t+1] = Def.ActorFrame{
  LoadActor(THEME:GetPathS("","leave"))..{
		OffCommand=function(self)
						self:play();
		end;
	};
};
t[#t+1] = LoadFont("_montserrat black 30px") .. {
	InitCommand=cmd(Center;y,SCREEN_TOP+34;zoom,1;uppercase,true);
	OnCommand=function(self)
  	self:settext(NAME.."'S PLAYLIST");
	end;
};

t[#t+1] = Def.ActorFrame{
  Def.Quad{
		InitCommand=function(self) self:Center():addy(-40):zoomto(960,600)
      :diffuse(color("#000000")):diffusealpha(0.8)
      :fadebottom(0.1):fadetop(0.1) end
	};
  LoadActor(THEME:GetPathG("","button/arrow")) .. {
    InitCommand=cmd(Center;addy,-400;thump;effectclock,"beatnooffset";linear,0.3;zoom,0.2;addx,150);
    NextSongMessageCommand=cmd(finishtweening;addx,20;linear,0.2;addx,-20)
  };
  LoadActor(THEME:GetPathG("","button/arrow")) .. {
    InitCommand=cmd(Center;rotationz,180;thump;effectclock,"beatnooffset";addy,-400;linear,0.3;zoom,0.2;addx,-150);
    PreviousSongMessageCommand=cmd(finishtweening;addx,-20;linear,0.2;addx,20)
  };
  LoadActor("diff") .. {
    InitCommand=cmd(Center;zoom,0.6;addx,180;addy,180);
  };
  LoadActor("wheel") .. {
    InitCommand=cmd(Center;zoom,0.6;addx,200;addy,-340);
  };
  LoadActor("bpm") .. {
    InitCommand=cmd(Center;zoom,0.6;addx,-180;addy,170);
  };
  LoadActor("song") .. {
    InitCommand=cmd(Center;zoom,0.6;addx,-220;addy,-50);
  };
};

t[#t+1] = LoadFont("_montserrat light 30px")..{
  InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X-100;y,SCREEN_CENTER_Y+102;zoom,0.6);
  CurrentSongChangedMessageCommand=function(self)
  if GAMESTATE:GetCurrentSong() then
    local length = GAMESTATE:GetCurrentSong():MusicLengthSeconds()
    self:settext("SONG LENGTH: "..SecondsToMMSS(length));
  else
    self:settext("SONG LENGTH: N/A");
  end;
end;
};

t[#t+1] = Def.ActorFrame{
    --Header Text
	LoadFont("_montserrat light 30px") .. {
    Text="SELECT A SONG";
    InitCommand=cmd(Center;y,SCREEN_TOP+14;zoom,0.5);
  };
--Song Text
LoadFont("Common large") .. {
  InitCommand=cmd(Center;zoom,1;y,SCREEN_CENTER_Y-260;maxwidth,550);
  CurrentSongChangedMessageCommand=function(self)
    local song = GAMESTATE:GetCurrentSong()
    if song then
      self:settext(song:GetDisplayFullTitle());
      self:stoptweening();
      self:diffusealpha(0);
      self:x(SCREEN_CENTER_X+100);
      self:decelerate(0.3);
      self:x(SCREEN_CENTER_X);
      self:diffusealpha(1);
    else
      self:diffusealpha(0);
    end;
  end;
};
LoadFont("_montserrat light 30px") .. {
  InitCommand=cmd(Center;zoom,0.8;y,SCREEN_CENTER_Y-230;maxwidth,700);
  CurrentSongChangedMessageCommand=function(self)
    local song = GAMESTATE:GetCurrentSong()
    if song then
      self:settext(song:GetDisplayArtist());
      self:stoptweening();
      self:diffusealpha(0);
      self:x(SCREEN_CENTER_X-100);
      self:decelerate(0.3);
      self:x(SCREEN_CENTER_X);
      self:diffusealpha(1);
    else
      self:diffusealpha(0);
    end;
  end;
};
};

--Difficulty Orb
t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(Center;zoom,0;addy,100;addx,220;decelerate,0.3;zoom,0.6);
  LoadActor(THEME:GetPathG("","button/donut")) .. {
  };
  LoadActor(THEME:GetPathG("","button/ugh")) .. {
    InitCommand=cmd(queuecommand,"Set");
    CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
    CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
    SetMessageCommand=function(self)
      if GAMESTATE:GetCurrentSteps(PLAYER_1) then
        local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter();
        if diff >= 20 then
          self:finishtweening();
          self:decelerate(0.1);
          self:rotationz(93);
          self:visible(true);
        elseif diff == 19 then
          self:finishtweening();
          self:decelerate(0.1);
          self:rotationz(82);
          self:visible(true);
        elseif diff == 18 then
          self:finishtweening();
          self:decelerate(0.1);
          self:rotationz(62);
          self:visible(true);
        elseif diff == 17 then
          self:finishtweening();
          self:decelerate(0.1);
          self:rotationz(42);
          self:visible(true);
        elseif diff == 16 then
          self:finishtweening();
          self:decelerate(0.1);
          self:rotationz(22);
          self:visible(true);
        elseif diff == 15 then
          self:finishtweening();
          self:decelerate(0.1);
          self:rotationz(12);
          self:visible(true);
        elseif diff <= 14 then
          self:finishtweening();
          self:decelerate(0.1);
          self:rotationz(0);
          self:visible(true);
        end
      end;
    end
  };
  LoadActor(THEME:GetPathG("","button/filler")) .. {
    InitCommand=cmd(queuecommand,"Set");
    CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
    CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
    SetMessageCommand=function(self)
      if GAMESTATE:GetCurrentSteps(PLAYER_1) then
        local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter();
        if diff >= 20 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0.7);
          self:rotationz(62);
          self:visible(false);
        elseif diff == 19 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0.7);
          self:rotationz(92);
          self:visible(false);
        elseif diff == 18 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0.7);
          self:rotationz(82);
          self:visible(true);
        elseif diff == 17 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0.7);
          self:rotationz(62);
          self:visible(true);
        elseif diff == 16 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0.5);
          self:rotationz(42);
          self:visible(true);
        elseif diff == 15 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0);
          self:rotationz(22);
          self:visible(true);
        elseif diff == 14 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0);
          self:rotationz(12);
          self:visible(true);
        elseif diff == 13 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0);
          self:rotationz(0);
          self:visible(true);
        elseif diff == 12 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0);
          self:rotationz(-12);
          self:visible(true);
        elseif diff == 11 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0);
          self:rotationz(-22);
          self:visible(true);
        elseif diff == 10 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0);
          self:rotationz(-32);
          self:visible(true);
        elseif diff == 9 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0);
          self:rotationz(-42);
          self:visible(true);
        elseif diff == 8 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0);
          self:rotationz(-52);
          self:visible(true);
        elseif diff == 7 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0);
          self:rotationz(-62);
          self:visible(true);
        elseif diff == 6 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0);
          self:rotationz(-72);
          self:visible(true);
        elseif diff == 5 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0);
          self:rotationz(-82);
          self:visible(true);
        elseif diff == 4 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0);
          self:rotationz(-92);
          self:visible(true);
        elseif diff == 3 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0);
          self:rotationz(-102);
          self:visible(true);
        elseif diff == 2 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0);
          self:rotationz(-122);
          self:visible(true);
        elseif diff == 1 then
          self:finishtweening();
          self:decelerate(0.1);
          self:cropright(0);
          self:rotationz(-142);
          self:visible(true);
        end
      end;
    end
  };
  LoadActor(THEME:GetPathG("","button/meter")) .. {
  };
};

--Speed Orb
t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(Center;animate,false;zoom,0;addy,100;addx,-220;decelerate,0.3;zoom,0.6);
  LoadActor(THEME:GetPathG("","button/beat")) .. {
  };
  LoadActor(THEME:GetPathG("","button/mask")) .. {
    OnCommand=cmd(MaskSource);
  };
  LoadActor(THEME:GetPathG("","button/speed")) .. {
    InitCommand=cmd(MaskDest;addx,-70;zoomx,0;zoomy,0.65;horizalign,left;queuecommand,"Set");
    OnCommand=cmd(queuecommand,"Set");
    CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
    SetMessageCommand=function(self)
      if GAMESTATE:GetCurrentSong() then
        local tempo = GAMESTATE:GetCurrentSong():GetDisplayBpms();
				local high = math.ceil(tempo[2]);
        if high >= 200 then
          self:finishtweening();
          self:decelerate(0.2);
          self:zoomx(15);
        elseif high >= 190 then
          self:finishtweening();
          self:decelerate(0.2);
          self:zoomx(11);
        elseif high >= 170 then
          self:finishtweening();
          self:decelerate(0.2);
          self:zoomx(8.5);
        elseif high >= 150 then
          self:finishtweening();
          self:decelerate(0.2);
          self:zoomx(6.5);
        elseif high >= 130 then
          self:finishtweening();
          self:decelerate(0.2);
          self:zoomx(4.5);
        elseif high >= 100 then
          self:finishtweening();
          self:decelerate(0.2);
          self:zoomx(2.5);
        elseif high >= 80 then
          self:finishtweening();
          self:decelerate(0.2);
          self:zoomx(1);
        else
          self:finishtweening();
          self:decelerate(0.2);
          self:zoomx(0);
      end;
    end
  end
  };
  LoadActor(THEME:GetPathG("","button/tempo")) .. {
  };
};

--Level
t[#t+1] = Def.ActorFrame{
  LoadFont("Common large") .. {
	InitCommand=function(self)
		if PLAYER_1 then
			self:x(SCREEN_RIGHT-40);
			self:y(SCREEN_CENTER_Y+170);
      self:horizalign(right);
			self:zoom(0.8);
		end;
	end;
	CurrentStepsP1ChangedMessageCommand=function(self)
	  if GAMESTATE:GetCurrentSteps(PLAYER_1) then
		  local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();
		  if diff == "Difficulty_Beginner" then
			  self:settext("Lv."..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
		  elseif diff == "Difficulty_Easy" then
			  self:settext("Lv."..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
		  elseif diff == "Difficulty_Medium" then
			  self:settext("Lv."..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
		  elseif diff == "Difficulty_Hard" then
			  self:settext("Lv."..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
		  elseif diff == "Difficulty_Challenge" then
			  self:settext("Lv."..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
		  elseif diff == "Difficulty_Edit" then
			  self:settext("Lv."..GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
		  else
			  self:settext("what do I put here?");
		  end
	  end;
  end;
};
LoadFont("_montserrat light 30px")..{
  InitCommand=cmd(diffusealpha,1;horizalign,right;
  x,SCREEN_RIGHT-40;y,SCREEN_CENTER_Y+190;zoom,0.5);
  OnCommand=cmd(queuecommand,"Set");
  CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
  CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
  SetMessageCommand=function(self)
    if GAMESTATE:GetCurrentSteps(PLAYER_1) then
      local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter();
      if diff >= 20 then
        self:settext("INTENSE");
      elseif diff >= 17 then
        self:settext("EXTREME");
      elseif diff >= 14 then
        self:settext("DIFFICULT");
      elseif diff >= 11 then
        self:settext("CONFUSING");
      elseif diff >= 8 then
        self:settext("INTIMIDATING");
      elseif diff >= 5 then
        self:settext("MODERATE");
      elseif diff >= 2 then
        self:settext("EASY");
      else
        self:settext("BEGINNER");
    end;
  end
end
};
--BPM DISPLAY
LoadFont("Common large")..{
	InitCommand=cmd(diffusealpha,1;uppercase,true;horizalign,left;
  x,SCREEN_LEFT+40;y,SCREEN_CENTER_Y+170;zoom,0.8);
	CurrentSongChangedMessageCommand=function(self)

		local song = GAMESTATE:GetCurrentSong();
		-- ROAD24: more checks,
		-- TODO: decide what to do if no song is chosen, ignore or hide ??
		if song then
			  local speedvalue
				local rawbpm = GAMESTATE:GetCurrentSong():GetDisplayBpms();
				local lobpm = math.ceil(rawbpm[1]);
				local hibpm = math.ceil(rawbpm[2]);
				if lobpm == hibpm then
					speedvalue = "BPM: "..hibpm
				else
					speedvalue = "BPM: "..lobpm.."~"..hibpm
				end;
			self:settext(speedvalue);
			self:diffusealpha(1);
		else
			self:settext("BPM: N/A");
		end;
  end
};
LoadFont("_montserrat light 30px")..{
  InitCommand=cmd(diffusealpha,1;horizalign,left;
  x,SCREEN_LEFT+40;y,SCREEN_CENTER_Y+190;zoom,0.5);
  OnCommand=cmd(queuecommand,"Set");
  CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
  SetMessageCommand=function(self)
    if GAMESTATE:GetCurrentSong() then
      local tempo = GAMESTATE:GetCurrentSong():GetDisplayBpms();
      local high = math.ceil(tempo[2]);
      if high >= 200 then
        self:settext("EXTREMELY FAST");
      elseif high >= 190 then
        self:settext("VERY FAST");
      elseif high >= 170 then
        self:settext("FAST");
      elseif high >= 150 then
        self:settext("STEADY");
      elseif high >= 130 then
        self:settext("MILD");
      elseif high >= 100 then
        self:settext("NORMAL");
      elseif high >= 80 then
        self:settext("SLOW");
      else
        self:settext("EXTREMELY SLOW");
    end;
  end
end
};
};

t[#t+1] = Def.ActorFrame{
  LoadActor(THEME:GetPathG("","Common fallback banner"))..{
		OnCommand=function(self)
						self:zoom(0.277):Center():y(SCREEN_CENTER_Y-60);
		end;
	};
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
				Jacket:scaletoclipped(300,300);
      elseif song:HasBanner() then
          self:visible(true);
          Jacket:visible(true);
          Jacket:Load(song:GetBannerPath());
          Jacket:scaletoclipped(300,300);
      else
        self:visible(false);
			end;
		else
			Jacket:visible(false);
		end;
	end;
	t[#t+1] = Def.ActorFrame {
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-60;diffusealpha,1;SetUpdateFunction,JacketUpdate);
		Def.Sprite {
			Name="Jacket";
		};	
	};
end;

	
return t