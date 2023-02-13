local bOpen = false
local function GetTime(self)
  -- Painfully ugly, sorry.
  local c = self:GetChildren()
  local tTime = { Hour = nil, Minute = nil, Second = nil, Append = nil}

  if Hour() then tTime.Hour = Hour() else tTime.Hour = 0 end
  if Minute() then tTime.Minute = Minute() else tTime.Minute = 0 end
  if Second() then tTime.Second = Second() else tTime.Second = 0 end

  if( Hour() < 12 ) then
    tTime.Append = "AM"
  else
    tTime.Append = "PM"
  end

  if( Hour() == 0 ) then
    tTime.Hour = 12
  end

  c.Time:settextf("%02i:%02i:%02i %s",tTime.Hour,tTime.Minute,tTime.Second,tTime.Append)
end

return Def.ActorFrame{
  Def.ActorFrame {
      Def.BitmapText{
        Font= "_futura 30px",
        Text="Test",
        Name="Time",
        InitCommand=function(self) self:zoom(0.5) self:strokecolor(color("#000000")) end,
      },
      --
      BeginCommand=function(self)
        self:SetUpdateFunction( GetTime )
        self:SetUpdateRate( 1/30 )
      end
    },
    ToggleConsoleDisplayMessageCommand=function(self)
      bOpen = not bOpen
      if bOpen then self:playcommand("Show") else self:playcommand("Hide") end
    end,
    InitCommand=function(self) self:x(SCREEN_LEFT+50):y(SCREEN_TOP+14):visible(true) end,
    ShowCommand=function(self) self:finishtweening():visible(true) end,
    HideCommand=function(self) self:finishtweening():visible(false) end,
  }
