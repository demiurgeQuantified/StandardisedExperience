--****************************************************************************************************************
--**		Created By: 	Conqueror Koala																		**
--**		Mod:			Standardized Sprinting XP															**
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

-- used everytime the player moves
StandardisedExperience.SprintingBonusXP = function()
	local player = getPlayer();
	local xp = player:getXp();
	-- if you're running and your endurance has changed
	if (player:IsRunning() or player:isSprinting()) and player:getStats():getEndurance() > player:getStats():getEndurancewarn() then
		-- you may gain 1 instance of Sprinting XP
		if xpThrottle > StandardisedExperience.sprintDelay then
			xp:AddXP(Perks.Sprinting, StandardisedExperience.sprintMult);
			xpThrottle = 0;
		end
		xpThrottle = xpThrottle + 1;
	end
end