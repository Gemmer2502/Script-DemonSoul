-------------------
-----Variables-----
-------------------
fondEcranCouleur = Color3.fromRGB(0, 0, 0)
currentCharacter = nil  -- Variable pour stocker le personnage sélectionné

----------------
-----Tables-----
----------------
positionSusamaru = {
    [1] = Vector3.new(67.3531, 21.262, -395.083),
    [2] = Vector3.new(90.5005, 21.262, -371.627),
    [3] = Vector3.new(69.3635, 21.262, -311.552),
    [4] = Vector3.new(130.268, 21.262, -346.914),
    [5] = Vector3.new(136.353, 21.262, -307.379),
    [6] = Vector3.new(135.739, 21.262, -263.188),
    [7] = Vector3.new(135.739, 21.262, -263.188),
}

positionYahaba = {
    [1] = Vector3.new(69.8467, 24.0616, -350.076),
    [2] = Vector3.new(92.2988, 24.0616, -331.055),
    [3] = Vector3.new(94.2783, 24.0616, -293.35),
    [4] = Vector3.new(80.541, 24.0616, -263.942),
    [5] = Vector3.new(133.126, 24.0616, -396.738),
    [6] = Vector3.new(153.263, 24.0616, -375.259),
    [7] = Vector3.new(153.444, 24.0616, -332.631),
}


-------------------
-----Instances-----
-------------------
Player = game.Players.LocalPlayer
Fichier = Instance.new("Folder", Player.PlayerGui)
Menu = Instance.new("ScreenGui", Fichier)
Page1 = Instance.new("Frame", Menu)
ContourTitrePage1 = Instance.new("TextLabel", Page1)
TitrePage1 = Instance.new("TextLabel", ContourTitrePage1)
Boutton1 = Instance.new("TextButton", Page1)
Page2 = Instance.new("Frame", Menu)
MenuDeroulant = Instance.new("Frame", Page2)
Cible = Instance.new("TextLabel", MenuDeroulant)
Bouttons = {}


--------------------
-----Propriétés-----
--------------------
Page1.AnchorPoint = Vector2.new(0.5, 0.5)
Page1.Size = UDim2.new(0, 375, 0, 160)
Page1.Position = UDim2.new(0.5, 0, 0.1, 0)
Page1.BackgroundColor3 = fondEcranCouleur
Page1.BorderSizePixel = 1
Page1.Active = true
Page1.Draggable = true

TitrePage1.AnchorPoint = Vector2.new(0.5, 0.5)
TitrePage1.Position = UDim2.new(0.5, 0, 0.5, 0)
TitrePage1.Size = UDim2.new(1, 0, 0.2, 0)
TitrePage1.Text = "CrystalHub"
TitrePage1.TextSize = 30
TitrePage1.TextColor3 = Color3.fromRGB(255, 255, 255)
TitrePage1.BackgroundTransparency = 1
TitrePage1.BorderSizePixel = 0

ContourTitrePage1.AnchorPoint = Vector2.new(0.5, 0.5)
ContourTitrePage1.Position = UDim2.new(0.5, 0, 0.2, 0)
ContourTitrePage1.Size = UDim2.new(1, 0, 0.2, 0)
ContourTitrePage1.Text = "CrystalHub"
ContourTitrePage1.TextSize = 30.5
ContourTitrePage1.TextColor3 = Color3.fromRGB(203, 54, 240)
ContourTitrePage1.BackgroundColor3 = fondEcranCouleur
ContourTitrePage1.BorderSizePixel = 0

Boutton1.AnchorPoint = Vector2.new(0.5, 0.5)
Boutton1.Position = UDim2.new(0.5, 0, 0.65, 0)
Boutton1.Size = UDim2.new(0.30, 0, 0.35, 0)
Boutton1.BackgroundColor3 = fondEcranCouleur
Boutton1.BorderSizePixel = 1
Boutton1.BorderColor3 = Color3.fromRGB(255, 255, 255)
Boutton1.Text = "Cibles"
Boutton1.TextColor3 = Color3.fromRGB(255, 255, 255)
Boutton1.TextSize = 15
Boutton1.MouseButton1Click:Connect(function()
    -- Afficher ou cacher le menu déroulant
    MenuDeroulant.Visible = not MenuDeroulant.Visible
end)

-- Menu déroulant
MenuDeroulant.Size = UDim2.new(0, 200, 0, 250)
MenuDeroulant.Position = UDim2.new(0.5, 0, 0.7, 0)
MenuDeroulant.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MenuDeroulant.Visible = false

Cible.Size = UDim2.new(1, 0, 0.1, 0)
Cible.Position = UDim2.new(0, 0, 0, 0)
Cible.Text = "Choisi ta cible"
Cible.TextColor3 = Color3.fromRGB(255, 255, 255)
Cible.BackgroundTransparency = 1

local characters = {"Stop", "Susamaru", "Yahaba"}
local yOffset = 0.15

for i, character in ipairs(characters) do
    local button = Instance.new("TextButton", MenuDeroulant)
    button.Size = UDim2.new(1, 0, 0.1, 0)
    button.Position = UDim2.new(0, 0, yOffset, 0)
    button.Text = character
    button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.MouseButton1Click:Connect(function()
        Cible.Text = "Choisi: " .. character
        currentCharacter = character
        MenuDeroulant.Visible = false
    end)
    
    yOffset = yOffset + 0.15
end

----------------
-----Boucle-----
----------------
while true do
    if currentCharacter == "Susamaru" then
        for _, pos in ipairs(positionSusamaru) do
            game.Players.LocalPlayer.Character:MoveTo(pos)
            task.wait(1)
        end
    end

    if currentCharacter == "Yahaba" then
        for _, pos in ipairs(positionYahaba) do
            game.Players.LocalPlayer.Character:MoveTo(pos)
            task.wait(1)
        end
    end

    if currentCharacter == "Stop" then
        print("STOP !!!!!!")
    end
    task.wait(1)
end
