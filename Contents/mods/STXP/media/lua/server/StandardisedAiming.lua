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


--*************************************************************************************************
--**  Would not recommend changing anything past this point, unless you know what you are doing! **
--*************************************************************************************************
StandardisedExperience = StandardisedExperience or {};

StandardisedExperience.onGunHitXp = function(owner, weapon, hitObject, damage)
	-- add xp for ranged weapon
	
	if weapon:isRanged() then
		local origXP = owner:getLastHitCount();
		local xp = origXP;
		if owner:getPerkLevel(Perks.Aiming) >= 5 then
			xp = origXP * 2.7 * StandardisedExperience.aimingMult;
			xp = xp - origXP;
			owner:getXp():AddXP(Perks.Aiming, xp);
		end
		if (owner:getPerkLevel(Perks.Aiming) < 5) and (StandardisedExperience.aimingMult ~= 1) then
			xp = origXP * 2.7 * StandardisedExperience.aimingMult;
			xp = xp - (origXP * 2.7);
			owner:getXp():AddXP(Perks.Aiming, xp);
		end
	end
end