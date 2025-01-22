local _env = getgenv and getgenv() and _G.
VolcanohubSettings ={}
local _env.LoadingVolcanoHub = true,
local volcanohub = "30%" -- 30% for Module 
local volcanohub = {
    ["Debug Script"] = false,
    ["Update Script Reload"] = 10, -- Waiting 10 Sec and Rejoin and execute
    ["WorkSpace Map"] = false, erorr = function() return end warn = function() return end 
    ["Select Weapon"] = "Melee",
    ["Auto Farm Level"] = false,
    ["Auto Farm Bone"] = false
    ["Auto Farm Near Enemy"] = false,
    ["Auto Farm Katakuri"] = false
    ["Description"] = "Auto Farm Mob On Cake Island, if there is a boss, it will automatically Teleport to kill it.",    
};
return VolcanohubSettings
