-- Steal an Egg GUI Script (Khmer Version - Fixed & Optimized)
local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("StealAnEggKhmerGUI") then
    CoreGui.StealAnEggKhmerGUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "StealAnEggKhmerGUI"
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -175)
MainFrame.Size = UDim2.new(0, 350, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Font = Enum.Font.GothamBold
Title.Text = "🥚 STEAL AN EGG - ម៉ូដខ្មែរ (Fixed)"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

local Scroll = Instance.new("ScrollingFrame")
Scroll.Parent = MainFrame
Scroll.Active = true
Scroll.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
Scroll.BackgroundTransparency = 1
Scroll.Position = UDim2.new(0, 10, 0, 55)
Scroll.Size = UDim2.new(0, 330, 0, 280)
Scroll.CanvasSize = UDim2.new(0, 0, 0, 300)
Scroll.ScrollBarThickness = 4

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = Scroll
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- មុខងារទី ១៖ ចាប់យកស៊ុតស្វ័យប្រវត្តិ (Teleport/Touch Approach)
local BtnAutoSteal = Instance.new("TextButton")
BtnAutoSteal.Parent = Scroll
BtnAutoSteal.BackgroundColor3 = Color3.fromRGB(50, 150, 250)
BtnAutoSteal.Size = UDim2.new(1, -10, 0, 40)
BtnAutoSteal.Font = Enum.Font.GothamBold
BtnAutoSteal.Text = "🥷 ចាប់យកស៊ុតស្វ័យប្រវត្តិ (OFF)"
BtnAutoSteal.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnAutoSteal.TextSize = 14

local BtnCorner1 = Instance.new("UICorner")
BtnCorner1.CornerRadius = UDim.new(0, 6)
BtnCorner1.Parent = BtnAutoSteal

local autoStealEnabled = false
BtnAutoSteal.MouseButton1Click:Connect(function()
    autoStealEnabled = not autoStealEnabled
    if autoStealEnabled then
        BtnAutoSteal.Text = "🥷 ចាប់យកស៊ុតស្វ័យប្រវត្តិ (ON)"
        BtnAutoSteal.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
        task.spawn(function()
            while autoStealEnabled do
                pcall(function()
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        for _, v in pairs(workspace:GetDescendants()) do
                            if v:IsA("BasePart") and (v.Name:lower():find("egg") or v.Name:lower():find("collect") or v.Name:lower():find("drop")) then
                                -- ទាញយកដោយប្តូរទីតាំងទៅជិត (Safe Teleport Touch)
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
        BtnAutoSteal.Text = "🥷 ចាប់យកស៊ុតស្វ័យប្រវត្តិ (OFF)"
        BtnAutoSteal.BackgroundColor3 = Color3.fromRGB(50, 150, 250)
    end
end)

-- មុខងារទី ២៖ រត់លឿន (Super Speed)
local BtnSpeed = Instance.new("TextButton")
BtnSpeed.Parent = Scroll
BtnSpeed.BackgroundColor3 = Color3.fromRGB(250, 130, 40)
BtnSpeed.Size = UDim2.new(1, -10, 0, 40)
BtnSpeed.Font = Enum.Font.GothamBold
BtnSpeed.Text = "⚡ រត់លឿនខ្លាំង (OFF)"
BtnSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnSpeed.TextSize = 14

local BtnCorner2 = Instance.new("UICorner")
BtnCorner2.CornerRadius = UDim.new(0, 6)
BtnCorner2.Parent = BtnSpeed

local speedEnabled = false
BtnSpeed.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    if speedEnabled then
        BtnSpeed.Text = "⚡ រត់លឿនខ្លាំង (ON)"
        BtnSpeed.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
        task.spawn(function()
            while speedEnabled do
                pcall(function()
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChild("Humanoid") then
                        char.Humanoid.WalkSpeed = 80
                    end
                end)
                task.wait(0.2)
            end
        end)
    else
        BtnSpeed.Text = "⚡ រត់លឿនខ្លាំង (OFF)"
        BtnSpeed.BackgroundColor3 = Color3.fromRGB(250, 130, 40)
        pcall(function()
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end)
    end
end)

-- មុខងារទី ៣៖ លោតខ្ពស់ (Super Jump)
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
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChild("Humanoid") then
                        char.Humanoid.UseJumpPower = true
                        char.Humanoid.JumpPower = 120
                    end
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

-- មុខងារទី ៤៖ ប្រមូលប្រាក់/Coins ស្វ័យប្រវត្តិ
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
                task.wait(0.5)
            end
        end)
    else
        BtnCoins.Text = "💰 ប្រមូលលុយស្វ័យប្រវត្តិ (OFF)"
        BtnCoins.BackgroundColor3 = Color3.fromRGB(220, 180, 20)
    end
end)

print("Script Steal an Egg Fixed loaded successfully!")

