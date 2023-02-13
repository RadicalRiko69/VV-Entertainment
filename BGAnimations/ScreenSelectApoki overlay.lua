local t = Def.ActorFrame {};

if SONGMAN:DoesSongGroupExist(RIO_FOLDER_NAMES["ApokiFolder"]) then
			--assert(SONGMAN:DoesSongGroupExist(RIO_FOLDER_NAMES["SnapTracksFolder"]),"You are missing the snap tracks folder from SYSTEM_PARAMETERS.lua which is required. The game cannot continue.");
		local folder = SONGMAN:GetSongsInGroup(RIO_FOLDER_NAMES["ApokiFolder"]);
		local randomSong = folder[math.random(1,#folder)]
		GAMESTATE:SetCurrentSong(randomSong);
		GAMESTATE:SetPreferredSong(randomSong);
		else
			lua.ReportScriptError("WHERE IS THE FOLDER???");
		end;
		

return t;
