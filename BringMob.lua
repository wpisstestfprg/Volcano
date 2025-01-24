local Debug = {}

function GetEnemyName(string)
  print("Get Enemy", string);
  return (string:find("Lv. ") and string:gsub(" %pLv. %d+%p", "") or string):gsub(" %pBoss%p", "");
end;

function WaitChilds(path, ...)
  local last = path;
  for _, child in {...} do
    last = last:FindFirstChild(child) or last:WaitForChild(child);
  end;
  return last;
end;

local function Bring(Enemy)
  local Character = Player.Character;
  local Humanoid = Enemy:WaitForChild("Humanoid");
  local RootPart = Enemy:WaitForChild("HumanoidRootPart");
  local Target = CachedBring[Enemy.Name];
  
  while Character and RootPart and Humanoid and Humanoid.Health > 0 do
    if Player:DistanceFromCharacter(RootPart.Position) < getgenv().Settings.Config["BringDistance"] then
      RootPart.CFrame = Target;
    else
      break;
    end;
    task.wait(0.5);
  end;
  return true;
end;

function Module:GetClosestByTag(Tag)
  local Cached = CachedEnemies[Tag];
  local Mobs = allMobs[Tag];
  
  if Cached and Cached.Parent and self.IsAlive(Cached) then
    return Cached;
  elseif not Mobs or #Mobs < 1 then
    return nil;
  end;

  local Position = (Player.Character or Player.CharacterAdded:Wait()).PrimaryPart.Position;
  local Distance, Nearest = math.huge;

  for _, Enemy in Mobs do
    local PrimaryPart = Enemy.PrimaryPart;

    if PrimaryPart and self.IsAlive(Enemy) then
      local Magnitude = (Position - PrimaryPart.Position).Magnitude;

      if Magnitude < 20 then
        CachedEnemies[Tag] = Enemy;
        return Enemy;
      elseif Magnitude < Distance then
        Distance, Nearest = Magnitude, Enemy;
      end;
    end;
  end;

  return Nearest;
end;

return Debug