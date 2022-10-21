--****************************************************************************************************************
--**		Created By: 	Conqueror Koala																		**
--**		Mod:			Standardized Passive XP																**
--**																											**		
--**		Information:																						**
--**					This code is totally free for you to edit, use, or copy however you want!				**
--**					Feel free to use any of the code in your own projects, don't worry about crediting. 	**
--**                                                                                                            **
--**        updated by albion! all the same permissions apply                                                   **
--****************************************************************************************************************

StandardisedExperience = StandardisedExperience or {};

-- do we get xp ?
local randXp = function(OneInX)
	return ZombRand(OneInX * GameTime:getInstance():getInvMultiplier()) == 0;
end

-- used everytime the player move
StandardisedExperience.PassiveBonusXP = function()
	local player = getPlayer();
	local xp = player:getXp();
	-- Passive fitness from running xp
	-- if you're running and your endurance has changed
	if (player:IsRunning() or player:isSprinting()) and player:getStats():getEndurance() > player:getStats():getEndurancewarn() then
		-- you may gain some xp in fitness
		if randXp(StandardisedExperience.fitnessChance) then
			xp:AddXP(Perks.Fitness, StandardisedExperience.fitnessBoost);
		end
	end

	-- if you're walking with a lot of stuff, you may gain in Strength
	if player:getInventoryWeight() > player:getMaxWeight() * 0.5 then
		if randXp(StandardisedExperience.strengthChance) then
			xp:AddXP(Perks.Strength, StandardisedExperience.strengthBoost);
		end
	end
end

-- when you or a npc try to hit a tree
StandardisedExperience.OnWeaponHitTree = function(owner, weapon)
	if not StandardisedExperience.minecraft then
		if weapon and weapon:getType() ~= "BareHands" then
			owner:getXp():AddXP(Perks.Strength, StandardisedExperience.strengthBoost);
		end
	else
		if weapon then
			owner:getXp():AddXP(Perks.Strength, StandardisedExperience.strengthBoost);
		end
	end
end

-- when you or a npc try to hit something
StandardisedExperience.onMeleeHitXp = function(owner, weapon, hitObject, damage)
	-- if you sucessful swing your non ranged weapon
	if owner:getStats():getEndurance() > owner:getStats():getEndurancewarn() and not weapon:isRanged() then
		owner:getXp():AddXP(Perks.Fitness, StandardisedExperience.fitnessBoost);
	end
	
	-- we add xp depending on how many target you hit
	if not weapon:isRanged() and owner:getLastHitCount() > 0 then
		owner:getXp():AddXP(Perks.Strength, (owner:getLastHitCount()*(StandardisedExperience.strengthBoost/2)));
	end
end