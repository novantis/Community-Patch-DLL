print("This is the city production automation for CBP")

function ShowCityProdAutomate()
    local player = Players[Game.GetActivePlayer()]
    local selectedCity = UI.GetHeadSelectedCity()
	if player:IsHuman() then
		if selectedCity:IsProductionAutomated() == true then
    		Controls.CityProdManual:SetHide(false)
		elseif selectedCity:IsProductionAutomated() == false then
    		Controls.CityProdAutomate:SetHide(false)
		end
	end
end
Events.SerialEventEnterCityScreen.Add(ShowCityProdAutomate)

----------------------------------------
function HideCityProdAutomate()
    Controls.CityProdManual:SetHide(false)
    Controls.CityProdAutomate:SetHide(false)
end
Events.SerialEventExitCityScreen.Add(HideCityProdAutomate)
Events.SerialEventDawnOfManHide.Add(HideCityProdAutomate)

----------------------------------------
function CityProdAutomate()
    local selectedCity = UI.GetHeadSelectedCity()
	selectedCity:SetProductionAutomated(true)
    Controls.CityProdManual:SetHide(false)
    Controls.CityProdAutomate:SetHide(true)
end

----------------------------------------
function CityProdManual()
    local selectedCity = UI.GetHeadSelectedCity()
	selectedCity:SetProductionAutomated(false)
    Controls.CityProdAutomate:SetHide(false)
    Controls.CityProdManual:SetHide(true)
end

Controls.CityProdAutomate:RegisterCallback(Mouse.eLClick, CityProdAutomate)
Controls.CityProdManual:RegisterCallback(Mouse.eLClick, CityProdManual)