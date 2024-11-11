-- Variables : 
valeur = true

positionSusamaru = {
    Vector3.new(67.3531, 21.262, -395.083),
    Vector3.new(90.5005, 21.262, -371.627),
    Vector3.new(69.3635, 21.262, -311.552),
    Vector3.new(130.268, 21.262, -346.914),
    Vector3.new(136.353, 21.262, -307.379),
    Vector3.new(135.739, 21.262, -263.188),
    Vector3.new(135.739, 21.262, -263.188),
}

-- Fonctions :

fonction cheat
    while valeur do
        for _, positionSusamaru in ipairs(positionSusamaru) do
            game.Players.LocalPlayer.Character:MoveTo(positionSusamaru)
            task.wait(1)
        end
    end
end
-- Fonction principale pour déplacer le joueur

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Equals then
        valeur = false
    end
end)
-- Fonction qui arrête la boucle si la touche "=" est pressée
