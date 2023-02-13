
--If true, will show all song groups instead of the below array.
showAllGroups = false

--Called from ScreenSelectPlayMode to pick a random group and the GroupWheel to show available groups
function getAvailableGroups()
	if RIO_FOLDER_NAMES['PREDEFINED_GROUP_LIST'] ~= false then
	return RIO_FOLDER_NAMES['PREDEFINED_GROUP_LIST'] end;
	
	local groups = SONGMAN:GetSongGroupNames();

	if not DoDebug then
		--Remove easy and special folder from the group select
		--I'm pretty sure this doesn't work since when you remove a group, the index is shifted down and removing k removes the wrong group?
		for k,v in pairs(groups) do
			if v == RIO_FOLDER_NAMES["ApokiFolder"] then
				table.remove(groups, k)
			elseif v == RIO_FOLDER_NAMES["LechatFolder"] then
				table.remove(groups, k)
			elseif v == RIO_FOLDER_NAMES["OvadozuFolder"] then
				table.remove(groups, k)
			--TODO: This should be done on startup.
			--Remove groups that only have 1 song, usually means 'info' folder and nothing else
			elseif (#SONGMAN:GetSongsInGroup(v))-1 < 1 then
				table.remove(groups, k)
			else
				Trace(v);
			end;
		end
	end;
	return groups;
end;

RIO_FOLDER_NAMES = {
	ApokiFolder = "Apoki",
	LechatFolder = "Lechat",
	OvadozuFolder = "Ovadozu",
	DefaultArcadeFolder,
	PREDEFINED_GROUP_LIST = false;
}