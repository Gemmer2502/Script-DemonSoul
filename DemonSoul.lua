-- Tables : 
positionSusamaru = {
    [1] = Vector3.new(67.3531, 21.262, -395.083),
    [2] = Vector3.new(90.5005, 21.262, -371.627),
    [3] = Vector3.new(69.3635, 21.262, -311.552),
    [4] = Vector3.new(130.268, 21.262, -346.914),
    [5] = Vector3.new(136.353, 21.262, -307.379),
    [6] = Vector3.new(135.739, 21.262, -263.188),
    [7] = Vector3.new(135.739, 21.262, -263.188),
}

choixUtilisateur = {
    Susamaru = false
}

-- Variables :
fondEcranCouleur = Color3.fromRGB(106, 31, 171)
bordCouleur = Color3.fromRGB(80, 23, 129)

positions = {}  -- Initialiser positions en tant que table vide

local nombres = 0
-- Instances :
Fichier = Instance.new("Folder", game.Players.LocalPlayer.PlayerGui)
Menu = Instance.new("ScreenGui", Fichier)
Fenetre1 = Instance.new("Frame", Menu)
TitreFenetre1 = Instance.new("TextLabel", Fenetre1)
BouttonSusamaru = Instance.new("TextButton", Fenetre1)
TextSusamaru = Instance.new("TextLabel", BouttonSusamaru)

-- Propriétés :
Fenetre1.AnchorPoint = Vector2.new(0.5, 0.5)
Fenetre1.Size = UDim2.new(0, 375, 0, 160)
Fenetre1.Position = UDim2.new(0.5, 0, 0.1, 0)
Fenetre1.BackgroundColor3 = fondEcranCouleur
Fenetre1.BorderColor3 = bordCouleur
Fenetre1.BorderSizePixel = 1
Fenetre1.Active = true
Fenetre1.Draggable = true

TitreFenetre1.AnchorPoint = Vector2.new(0.5, 0.5)
TitreFenetre1.Position = UDim2.new(0.5, 0, 0.1, 0)
TitreFenetre1.Size = UDim2.new(1, 0, 0.2, 0)
TitreFenetre1.Text = "Menu Principale"
TitreFenetre1.TextSize = 18
TitreFenetre1.TextColor3 = Color3.fromRGB(255, 255, 255)
TitreFenetre1.BackgroundColor3 = fondEcranCouleur
TitreFenetre1.BorderSizePixel = 0
TitreFenetre1.BorderColor3 = bordCouleur

BouttonSusamaru.AnchorPoint = Vector2.new(0.5, 0)
BouttonSusamaru.Position = UDim2.new(0.3, 0, 0.3, 0)
BouttonSusamaru.Size = UDim2.new(0, 25, 0, 25)
BouttonSusamaru.BackgroundColor3 = fondEcranCouleur
BouttonSusamaru.BorderSizePixel = 1
BouttonSusamaru.BorderColor3 = bordCouleur
BouttonSusamaru.TextColor3 = bordCouleur
BouttonSusamaru.Text = ""
BouttonSusamaru.TextScaled = true
BouttonSusamaru.MouseButton1Click:Connect(function()
    choixUtilisateur.Susamaru = not choixUtilisateur.Susamaru

    if choixUtilisateur.Susamaru then
        BouttonSusamaru.Text = "✔"
        positions = {}  -- Réinitialiser la table des positions
        running = true
        for _, positionSusamaru in ipairs(positionSusamaru) do
            nombres = nombres + 1
            positions[nombres] = positionSusamaru  -- Ajout des positions à la table
        end
        cheat()
    else
        BouttonSusamaru.Text = ""
        positions = {}  -- Réinitialiser si désactivé
        running = false
    end
end)

TextSusamaru.Position = UDim2.new(1, 0, 0, 0)
TextSusamaru.Size = UDim2.new(0, 125, 1, 0)
TextSusamaru.BackgroundTransparency = 1
TextSusamaru.TextScaled = true
TextSusamaru.Text = "Susamaru"
TextSusamaru.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Corps :

-- Variables de contrôle
local running = true

function cheat()
    while running do
        for _, position in ipairs(positions) do
            game.Players.LocalPlayer.Character:MoveTo(position)
            task.wait(1)
        end
    end
end

-- Fonction d'arrêt avec la touche "="
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Equals then
        running = false  -- Arrêter la boucle
    end
end)
