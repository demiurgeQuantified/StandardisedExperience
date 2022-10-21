--****************************************************************************************************************
--**		Created By: 	Conqueror Koala																		**
--**		Mod:			Standardized Nimble XP																**
--**																											**		
--**		Information:																						**
--**					This code is totally free for you to edit, use, or copy however you want!				**
--**					Feel free to use any of the code in your own projects, don't worry about crediting. 	**
--**                                                                                                            **
--**        updated by albion! all the same permissions apply                                                   **
--****************************************************************************************************************


--************************************************************************************************
--**  Would not recommend changing anything past this point unless you know what you are doing. **
--************************************************************************************************
StandardisedExperience = StandardisedExperience or {};
local xpThrottle = 0; -- Just a counting variable.

StandardisedExperience.NimbleBonusXP = function()
	local player = getPlayer();
	local xp = player:getXp();
	-- if you're aiming and walking
	if player:isAiming() then
		if(xpThrottle > StandardisedExperience.nimbleDelay) then
			xp:AddXP(Perks.Nimble, StandardisedExperience.nimbleMult);
			xpThrottle = 0;
		end
		xpThrottle = xpThrottle + 1;
	end
end