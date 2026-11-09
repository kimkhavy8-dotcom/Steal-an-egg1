-- ====================================================
-- Script Name: កូនខ្មែរ
-- Password: AIZEN
-- ====================================================

-- ការផ្ទៀងផ្ទាត់ពាក្យសម្ងាត់ (Password Verification)
local inputPassword = "AIZEN" -- អ្នកអាចផ្លាស់ប្តូរការទទួលយក input របស់អ្នកនៅទីនេះបើចាំបាច់
if inputPassword ~= "AIZEN" then
    warn("Incorrect Password!")
    return
end

print("Loaded Script: កូនខ្មែរ successfully!")

local SAE = "https://api.luarmor.net/files/v4/loaders/d70c93187f4801ff5b907707597a24be.lua"
local RAP = "https://api.luarmor.net/files/v4/loaders/0dbcaa9e992477523d38a8284d7dbdef.lua"
local JFA = "https://raw.githubusercontent.com/tienkhanh1/Chilli-Hub-Script/refs/heads/main/JumpForAnimals"
local SAB = "https://raw.githubusercontent.com/tienkhanh1/spicy/refs/heads/main/Steal-a-Brainrot"
local MM2 = "https://api.luarmor.net/files/v4/loaders/2bf348894416e1d3deee40be756d42ff.lua"
local BROOK = "https://api.luarmor.net/files/v4/loaders/89190a03fd337349cef140d576357ba3.lua"

local byGameId = {
    [10563114921] = SAE,
    [10035204815] = RAP,
    [10690360998] = JFA,
    [7709344486]  = SAB,
    [66654135]    = MM2,
    [1686885941]  = BROOK,
}

local byPlaceId = {
    [107778070777162] = SAE,
    [124216119978534] = RAP,
    [126870639873289] = JFA,
    [109983668079237] = SAB,
    [142823291]       = MM2,
    [4924922222]      = BROOK,
}

local gameId = game.GameId
while gameId == 0 and game.PlaceId == 0 do
    task.wait()
    gameId = game.GameId
end

local url = byGameId[gameId] or byPlaceId[game.PlaceId]
if url then
    for _ = 1, 3 do
        local ok, source = pcall(game.HttpGet, game, url)
        if ok and type(source) == "string" and source ~= "" then
            local chunk = loadstring(source)
            if chunk then
                chunk()
            end
            return
        end
        task.wait(0.5)
    end
end

-- បង្កើត UI និងមុខងារបន្ថែម (Extra Features UI)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AizenScriptGui"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0, 220, 0, 260)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "កូនខ្មែរ - Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

local Scroll = Instance.new("ScrollingFrame")
Scroll.Parent = MainFrame
Scroll.BackgroundTransparency = 1
Scroll.Position = UDim2.new(0, 0, 0, 45)
Scroll.Size = UDim2.new(1, 0, 1, -45)
Scroll.CanvasSize = UDim2.new(0, 0, 0, 200)
Scroll.ScrollBarThickness = 4

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = Scroll
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

-- មុខងារទី ៤៖ លោតខ្ពស់ (Super Jump)
local BtnJump = Instance.new("TextButton")
BtnJump.Parent = Scroll
BtnJump.BackgroundColor3 = Color3.fromRGB(150, 50, 250)
BtnJump.Size = UDim2.new(1, -10, 0, 40)
BtnJump.Font = Enum.Font.GothamBold
BtnJump.Text = "🦘 លោតខ្ពស់ (OFF)"
BtnJump.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnJump.TextSize = 14

local BtnCorner3 = Instance.new("UICorner")
BtnCorner3.CornerRadius = UDim.new(0, 6)
BtnCorner3.Parent = BtnJump

local jumpEnabled = false
BtnJump.MouseButton1Click:Connect(function()
    jumpEnabled = not jumpEnabled
    if jumpEnabled then
        BtnJump.Text = "🦘 លោតខ្ពស់ (ON)"
        BtnJump.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
        task.spawn(function()
            while jumpEnabled do
                pcall(function()
                    LocalPlayer.Character.Humanoid.UseJumpPower = true
                    LocalPlayer.Character.Humanoid.JumpPower = 150
                end)
                task.wait(0.2)
            end
        end)
    else
        BtnJump.Text = "🦘 លោតខ្ពស់ (OFF)"
        BtnJump.BackgroundColor3 = Color3.fromRGB(150, 50, 250)
        pcall(function()
            LocalPlayer.Character.Humanoid.JumpPower = 50
        end)
    end
end)

-- មុខងារទី ៥៖ ប្រមូលប្រាក់/Coins ស្វ័យប្រវត្តិ
local BtnCoins = Instance.new("TextButton")
BtnCoins.Parent = Scroll
BtnCoins.BackgroundColor3 = Color3.fromRGB(220, 180, 20)
BtnCoins.Size = UDim2.new(1, -10, 0, 40)
BtnCoins.Font = Enum.Font.GothamBold
BtnCoins.Text = "💰 ប្រមូលលុយស្វ័យប្រវត្តិ (OFF)"
BtnCoins.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnCoins.TextSize = 14

local BtnCorner4 = Instance.new("UICorner")
BtnCorner4.CornerRadius = UDim.new(0, 6)
BtnCorner4.Parent = BtnCoins

local autoCoinsEnabled = false
BtnCoins.MouseButton1Click:Connect(function()
    autoCoinsEnabled = not autoCoinsEnabled
    if autoCoinsEnabled then
        BtnCoins.Text = "💰 ប្រមូលលុយស្វ័យប្រវត្តិ (ON)"
        BtnCoins.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
        task.spawn(function()
            while autoCoinsEnabled do
                pcall(function()
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        for _, v in pairs(workspace:GetDescendants()) do
                            if v:IsA("BasePart") and (v.Name:lower():find("coin") or v.Name:lower():find("cash") or v.Name:lower():find("gem") or v.Name:lower():find("money")) then
                                firetouchinterest(char.HumanoidRootPart, v, 0)
                                firetouchinterest(char.HumanoidRootPart, v, 1)
                            end
                        end
                    end
                end)
                task.wait(0.3)
            end
        end)
    else
        BtnCoins.Text = "💰 ប្រមូលលុយស្វ័យប្រវត្តិ (OFF)"
        BtnCoins.BackgroundColor3 = Color3.fromRGB(220, 180, 20)
    end
end)

print("AI ZEN Script fully loaded with Key System & UI options!")

