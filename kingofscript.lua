
-- Steal an Egg GUI Script (Khmer Version)
-- Creator: AI Assistant
-- Compatible with standard Roblox Executors (Synapse, Fluxus, Delta, etc.)

-- ផ្ទៀងផ្ទាត់ថាតើ GUI ធ្លាប់មានឬនៅ ដើម្បីការពារការស្ទួន
local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("StealAnEggKhmerGUI") then
    CoreGui.StealAnEggKhmerGUI:Destroy()
end

-- បង្កើត ScreenGui មេ
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "StealAnEggKhmerGUI"
ScreenGui.Parent = CoreGui

-- បង្កើតផ្ទាំងបង្អួចមេ (Main Frame)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -175)
MainFrame.Size = UDim2.new(0, 350, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true -- អាចអូសទាញផ្ទាំងទៅមកបាន

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- ចំណងជើង (Title)
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Font = Enum.Font.GothamBold
Title.Text = "🥚 STEAL AN EGG - ម៉ូដខ្មែរ"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

-- បង្កើតកន្លែងដាក់ប៊ូតុង (ScrollingFrame)
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

--មុខងារទី ១៖ ទាញយកស៊ុតស្វ័យប្រវត្តិ (Auto Steal / Collect Eggs)
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
        -- កូដដំណើរការ Auto Steal (កែសម្រួលតាមរចនាសម្ព័ន្ធហ្គេមជាក់ស្តែង)
        task.spawn(function()
            while autoStealEnabled do
                pcall(function()
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("TouchTransmitter") and v.Parent and (v.Parent.Name:lower():find("egg") or v.Parent.Name:lower():find("collect")) then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
                        end
                    end
                end)
                task.wait(0.5)
            end
        end)
    else
        BtnAutoSteal.Text = "🥷 ចាប់យកស៊ុតស្វ័យប្រវត្តិ (OFF)"
        BtnAutoSteal.BackgroundColor3 = Color3.fromRGB(50, 150, 250)
    end
end)

--មុខងារទី ២៖ រត់លឿន (Super Speed)
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
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        if speedEnabled then
            BtnSpeed.Text = "⚡ រត់លឿនខ្លាំង (ON)"
            BtnSpeed.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
            char.Humanoid.WalkSpeed = 75 -- ល្បឿនអាចកែសម្រួលបាន
        else
            BtnSpeed.Text = "⚡ រត់លឿនខ្លាំង (OFF)"
            BtnSpeed.BackgroundColor3 = Color3.fromRGB(250, 130, 40)
            char.Humanoid.WalkSpeed = 16
        end
    end
end)

--មុខងារទី ៣៖ លោតខ្ពស់ (Super Jump)
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
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        if jumpEnabled then
            BtnJump.Text = "🦘 លោតខ្ពស់ (ON)"
            BtnJump.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
            char.Humanoid.JumpPower = 120
        else
            BtnJump.Text = "🦘 លោតខ្ពស់ (OFF)"
            BtnJump.BackgroundColor3 = Color3.fromRGB(150, 50, 250)
            char.Humanoid.JumpPower = 50
        end
    end
end)

--មុខងារទី ៤៖ ប្រមូលប្រាក់/Coins ស្វ័យប្រវត្តិ (Auto Collect Coins)
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
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("TouchTransmitter") and v.Parent and (v.Parent.Name:lower():find("coin") or v.Parent.Name:lower():find("cash") or v.Parent.Name:lower():find("gem")) then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
                        end
                    end
                end)
                task.wait(1)
            end
        end)
    else
        BtnCoins.Text = "💰 ប្រមូលលុយស្វ័យប្រវត្តិ (OFF)"
        BtnCoins.BaseColor3 = Color3.fromRGB(220, 180, 20)
    end
end)

print("Script Steal an Eye (Khmer) loaded successfully!")
