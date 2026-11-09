-- Steal an Egg GUI Script with Key System & Minimize (Khmer Version)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- លេខកូដសម្ងាត់ (Password Verification)
local enteredCorrectKey = false
local success, err = pcall(function()
    -- ផ្ទាំងបញ្ចូលលេខកូដ (Key System UI)
    if CoreGui:FindFirstChild("StealAnEggKeyGUI") then
        CoreGui.StealAnEggKeyGUI:Destroy()
    end

    local KeyGui = Instance.new("ScreenGui")
    KeyGui.Name = "StealAnEggKeyGUI"
    KeyGui.Parent = CoreGui

    local KeyFrame = Instance.new("Frame")
    KeyFrame.Parent = KeyGui
    KeyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    KeyFrame.Position = UDim2.new(0.5, -130, 0.5, -80)
    KeyFrame.Size = UDim2.new(0, 260, 0, 160)
    KeyFrame.Active = true
    KeyFrame.Draggable = true

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = KeyFrame

    local Title = Instance.new("TextLabel")
    Title.Parent = KeyFrame
    Title.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "🔐 វាយបញ្ចូលលេខកូដ (AIZEN)"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14

    local Box = Instance.new("TextBox")
    Box.Parent = KeyFrame
    Box.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    Box.Position = UDim2.new(0.1, 0, 0.35, 0)
    Box.Size = UDim2.new(0.8, 0, 0, 35)
    Box.Font = Enum.Font.Gotham
    Box.PlaceholderText = "បញ្ចូល Password ទីនេះ..."
    Box.Text = ""
    Box.TextColor3 = Color3.fromRGB(255, 255, 255)
    Box.TextSize = 14

    local SubmitBtn = Instance.new("TextButton")
    SubmitBtn.Parent = KeyFrame
    SubmitBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
    SubmitBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
    SubmitBtn.Size = UDim2.new(0.8, 0, 0, 35)
    SubmitBtn.Font = Enum.Font.GothamBold
    SubmitBtn.Text = "បញ្ជាក់ (Submit)"
    SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubmitBtn.TextSize = 14

    SubmitBtn.MouseButton1Click:Connect(function()
        if Box.Text == "AIZEN999" then
            enteredCorrectKey = true
            KeyGui:Destroy()
        else
            SubmitBtn.Text = "❌ លេខកូដខុស! (ខំប្រឹងឡើង)"
            task.wait(1)
            SubmitBtn.Text = "បញ្ជាក់ (Submit)"
        end
    end)
end)

-- រង់ចាំរហូតទាល់តែអ្នកបញ្ចូលលេខកូដត្រូវទើបដំណើរការផ្ទាំងមេ
repeat task.wait() until enteredCorrectKey

-- ផ្ទៀងផ្ទាត់ថាតើ GUI ធ្លាប់មានឬនៅ
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
MainFrame.Size = UDim2.new(0, 350, 0, 380)
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
Title.Text = "🥚 STEAL AN EGG - AI ZEN MOD"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

--  nút សញ្ញាដក ( Minimize `-` )
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = MainFrame
MinBtn.BackgroundColor3 = Color3.fromRGB(220, 150, 30)
MinBtn.Position = UDim2.new(1, -70, 0, 8)
MinBtn.Size = UDim2.new(0, 25, 0, 25)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 16

-- nút ខ្វែង ( Close `X` )
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = MainFrame
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CloseBtn.Position = UDim2.new(1, -35, 0, 8)
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 14

local Scroll = Instance.new("ScrollingFrame")
Scroll.Parent = MainFrame
Scroll.Active = true
Scroll.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
Scroll.BackgroundTransparency = 1
Scroll.Position = UDim2.new(0, 10, 0, 55)
Scroll.Size = UDim2.new(0, 330, 0, 315)
Scroll.CanvasSize = UDim2.new(0, 0, 0, 350)
Scroll.ScrollBarThickness = 4

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = Scroll
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

-- បفن្ដាប់មុខងារ Minimize (-) និង Close (X)
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    Scroll.Visible = not minimized
    if minimized then
        MainFrame.Size = UDim2.new(0, 350, 0, 45)
        MinBtn.Text = "+"
    else
        MainFrame.Size = UDim2.new(0, 350, 0, 380)
        MinBtn.Text = "-"
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- មុខងារទី ១៖ ចាប់យកស៊ុតស្វ័យប្រវត្តិ (Auto Steal Eggs)
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
                                firetouchinterest(char.HumanoidRootPart, v, 0)
                                firetouchinterest(char.HumanoidRootPart, v, 1)
                            end
                        end
                    end
                end)
                task.wait(0.2)
            end
        end)
    else
        BtnAutoSteal.Text = "🥷 ចាប់យកស៊ុតស្វ័យប្រវត្តិ (OFF)"
        BtnAutoSteal.BackgroundColor3 = Color3.fromRGB(50, 150, 250)
    end
end)

-- មុខងារទី ២៖ ហោះហើរស្វ័យប្រវត្តិ (Auto Fly)
local BtnFly = Instance.new("TextButton")
BtnFly.Parent = Scroll
BtnFly.BackgroundColor3 = Color3.fromRGB(50, 200, 180)
BtnFly.Size = UDim2.new(1, -10, 0, 40)
BtnFly.Font = Enum.Font.GothamBold
BtnFly.Text = "🛸 ហោះហើរស្វ័យប្រវត្តិ (OFF)"
BtnFly.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnFly.TextSize = 14

local BtnCornerFly = Instance.new("UICorner")
BtnCornerFly.CornerRadius = UDim.new(0, 6)
BtnCornerFly.Parent = BtnFly

local flyEnabled = false
local bg, bv
BtnFly.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    local char = LocalPlayer.Character
    if flyEnabled then
        BtnFly.Text = "🛸 ហោះហើរស្វ័យប្រវត្តិ (ON)"
        BtnFly.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
        task.spawn(function()
            pcall(function()
                local root = char:FindFirstChild("HumanoidRootPart")
                if root then
                    bg = Instance.new("BodyGyro", root)
                    bg.P = 9e4
                    bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                    bg.cframe = root.CFrame
                    
                    bv = Instance.new("BodyVelocity", root)
                    bv.velocity = Vector3.new(0, 0.1, 0)
                    bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
                    
                    while flyEnabled do
                        local cam = workspace.CurrentCamera
                        bv.velocity = cam.CoordinateFrame.LookVector * 50
                        bg.cframe = cam.CoordinateFrame
                        task.wait()
                    end
                end
            end)
        end)
    else
        BtnFly.Text = "🛸 ហោះហើរស្វ័យប្រវត្តិ (OFF)"
        BtnFly.BackgroundColor3 = Color3.fromRGB(50, 200, 180)
        if bg then bg:Destroy() end
        if bv then bv:Destroy() end
    end
end)

-- មុខងារទី ៣៖ រត់លឿន (Super Speed)
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
                    LocalPlayer.Character.Humanoid.WalkSpeed = 90
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

print("AI ZEN Script fully loaded with Key System & Minimize options!")
