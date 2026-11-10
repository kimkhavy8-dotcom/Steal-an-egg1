-- Steal an Egg - Modern UI (Khmer)
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- លុប UI ចាស់ចោលបើមាន
if CoreGui:FindFirstChild("ModernStealAnEggGUI") then
    CoreGui.ModernStealAnEggGUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ModernStealAnEggGUI"
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 340)
MainFrame.Position = UDim2.new(0.15, 0, 0.15, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- ធ្វើឱ្យគែមស៊ុមមូល (UICorner)
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Header Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Title.BorderSizePixel = 0
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15
Title.Font = Enum.Font.GothamBold
Title.Text = "⚡ STEAL AN EGG - ម៉ូដខ្មែរ"
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

-- មុខងារបង្កើតปุ่มແບບ Modern
local function createButton(posY, text, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.88, 0, 0, 45)
    btn.Position = UDim2.new(0.06, 0, 0, posY)
    btn.BackgroundColor3 = color
    btn.BorderSizePixel = 0
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = text
    btn.Parent = MainFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    return btn
end

-- 1. ปุ่ม Speed x90000
local SpeedBtn = createButton(65, "🚀 បើកល្បឿនលឿន (Speed x90k)", Color3.fromRGB(0, 122, 255))
SpeedBtn.MouseButton1Click:Connect(function()
    local hum = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = 90000 end
end)

-- 2. ปุ่ม Fly
local FlyBtn = createButton(125, "🦅 បើកមុខងារហើរ (Fly)", Color3.fromRGB(255, 149, 0))
local flying = false
FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    local char = Player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local bv = hrp:FindFirstChild("BodyVelocity") or Instance.new("BodyVelocity", hrp)
    
    if flying then
        FlyBtn.Text = "🔒 បិទមុខងារហើរ (Fly)"
        bv.Velocity = Vector3.new(0, 50, 0)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    else
        FlyBtn.Text = "🦅 បើកមុខងារហើរ (Fly)"
        bv:Destroy()
    end
end)

-- 3. ปุ่ม Auto Egg
local AutoEggBtn = createButton(185, "🥚 ប្រមូលស៊ុតស្វ័យប្រវត្តិ (Auto Egg)", Color3.fromRGB(52, 199, 89))
local autoEggActive = false
AutoEggBtn.MouseButton1Click:Connect(function()
    autoEggActive = not autoEggActive
    if autoEggActive then
        AutoEggBtn.Text = "🛑 បិទ Auto Egg"
        task.spawn(function()
            while autoEggActive do
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("TouchInterest") and v.Parent then
                        firetouchinterest(Player.Character.HumanoidRootPart, v.Parent, 0)
                        firetouchinterest(Player.Character.HumanoidRootPart, v.Parent, 1)
                    end
                end
                task.wait(0.5)
            end
        end)
    else
        AutoEggBtn.Text = "🥚 ប្រមូលស៊ុតស្វ័យប្រវត្តិ (Auto Egg)"
    end
end)
