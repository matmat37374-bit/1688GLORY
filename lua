local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "1688 MAINCHEAT V1",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Made by MATMAT",
   LoadingSubtitle = "by Tensai",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "1688"
   },

  Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "nil", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "1688XGLØRY MAIN CHEAT",
      Subtitle = "LINK IN DISCORD",
      Note = "1688 0N TOP BITCH", -- Use this to tell the user how to get a key
      FileName = "Check Discord For Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"pogisimat"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local MainTab = Window:CreateTab("MAIN SCRIPT", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "1688",
   Content = "Thankyou For Using 1688XGLØRY Script",
   Duration = 5,
   Image = nil,
})

local Button = MainTab:CreateButton({
   Name = "INFINITE YIELD [1688]",
   Callback = function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "MUSIC EXPO [1688]",
   Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Roblox-HttpSpy/my-Garbage/refs/heads/main/FeMusicExploit.lua"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "ESP [1688]",
   Callback = function()
   -- UI Setup
local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "ESP_UI"

local ToggleButton = Instance.new("TextButton", ScreenGui)
ToggleButton.Size = UDim2.new(0, 100, 0, 40)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Text = "Toggle ESP"
ToggleButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
ToggleButton.TextColor3 = Color3.new(1, 1, 1)

local ShowNameButton = Instance.new("TextButton", ScreenGui)
ShowNameButton.Size = UDim2.new(0, 100, 0, 40)
ShowNameButton.Position = UDim2.new(0, 10, 0, 60)
ShowNameButton.Text = "Show Name: ON"
ShowNameButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
ShowNameButton.TextColor3 = Color3.new(1, 1, 1)

local HighlightButton = Instance.new("TextButton", ScreenGui)
HighlightButton.Size = UDim2.new(0, 100, 0, 40)
HighlightButton.Position = UDim2.new(0, 10, 0, 110)
HighlightButton.Text = "Highlight: ON"
HighlightButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
HighlightButton.TextColor3 = Color3.new(1, 1, 1)

local ESPEnabled = false
local ShowName = true
local HighlightEnabled = true

-- Armazenar jogadores que estavam no servidor antes de vocÃª
local playersBefore = {}

-- ESP Function
local function createESPBox(player, isNewPlayer)
    -- Criar o quadrado para ESP
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = isNewPlayer and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)  -- Verde para novos, vermelho para antigos
    box.Thickness = 2
    box.Filled = false

    -- Criar o nome do jogador
    local nameLabel = Drawing.new("Text")
    nameLabel.Visible = false
    nameLabel.Text = player.Name
    nameLabel.Color = Color3.new(1, 1, 1)
    nameLabel.Size = 20
    nameLabel.Center = true
    nameLabel.Outline = true
    nameLabel.OutlineColor = Color3.new(0, 0, 0)

    local highlight = nil
    if HighlightEnabled then
        highlight = Instance.new("Highlight", player.Character)
        highlight.FillColor = isNewPlayer and Color3.new(0, 1, 0) or Color3.new(1, 1, 0)  -- Verde para novos, amarelo para antigos
        highlight.OutlineColor = Color3.new(1, 0, 0)
        highlight.OutlineTransparency = 0.5
    end

    local runService = game:GetService("RunService")

    local function update()
        runService.RenderStepped:Connect(function()
            if ESPEnabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = player.Character.HumanoidRootPart
                local vector, onScreen = workspace.CurrentCamera:WorldToViewportPoint(hrp.Position)

                if onScreen then
                    local size = Vector2.new(60, 100)
                    box.Size = size
                    box.Position = Vector2.new(vector.X - size.X / 2, vector.Y - size.Y / 2)
                    box.Visible = true

                    -- Mostrar nome se habilitado
                    if ShowName then
                        nameLabel.Position = Vector2.new(vector.X, vector.Y - size.Y / 2 - 15)
                        nameLabel.Visible = true
                    else
                        nameLabel.Visible = false
                    end
                else
                    box.Visible = false
                    nameLabel.Visible = false
                end
            else
                box.Visible = false
                nameLabel.Visible = false
                if highlight then
                    highlight.Enabled = false
                end
            end
        end)
    end

    update()
end

-- Apply ESP to all players (Iniciando com jogadores antes de vocÃª)
for _, plr in pairs(game.Players:GetPlayers()) do
    if plr ~= game.Players.LocalPlayer then
        local isNewPlayer = not playersBefore[plr.UserId]  -- Verifica se o jogador Ã© novo
        createESPBox(plr, isNewPlayer)
        playersBefore[plr.UserId] = true  -- Marca o jogador como jÃ¡ presente
    end
end

-- Update for new players
game.Players.PlayerAdded:Connect(function(plr)
    if plr ~= game.Players.LocalPlayer then
        plr.CharacterAdded:Connect(function()
            wait(1)
            local isNewPlayer = not playersBefore[plr.UserId]  -- Verifica se o jogador Ã© novo
            createESPBox(plr, isNewPlayer)
            playersBefore[plr.UserId] = true  -- Marca o jogador como jÃ¡ presente
        end)
    end
end)

-- Toggle ESP Button
ToggleButton.MouseButton1Click:Connect(function()
    ESPEnabled = not ESPEnabled
    ToggleButton.Text = ESPEnabled and "ESP: ON" or "ESP: OFF"
end)

-- Show Name Button
ShowNameButton.MouseButton1Click:Connect(function()
    ShowName = not ShowName
    ShowNameButton.Text = ShowName and "Show Name: ON" or "Show Name: OFF"
end)

-- Highlight Button
HighlightButton.MouseButton1Click:Connect(function()
    HighlightEnabled = not HighlightEnabled
    HighlightButton.Text = HighlightEnabled and "Highlight: ON" or "Highlight: OFF"
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "LOOPBRING ALL [1688]",
   Callback = function()
   local L1 = true;
local L2 = game.Players.LocalPlayer.Character.HumanoidRootPart;
local L3 = L2.Position - Vector3.new(5, 0, 0)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(L_4_arg1)
    if L_4_arg1 == 'f' then
        L1 = not L1
    end;
    if L_4_arg1 == 'r' then
        L2 = game.Players.LocalPlayer.Character.HumanoidRootPart;
        L3 = L2.Position - Vector3.new(5, 0, 0)
    end
end)

for L_5_forvar1, L_6_forvar2 in pairs(game.Players:GetPlayers()) do
    if L_6_forvar2 == game.Players.LocalPlayer then
    else
        local L7 = coroutine.create(function()
            game:GetService('RunService').RenderStepped:Connect(function()
                local L8, L9 = pcall(function()
                    local L10 = L_6_forvar2.Character;
                    if L10 then
                        if L10:FindFirstChild("HumanoidRootPart") then
                            if L1 then
                                L_6_forvar2.Backpack:ClearAllChildren()
                                for L_11_forvar1, L_12_forvar2 in pairs(L10:GetChildren()) do
                                    if L_12_forvar2:IsA("Tool") then
                                        L_12_forvar2:Destroy()
                                    end
                                end;
                                L10.HumanoidRootPart.CFrame = CFrame.new(L3)
                            end
                        end
                    end
                end)
                if L8 then
                else
                    warn("Unnormal error: "..L9)
                end
            end)
        end)
        coroutine.resume(L7)
    end
end;
-- check for updates
game.Players.PlayerAdded:Connect(function(L_13_arg1)
    if L_13_arg1 == game.Players.LocalPlayer then
    else
        local L14 = coroutine.create(function()
            game:GetService('RunService').RenderStepped:Connect(function()
                local L15, L16 = pcall(function()
                    local L17 = L_13_arg1.Character;
                    if L17 then
                        if L17:FindFirstChild("HumanoidRootPart") then
                            if L1 then
                                L_13_arg1.Backpack:ClearAllChildren()
                                for L_18_forvar1, L_19_forvar2 in pairs(L17:GetChildren()) do
                                    if L_19_forvar2:IsA("Tool") then
                                        L_19_forvar2:Destroy()
                                    end
                                end;
                                L17.HumanoidRootPart.CFrame = CFrame.new(L3)
                            end
                        end
                    end
                end)
                if L15 then
                else
                    warn("Unnormal error: "..L16)
                end
            end)
        end)
        coroutine.resume(L14)
    end
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "BIG HEAD [1688]",
   Callback = function()
   _G.HeadSize = 4 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.Head.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.Head.Transparency = 0.4 v.Character.Head.BrickColor = BrickColor.new("Red") v.Character.Head.Material = "Neon" v.Character.Head.CanCollide = false v.Character.Head.Massless = true end) end end end end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "AIMBOT [1688]",
   Callback = function()
   --// Cache

local select = select
local pcall, getgenv, next, Vector2, mathclamp, type, mousemoverel = select(1, pcall, getgenv, next, Vector2.new, math.clamp, type, mousemoverel or (Input and Input.MouseMove))

--// Preventing Multiple Processes

pcall(function()
	getgenv().Aimbot.Functions:Exit()
end)

--// Environment

getgenv().Aimbot = {}
local Environment = getgenv().Aimbot

--// Services

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

--// Variables

local RequiredDistance, Typing, Running, Animation, ServiceConnections = 2000, false, false, nil, {}

--// Script Settings

Environment.Settings = {
	Enabled = true,
	TeamCheck = false,
	AliveCheck = true,
	WallCheck = false, -- Laggy
	Sensitivity = 0, -- Animation length (in seconds) before fully locking onto target
	ThirdPerson = false, -- Uses mousemoverel instead of CFrame to support locking in third person (could be choppy)
	ThirdPersonSensitivity = 3, -- Boundary: 0.1 - 5
	TriggerKey = "MouseButton2",
	Toggle = false,
	LockPart = "Head" -- Body part to lock on
}

Environment.FOVSettings = {
	Enabled = true,
	Visible = true,
	Amount = 90,
	Color = Color3.fromRGB(255, 255, 255),
	LockedColor = Color3.fromRGB(255, 70, 70),
	Transparency = 0.5,
	Sides = 60,
	Thickness = 1,
	Filled = false
}

Environment.FOVCircle = Drawing.new("Circle")

--// Functions

local function CancelLock()
	Environment.Locked = nil
	if Animation then Animation:Cancel() end
	Environment.FOVCircle.Color = Environment.FOVSettings.Color
end

local function GetClosestPlayer()
	if not Environment.Locked then
		RequiredDistance = (Environment.FOVSettings.Enabled and Environment.FOVSettings.Amount or 2000)

		for _, v in next, Players:GetPlayers() do
			if v ~= LocalPlayer then
				if v.Character and v.Character:FindFirstChild(Environment.Settings.LockPart) and v.Character:FindFirstChildOfClass("Humanoid") then
					if Environment.Settings.TeamCheck and v.Team == LocalPlayer.Team then continue end
					if Environment.Settings.AliveCheck and v.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then continue end
					if Environment.Settings.WallCheck and #(Camera:GetPartsObscuringTarget({v.Character[Environment.Settings.LockPart].Position}, v.Character:GetDescendants())) > 0 then continue end

					local Vector, OnScreen = Camera:WorldToViewportPoint(v.Character[Environment.Settings.LockPart].Position)
					local Distance = (Vector2(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2(Vector.X, Vector.Y)).Magnitude

					if Distance < RequiredDistance and OnScreen then
						RequiredDistance = Distance
						Environment.Locked = v
					end
				end
			end
		end
	elseif (Vector2(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2(Camera:WorldToViewportPoint(Environment.Locked.Character[Environment.Settings.LockPart].Position).X, Camera:WorldToViewportPoint(Environment.Locked.Character[Environment.Settings.LockPart].Position).Y)).Magnitude > RequiredDistance then
		CancelLock()
	end
end

--// Typing Check

ServiceConnections.TypingStartedConnection = UserInputService.TextBoxFocused:Connect(function()
	Typing = true
end)

ServiceConnections.TypingEndedConnection = UserInputService.TextBoxFocusReleased:Connect(function()
	Typing = false
end)

--// Main

local function Load()
	ServiceConnections.RenderSteppedConnection = RunService.RenderStepped:Connect(function()
		if Environment.FOVSettings.Enabled and Environment.Settings.Enabled then
			Environment.FOVCircle.Radius = Environment.FOVSettings.Amount
			Environment.FOVCircle.Thickness = Environment.FOVSettings.Thickness
			Environment.FOVCircle.Filled = Environment.FOVSettings.Filled
			Environment.FOVCircle.NumSides = Environment.FOVSettings.Sides
			Environment.FOVCircle.Color = Environment.FOVSettings.Color
			Environment.FOVCircle.Transparency = Environment.FOVSettings.Transparency
			Environment.FOVCircle.Visible = Environment.FOVSettings.Visible
			Environment.FOVCircle.Position = Vector2(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
		else
			Environment.FOVCircle.Visible = false
		end

		if Running and Environment.Settings.Enabled then
			GetClosestPlayer()

			if Environment.Locked then
				if Environment.Settings.ThirdPerson then
					Environment.Settings.ThirdPersonSensitivity = mathclamp(Environment.Settings.ThirdPersonSensitivity, 0.1, 5)

					local Vector = Camera:WorldToViewportPoint(Environment.Locked.Character[Environment.Settings.LockPart].Position)
					mousemoverel((Vector.X - UserInputService:GetMouseLocation().X) * Environment.Settings.ThirdPersonSensitivity, (Vector.Y - UserInputService:GetMouseLocation().Y) * Environment.Settings.ThirdPersonSensitivity)
				else
					if Environment.Settings.Sensitivity > 0 then
						Animation = TweenService:Create(Camera, TweenInfo.new(Environment.Settings.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, Environment.Locked.Character[Environment.Settings.LockPart].Position)})
						Animation:Play()
					else
						Camera.CFrame = CFrame.new(Camera.CFrame.Position, Environment.Locked.Character[Environment.Settings.LockPart].Position)
					end
				end

			Environment.FOVCircle.Color = Environment.FOVSettings.LockedColor

			end
		end
	end)

	ServiceConnections.InputBeganConnection = UserInputService.InputBegan:Connect(function(Input)
		if not Typing then
			pcall(function()
				if Input.KeyCode == Enum.KeyCode[Environment.Settings.TriggerKey] then
					if Environment.Settings.Toggle then
						Running = not Running

						if not Running then
							CancelLock()
						end
					else
						Running = true
					end
				end
			end)

			pcall(function()
				if Input.UserInputType == Enum.UserInputType[Environment.Settings.TriggerKey] then
					if Environment.Settings.Toggle then
						Running = not Running

						if not Running then
							CancelLock()
						end
					else
						Running = true
					end
				end
			end)
		end
	end)

	ServiceConnections.InputEndedConnection = UserInputService.InputEnded:Connect(function(Input)
		if not Typing then
			if not Environment.Settings.Toggle then
				pcall(function()
					if Input.KeyCode == Enum.KeyCode[Environment.Settings.TriggerKey] then
						Running = false; CancelLock()
					end
				end)

				pcall(function()
					if Input.UserInputType == Enum.UserInputType[Environment.Settings.TriggerKey] then
						Running = false; CancelLock()
					end
				end)
			end
		end
	end)
end

--// Functions

Environment.Functions = {}

function Environment.Functions:Exit()
	for _, v in next, ServiceConnections do
		v:Disconnect()
	end

	if Environment.FOVCircle.Remove then Environment.FOVCircle:Remove() end

	getgenv().Aimbot.Functions = nil
	getgenv().Aimbot = nil
	
	Load = nil; GetClosestPlayer = nil; CancelLock = nil
end

function Environment.Functions:Restart()
	for _, v in next, ServiceConnections do
		v:Disconnect()
	end

	Load()
end

function Environment.Functions:ResetSettings()
	Environment.Settings = {
		Enabled = true,
		TeamCheck = false,
		AliveCheck = true,
		WallCheck = false,
		Sensitivity = 0, -- Animation length (in seconds) before fully locking onto target
		ThirdPerson = false, -- Uses mousemoverel instead of CFrame to support locking in third person (could be choppy)
		ThirdPersonSensitivity = 3, -- Boundary: 0.1 - 5
		TriggerKey = "MouseButton2",
		Toggle = false,
		LockPart = "Head" -- Body part to lock on
	}

	Environment.FOVSettings = {
		Enabled = true,
		Visible = true,
		Amount = 90,
		Color = Color3.fromRGB(255, 255, 255),
		LockedColor = Color3.fromRGB(255, 70, 70),
		Transparency = 0.5,
		Sides = 60,
		Thickness = 1,
		Filled = false
	}
end

--// Load

Load()
   end,
})

local Button = MainTab:CreateButton({
   Name = "FADED [1688]",
   Callback = function()
   _G.Toggles = "Y" -- You can put any keybind
loadstring(game:HttpGet("https://raw.githubusercontent.com/NighterEpic/Faded-Grid/main/YesEpic", true))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "FLING ALL [1688]",
   Callback = function()
   game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Script Executed";
    Text = "Fling All";
    Duration = 6;
})
 
local Targets = {"All"} -- "All", "Target Name", "arian_was_here"
 
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
 
local AllBool = false
 
local GetPlayer = function(Name)
    Name = Name:lower()
    if Name == "all" or Name == "others" then
        AllBool = true
        return
    elseif Name == "random" then
        local GetPlayers = Players:GetPlayers()
        if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
        return GetPlayers[math.random(#GetPlayers)]
    elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
        for _,x in next, Players:GetPlayers() do
            if x ~= Player then
                if x.Name:lower():match("^"..Name) then
                    return x;
                elseif x.DisplayName:lower():match("^"..Name) then
                    return x;
                end
            end
        end
    else
        return
    end
end
 
local Message = function(_Title, _Text, Time)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
end
 
local SkidFling = function(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart
 
    local TCharacter = TargetPlayer.Character
    local THumanoid
    local TRootPart
    local THead
    local Accessory
    local Handle
 
    if TCharacter:FindFirstChildOfClass("Humanoid") then
        THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    end
    if THumanoid and THumanoid.RootPart then
        TRootPart = THumanoid.RootPart
    end
    if TCharacter:FindFirstChild("Head") then
        THead = TCharacter.Head
    end
    if TCharacter:FindFirstChildOfClass("Accessory") then
        Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    end
    if Accessoy and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end
 
    if Character and Humanoid and RootPart then
        if RootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = RootPart.CFrame
        end
        if THumanoid and THumanoid.Sit and not AllBool then
            return Message("Error Occurred", "Targeting is sitting", 5) -- u can remove dis part if u want lol
        end
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif not THead and Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        elseif THumanoid and TRootPart then
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end
 
        local FPos = function(BasePart, Pos, Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
            RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end
 
        local SFBasePart = function(BasePart)
            local TimeToWait = 2
            local Time = tick()
            local Angle = 0
 
            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 50 then
                        Angle = Angle + 100
 
                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
                    else
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end
 
        workspace.FallenPartsDestroyHeight = 0/0
 
        local BV = Instance.new("BodyVelocity")
        BV.Name = "EpixVel"
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
 
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
 
        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        else
            return Message("Error Occurred", "Target is missing everything", 5)
        end
 
        BV:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = Humanoid
 
        repeat
            RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
            Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
            Humanoid:ChangeState("GettingUp")
            table.foreach(Character:GetChildren(), function(_, x)
                if x:IsA("BasePart") then
                    x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                end
            end)
            task.wait()
        until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
        workspace.FallenPartsDestroyHeight = getgenv().FPDH
    else
        return Message("Error Ocurrido", "El Script A Fallado", 5)
    end
end
 
if not Welcome then Message("By Augus X", "", 6) end
getgenv().Welcome = true
if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end
 
if AllBool then
    for _,x in next, Players:GetPlayers() do
        SkidFling(x)
    end
end
 
for _,x in next, Targets do
    if GetPlayer(x) and GetPlayer(x) ~= Player then
        if GetPlayer(x).UserId ~= 2924145477 then
            local TPlayer = GetPlayer(x)
            if TPlayer then
                SkidFling(TPlayer)
            end
        else
            Message("ERROR AL ASER FLING", "", 8)
        end
    elseif not GetPlayer(x) and not AllBool then
        Message("ERROR OCURRIDO", "NO SE LE ISO FLING", 8)
    end
end
   end,
})

local Button = MainTab:CreateButton({
   Name = "TROLL [GSZ]",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TheqopThe/robax/refs/heads/main/jumpscare.lua"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "HITBOX EXTENDER [1688XGLØRY]",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/LisSploit/HitBoxExtender/main/Universal",true))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "BACKDOOR SCANNER [1688XGLØRY]",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script'))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "SET SKY VISUAL [G$Z]",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/6JSLptY3"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "DECAL SPAM VISUAL [GSZ]",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/SQg7gBB5"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = " V1 Menu [1688XGLØRY]",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MiRw3b/c00lgui-v3rx/main/c00lguiv3rx.lua"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = " V2 Menu [1688XGLØRY]",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))()
   end,
})



local Button = MainTab:CreateButton({
   Name = " WICKED [1688XGLØRY]",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/GY1wfJRZ"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = " TOUCH FLING [1688XGLØRY]",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/LgZwZ7ZB",true))()
   end,
})

local Button = MainTab:CreateButton({
   Name = " Remote Spy [GSZ]",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/Forked/M%3ASimpleSpy%20V3",true))()
  end,
})

local Button = MainTab:CreateButton({
   Name = " Bring Part [GSZ]",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GoofyBlox/GoofyZ/refs/heads/main/Best/Vortex.lua", true))()
  end,
})

local Button = MainTab:CreateButton({
   Name = " Aim Assist [GSZ]",
   Callback = function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")

local aimAssistEnabled = false
local smoothness = 0.15 

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Q then
        aimAssistEnabled = not aimAssistEnabled
        print("Aim Assist:", aimAssistEnabled and "ON" or "OFF")
    end
end)

local function getClosestTarget()
    local closest = nil
    local shortestDistance = math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local headPos = player.Character.Head.Position
            local screenPos, onScreen = Camera:WorldToViewportPoint(headPos)

            if onScreen then
                local distance = (Vector2.new(screenPos.X, screenPos.Y) - UserInputService:GetMouseLocation()).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closest = player
                end
            end
        end
    end

    return closest
end

RunService.RenderStepped:Connect(function()
    if aimAssistEnabled then
        local target = getClosestTarget()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            local headPos = target.Character.Head.Position
            local camPos = Camera.CFrame.Position
            local direction = (headPos - camPos).Unit
            local newCFrame = CFrame.new(camPos, camPos + direction)

            Camera.CFrame = Camera.CFrame:Lerp(newCFrame, smoothness)
        end
    end
end)

-- Welcome GUI creation
local function createWelcomeGui()
    -- Create the ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "WelcomeGui"
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local background = Instance.new("Frame")
    background.Size = UDim2.new(0, 450, 0, 200)
    background.Position = UDim2.new(0.5, -225, 0.35, -100)
    background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    background.BackgroundTransparency = 0.6
    background.BorderSizePixel = 0
    background.Parent = screenGui

    -- Add gradient to the background
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new(Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 128, 0))
    gradient.Rotation = 45
    gradient.Parent = background

    local headerLabel = Instance.new("TextLabel")
    headerLabel.Text = "Welcome, @" .. LocalPlayer.Name
    headerLabel.Font = Enum.Font.SourceSansBold
    headerLabel.TextSize = 24
    headerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    headerLabel.BackgroundTransparency = 1
    headerLabel.Position = UDim2.new(0.5, -150, 0.1, 0)
    headerLabel.Size = UDim2.new(0, 300, 0, 30)
    headerLabel.TextXAlignment = Enum.TextXAlignment.Center
    headerLabel.TextYAlignment = Enum.TextYAlignment.Center
    headerLabel.TextStrokeTransparency = 0.8
    headerLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    headerLabel.Parent = background

    local subTitleLabel = Instance.new("TextLabel")
    subTitleLabel.Text = "Aim Assist for GLOCKSH1TXFAITH"
    subTitleLabel.Font = Enum.Font.SourceSans
    subTitleLabel.TextSize = 20
    subTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    subTitleLabel.BackgroundTransparency = 1
    subTitleLabel.Position = UDim2.new(0.5, -150, 0.3, 0)
    subTitleLabel.Size = UDim2.new(0, 300, 0, 30)
    subTitleLabel.TextXAlignment = Enum.TextXAlignment.Center
    subTitleLabel.TextYAlignment = Enum.TextYAlignment.Center
    subTitleLabel.TextStrokeTransparency = 0.8
    subTitleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    subTitleLabel.Parent = background

    local creatorLabel = Instance.new("TextLabel")
    creatorLabel.Text = "Made by Jay"
    creatorLabel.Font = Enum.Font.SourceSansItalic
    creatorLabel.TextSize = 18
    creatorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    creatorLabel.BackgroundTransparency = 1
    creatorLabel.Position = UDim2.new(0.5, -150, 0.5, 0)
    creatorLabel.Size = UDim2.new(0, 300, 0, 30)
    creatorLabel.TextXAlignment = Enum.TextXAlignment.Center
    creatorLabel.TextYAlignment = Enum.TextYAlignment.Center
    creatorLabel.TextStrokeTransparency = 0.8
    creatorLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    creatorLabel.Parent = background

    local footerLabel = Instance.new("TextLabel")
    footerLabel.Text = "Press Q to toggle Aim Assist"
    footerLabel.Font = Enum.Font.SourceSans
    footerLabel.TextSize = 16
    footerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    footerLabel.BackgroundTransparency = 1
    footerLabel.Position = UDim2.new(0.5, -150, 0.7, 0)
    footerLabel.Size = UDim2.new(0, 300, 0, 30)
    footerLabel.TextXAlignment = Enum.TextXAlignment.Center
    footerLabel.TextYAlignment = Enum.TextYAlignment.Center
    footerLabel.TextStrokeTransparency = 0.8
    footerLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    footerLabel.Parent = background

    local function animateLabels()
        for _, label in pairs(background:GetChildren()) do
            if label:IsA("TextLabel") then
                local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, -1, true)
                local goal = { Position = UDim2.new(0.5, -150, label.Position.Y.Scale + 0.05, 0) }
                game:GetService("TweenService"):Create(label, tweenInfo, goal):Play()
            end
        end
    end

    animateLabels()

    wait(5)
    screenGui:Destroy()
end

createWelcomeGui()
  end,
})

local Button = MainTab:CreateButton({
   Name = " JERK [GSZ]",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/FWwdST5Y"))()
   end,
})

local DupeTab = Window:CreateTab("SPAWN GUN", nil) -- Title, Image
local Section = DupeTab:CreateSection("SPAWN GUN")

local Button = DupeTab:CreateButton({
   Name = "ALL CITY SP [1688]",
   Callback = function()
  local args = {
    [1] = "Silenced Pistol",
    [2] = -10
}

game:GetService("ReplicatedStorage").GunShop.Events.Purchase:FireServer("Silenced Pistol", -1)
   end,
})

local Button = DupeTab:CreateButton({
   Name = "ALL CITY Glock-17 [1688]",
   Callback = function()
  local args = {
    [1] = "Silenced Pistol",
    [2] = -10
}

game:GetService("ReplicatedStorage").GunShop.Events.Purchase:FireServer("Glock-17", -1)
   end,
})

local Button = DupeTab:CreateButton({
   Name = "ALL CITY Glock-19 [1688]",
   Callback = function()
  local args = {
    [1] = "Silenced Pistol",
    [2] = -10
}

game:GetService("ReplicatedStorage").GunShop.Events.Purchase:FireServer("Glock-19", -1)
   end,
})

local Button = DupeTab:CreateButton({
   Name = "ALL CITY Desert Deagle [1688]",
   Callback = function()
  local args = {
    [1] = "Silenced Pistol",
    [2] = -10
}

game:GetService("ReplicatedStorage").GunShop.Events.Purchase:FireServer("Desert Deagle", -1)
   end,
})

local Button = DupeTab:CreateButton({
   Name = "ALL CITY HK416 [1688]",
   Callback = function()
  local args = {
    [1] = "HK416",
    [2] = -10
}

game:GetService("ReplicatedStorage").GunShop.Events.Purchase:FireServer("HK416", -1)
   end,
})

local Button = DupeTab:CreateButton({
   Name = "ALL CITY Medkit [1688]",
   Callback = function()
  local args = {
    [1] = "Medkit",
    [2] = -10
}

game:GetService("ReplicatedStorage").GunShop.Events.Purchase:FireServer("Medkit", -1)
   end,
})

local Button = DupeTab:CreateButton({
   Name = "ALL CITY Bandages [1688]",
   Callback = function()
  local args = {
    [1] = "Bandages",
    [2] = -10
}

game:GetService("ReplicatedStorage").GunShop.Events.Purchase:FireServer("Bandages", -1)
   end,
})

local Button = DupeTab:CreateButton({
   Name = "ALL CITY AK-47 [1688]",
   Callback = function()
  local args = {
    [1] = "AK-47",
    [2] = -10
}

game:GetService("ReplicatedStorage").GunShop.Events.Purchase:FireServer("AK-47", -1)
   end,
})

local Button = DupeTab:CreateButton({
   Name = "ALL CITY UZI [1688]",
   Callback = function()
  local args = {
    [1] = "UZI",
    [2] = -10
}

game:GetService("ReplicatedStorage").GunShop.Events.Purchase:FireServer("UZI", -1)
   end,
})

local Button = DupeTab:CreateButton({
   Name = "ALL CITY OXY [1688]",
   Callback = function()
  local args = {
    [1] = "OXY",
    [2] = -10
}

game:GetService("ReplicatedStorage").GunShop.Events.Purchase:FireServer("OXY", -1)
   end,
})

local Button = DupeTab:CreateButton({
   Name = "ALL CITY Radio [1688]",
   Callback = function()
  local args = {
    [1] = "Radio",
    [2] = -10
}

game:GetService("ReplicatedStorage").GunShop.Events.Purchase:FireServer("Radio", -1)
   end,
})

local Button = DupeTab:CreateButton({
   Name = "ALL CITY Phone [1688]",
   Callback = function()
  local args = {
    [1] = "Phone",
    [2] = -10
}

game:GetService("ReplicatedStorage").GunShop.Events.Purchase:FireServer("Phone", -1)
   end,
})

local Button = DupeTab:CreateButton({
   Name = "ALL CITY Shotgun [1688]",
   Callback = function()
  local args = {
    [1] = "Shotgun",
    [2] = -10
}

game:GetService("ReplicatedStorage").GunShop.Events.Purchase:FireServer("Shotgun", -1)
   end,
})

local Button = DupeTab:CreateButton({
   Name = "ALL CITY Double Barrel [1687]",
   Callback = function()
  local args = {
    [1] = "Double Barrel",
    [2] = -10
}

game:GetService("ReplicatedStorage").GunShop.Events.Purchase:FireServer("Double Barrel", -1)
   end,
})

  local WTab = Window:CreateTab("SIDE SCRIPT", nil) -- Title, Image
local Section = WTab:CreateSection("SIDE SCRIPT")

local Button = WTab:CreateButton({
   Name = "FANTASMA PVP [1688]",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/usbkillerx/EZhacker/refs/heads/main/EZhack"))()
   end,
})

local Button = WTab:CreateButton({
   Name = "ALADIA AIMBOT [1688]",
   Callback = function()
   local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
 
local AimEnabled = false  -- Toggle aim on/off
local Smoothness = 1   -- Lower value for ultra-smooth tracking (closer to 0 is slower, more precise)
local AimbotMode = "Instant" -- Options: "Instant", "Smooth"
local FOV = 5  -- Field of View in degrees (adjust to your preference)
 
-- Function to get head, neck, or humanoid root part for aiming
local function getTargetPart(character)
    local head = character:FindFirstChild("Head")
    local neck = character:FindFirstChild("Neck")
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
 
    local upperTorso = character:FindFirstChild("UpperTorso")
    local neckAttachment = upperTorso and upperTorso:FindFirstChild("NeckAttachment")
 
    if head then
        return head.Position
    elseif neck then
        return neck.CFrame.Position
    elseif neckAttachment then
        return neckAttachment.WorldPosition
    elseif humanoidRootPart then
        return humanoidRootPart.Position
    end
    return nil
end
 
-- Function to find the closest player's head or neck with distance and FOV check
local function getClosestPlayer()
    local closestTarget = nil
    local shortestDistance = math.huge
 
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local character = player.Character
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                humanoid.Died:Connect(function()
                    player.Character = player.CharacterAdded:Wait()
                end)
                local targetPos = getTargetPart(character)
                if targetPos then
                    -- Calculate distance to the target
                    local distance = (LocalPlayer.Character.HumanoidRootPart.Position - targetPos).Magnitude
 
                    -- Calculate FOV
                    local screenPoint, onScreen = Camera:WorldToScreenPoint(targetPos)
                    if onScreen then
                        local toTarget = (targetPos - Camera.CFrame.Position).unit
                        local cameraForward = Camera.CFrame.LookVector
                        local angle = math.acos(cameraForward:Dot(toTarget)) * (180 / math.pi)
 
                        -- Check if within FOV and the closest distance
                        if angle <= FOV and distance < shortestDistance then
                            shortestDistance = distance
                            closestTarget = targetPos
                        end
                    end
                end
            end
        end
    end
    return closestTarget
end
 
-- Aimbot Function
local function aimAtTarget()
    local target = getClosestPlayer()
    if target then
        if AimbotMode == "Instant" then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target)
        elseif AimbotMode == "Smooth" then
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, target), Smoothness)
        end
    end
end
 
-- Toggle Aimbot on right click hold
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then  -- Right Click to activate
        AimEnabled = true
    end
end)
 
UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then  -- Release Right Click to deactivate
        AimEnabled = false
    end
end)
 
-- Run Aimbot every frame
RunService.RenderStepped:Connect(function()
    if AimEnabled then
        aimAtTarget()
    end
end)

local WTab = Window:CreateTab("SIDE SCRIPT", nil) -- Title, Image
local Section = WTab:CreateSection("SIDE SCRIPT")

local Button = WTab:CreateButton({
   Name = " 99 NIGHTS Key SolunaIsLove [GSZ]",
   Callback = function()
loadstring(game:HttpGet("https://soluna-script.vercel.app/99-Nights-in-the-Forest.lua",true))() 
   end,
})

local Button = WTab:CreateButton({
   Name = " STEAL A BRAINROT [GSZ]",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dexscriptz/Ugly-Premium-V4-005/refs/heads/main/V4"))()
  end,
})

  end,
})