local itemSpawns = workspace.game_assets:FindFirstChild("item_spawns")

local function highlightAndLabelAmmo(item)
    if item.Name:sub(1, 4) == "Ammo" and item.Name ~= "Ammo22LR" then
        local highlight = item:FindFirstChildOfClass("Highlight")
        if not highlight then
            highlight = Instance.new("Highlight")
            highlight.Parent = item
            print("Highlight added to " .. item.Name)
        end
        highlight.Enabled = true

        local billboardGui = item:FindFirstChild("AmmoLabel")
        if not billboardGui then
            billboardGui = Instance.new("BillboardGui")
            billboardGui.Name = "AmmoLabel"
            billboardGui.Size = UDim2.new(0, 100, 0, 50)
            billboardGui.StudsOffset = Vector3.new(0, 2, 0)
            billboardGui.Adornee = item
            billboardGui.AlwaysOnTop = true 
            billboardGui.Parent = item

            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = item.Name
            textLabel.TextColor3 = Color3.new(1, 1, 1)
            textLabel.TextScaled = true
            textLabel.Parent = billboardGui
        end
    end
end

if itemSpawns then
    local function checkAndHighlightItems()
        for _, item in ipairs(itemSpawns:GetChildren()) do
            highlightAndLabelAmmo(item)
        end
    end
    
    checkAndHighlightItems()
    
    game:GetService("RunService").Stepped:Connect(function(time, deltaTime)
        if time % 3 < deltaTime then
            checkAndHighlightItems()
        end
    end)
else
    warn("item_spawns not found in workspace.game_assets.")
end
