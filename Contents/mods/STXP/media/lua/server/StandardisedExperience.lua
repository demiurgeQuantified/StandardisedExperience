-- written by albion
-- this code is free for you to edit, copy, study, etc

StandardisedExperience = StandardisedExperience or {}
local SandboxVars = SandboxVars
local aimingMult = {1,1.5,2,3,5,10};

local nimbleMult = {5,10,25,50,100,1000};
local nimbleDelay = {250,500,1000,2500,5000};

local sprintMult = {1,5,10,25,50,100,1000};
local sprintDelay = {250,500,1000,1500,2000,3000,5000,10000};

local passiveBoost = {1,2,3,4,5,10,15,25,50,100,1000}
local passiveChance = {200,300,500,700,1000}

local function STXP_onGameStart()
    if SandboxVars.StandardisedExperience.WantSTAiming then
        Events.OnWeaponHitXp.Add(StandardisedExperience.onGunHitXp)
        StandardisedExperience.aimingMult = aimingMult[SandboxVars.StandardisedExperience.AimingMultiplier]
    end
    if SandboxVars.StandardisedExperience.WantSTNimble then
        Events.OnPlayerMove.Add(StandardisedExperience.NimbleBonusXP)
        StandardisedExperience.nimbleMult = nimbleMult[SandboxVars.StandardisedExperience.NimbleMult]
        StandardisedExperience.nimbleDelay = nimbleDelay[SandboxVars.StandardisedExperience.NimbleDelay]
    end
    if SandboxVars.StandardisedExperience.WantSTSprinting then
        Events.OnPlayerMove.Add(StandardisedExperience.SprintingBonusXP)
        StandardisedExperience.sprintMult = sprintMult[SandboxVars.StandardisedExperience.SprintMult]
        StandardisedExperience.sprintDelay = sprintDelay[SandboxVars.StandardisedExperience.SprintDelay]
    end
    if SandboxVars.StandardisedExperience.WantSTPassive then
        Events.OnPlayerMove.Add(StandardisedExperience.PassiveBonusXP)
        Events.OnWeaponHitTree.Add(StandardisedExperience.OnWeaponHitTree)
        Events.OnWeaponHitXp.Add(StandardisedExperience.onMeleeHitXp)
        StandardisedExperience.fitnessBoost = passiveBoost[SandboxVars.StandardisedExperience.FitnessBoost]
        StandardisedExperience.fitnessChance = passiveChance[SandboxVars.StandardisedExperience.FitnessChance]
        StandardisedExperience.strengthBoost = passiveBoost[SandboxVars.StandardisedExperience.StrengthBoost]
        StandardisedExperience.strengthChance = passiveChance[SandboxVars.StandardisedExperience.StrengthChance]
        StandardisedExperience.minecraft = SandboxVars.StandardisedExperience.Minecraft
    end
    -- reloading xp is handled by the client
end

Events.OnGameStart.Add(STXP_onGameStart)