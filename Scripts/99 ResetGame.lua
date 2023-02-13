function ResetGame()
	--not yet
	--QUESTMODE:Reset();
	PREFSMAN:SetPreference("AllowW1",'AllowW1_Never');
	PREFSMAN:SetPreference("Premium",'DoubleFor1Credit');
	PREFSMAN:SetPreference("SongsPerPlay",1);
    PREFSMAN:SetPreference("AllowExtraStage",false);
	PREFSMAN:SetPreference("CoinsPerCredit",9999);
	PREFSMAN:SetPreference("CoinMode","Home");
	PREFSMAN:SetPreference("TimingWindowSecondsAttack",0.135000);
	PREFSMAN:SetPreference("TimingWindowSecondsHold",0.350);
	PREFSMAN:SetPreference("TimingWindowSecondsMine",0.070);
	PREFSMAN:SetPreference("TimingWindowSecondsRoll",100000.350);
	PREFSMAN:SetPreference("TimingWindowSecondsW1",0.000);
	PREFSMAN:SetPreference("TimingWindowSecondsW2",0.080);
	PREFSMAN:SetPreference("TimingWindowSecondsW3",0.000);
	PREFSMAN:SetPreference("TimingWindowSecondsW4",0.000);
	PREFSMAN:SetPreference("TimingWindowSecondsW5",0.000);

	--test
	--SCREENMAN:SystemMessage("idk what im doin")
end

function CoinMode()
    local t = {
        Name = "CoinMode";
        LayoutType = "ShowAllInRow";
        SelectType = "SelectOne";
        OneChoiceForAllPlayers = true;
        ExportOnChange = false;
        Choices = {"Home", "Convention"};
        LoadSelections = function(self, list, pn)
            if PREFSMAN:GetPreference("CoinMode") == "CoinMode_Free" then
                list[2] = true;
            else
                list[1] = true;
            end;
        end;
        SaveSelections = function(self, list, pn)
            if list[1] then
                PREFSMAN:SetPreference("CoinMode","Home");
            else
                PREFSMAN:SetPreference("CoinMode","Free");
            end;
            PREFSMAN:SavePreferences();
            --Used for testing purposes.
            --SCREENMAN:SystemMessage(PREFSMAN:GetPreference("CoinMode"))
        end;
    };
    setmetatable( t, t );
    return t;
end