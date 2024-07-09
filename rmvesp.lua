-- Configuration
local FriendColor = Color3.fromRGB(0, 0, 255)
local EnemyColor = Color3.fromRGB(255, 0, 0)
local UseTeamColor = true

-- Create the ESP holder folder in CoreGui
local ESPFolder = Instance.new("Folder", game.CoreGui)
ESPFolder.Name = "ESP"

-- Function to create ESP for a player
local function createESP(player)
    -- Check if the player already has ESP
    local espFolder = ESPFolder:FindFirstChild(player.Name)
    if not espFolder then
        espFolder = Instance.new("Folder")
        espFolder.Name = player.Name
        espFolder.Parent = ESPFolder
    end

    -- Create the box adornment
    local boxAdornment = Instance.new("BoxHandleAdornment")
    boxAdornment.Name = "Box"
    boxAdornment.Size = Vector3.new(1, 2, 1)
    boxAdornment.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
    boxAdornment.Transparency = 0.7
    boxAdornment.ZIndex = 0
    boxAdornment.AlwaysOnTop = false
    boxAdornment.Visible = false
    boxAdornment.Adornee = player.Character
    boxAdornment.Parent = espFolder

    -- Create the name tag billboard
    local nameTag = Instance.new("BillboardGui")
    nameTag.Name = "NameTag"
    nameTag.Enabled = false
    nameTag.Size = UDim2.new(0, 200, 0, 50)
    nameTag.AlwaysOnTop = true
    nameTag.StudsOffset = Vector3.new(0, 1.8, 0)
    nameTag.Parent = espFolder
    local tag = Instance.new("TextLabel", nameTag)
    tag.Name = "Tag"
    tag.BackgroundTransparency = 1
    tag.Position = UDim2.new(0, -50, 0, 0)
    tag.Size = UDim2.new(0, 300, 0, 20)
    tag.TextSize = 15
    tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
    tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
    tag.TextStrokeTransparency = 0.4
    tag.Text = player.Name
    tag.Font = Enum.Font.SourceSansBold
    tag.TextScaled = false
    tag.Parent = nameTag
end

-- Function to remove ESP for a player
local function removeESP(player)
    local espFolder = ESPFolder:FindFirstChild(player.Name)
    if espFolder then
        espFolder:Destroy()
    end
end

-- Function to handle player added event
local function onPlayerAdded(player)
    createESP(player)
end

-- Function to handle player removing event
local function onPlayerRemoving(player)
    removeESP(player)
end

-- Create initial ESP for existing players
for _, player in ipairs(game.Players:GetPlayers()) do
    createESP(player)
end

-- Listen for new players and remove ESP for leaving players
game.Players.PlayerAdded:Connect(onPlayerAdded)
game.Players.PlayerRemoving:Connect(onPlayerRemoving)

-- Function to disable all ESP elements
local function disableAllESP()
    ESPFolder:ClearAllChildren()
end

-- Call disableAllESP function to disable all ESP initially
disableAllESP()

-- Stop the script execution if already executed once
if _G.Reantheajfdfjdgs then
    return
end

-- Set a global variable to indicate script execution
_G.Reantheajfdfjdgs = ":suifayhgvsdghfsfkajewfrhk321rk213kjrgkhj432rj34f67df"

-- Example function to highlight players (replace with your own implementation)
local players = game:GetService("Players")
local plr = players.LocalPlayer

function esp(target, color)
    if target.Character then
        if not target.Character:FindFirstChild("GetReal") then
            local highlight = Instance.new("Highlight")
            highlight.RobloxLocked = true
            highlight.Name = "GetReal"
            highlight.Adornee = target.Character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillColor = color
            highlight.Parent = target.Character
        else
            target.Character.GetReal.FillColor = color
        end
    end
end

while task.wait() do
    for i, v in pairs(players:GetPlayers()) do
        if v ~= plr then
            esp(v, UseTeamColor and v.TeamColor.Color or (plr.TeamColor == v.TeamColor and FriendColor or EnemyColor))
        end
    end
end
