--[[
Sistema de Key Snow Hub GUI - Português

Interface aprimorada e mais bonita, com nome alterado para Snow Hub.
Todos os textos em português. O botão "Obter Key" copia o link desejado.

loadstring(game:HttpGet('https://raw.githubusercontent.com/snowftw/script-priv/main/snowhub_key_gui_ptbr.lua'))()
]]

local player = game:GetService('Players').LocalPlayer

-- Remove GUI anterior se existir
local guiAtual = player:FindFirstChildOfClass('PlayerGui'):FindFirstChild('SnowHubKeyGui')
if guiAtual then
    guiAtual:Destroy()
end

-- Criar ScreenGui
local gui = Instance.new('ScreenGui')
gui.Name = 'SnowHubKeyGui'
gui.ResetOnSpawn = false
gui.Parent = player:FindFirstChildOfClass('PlayerGui')

-- Main frame com sombra
local frame = Instance.new('Frame')
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.Size = UDim2.new(0, 440, 0, 235)
frame.BackgroundColor3 = Color3.fromRGB(28, 32, 54)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new('UICorner')
corner.CornerRadius = UDim.new(0, 20)
corner.Parent = frame

local shadow = Instance.new('ImageLabel')
shadow.AnchorPoint = Vector2.new(0.5, 0.5)
shadow.Position = UDim2.new(0.5, 0, 0.5, 8)
shadow.Size = UDim2.new(1, 24, 1, 24)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageTransparency = 0.4
shadow.Parent = frame
shadow.ZIndex = 0

-- Animação de entrada
frame.Position = UDim2.new(0.5, 0, 0.5, -300)
frame:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), "Out", "Quad", 0.6, true)

-- Título bonito
local title = Instance.new('TextLabel')
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(180, 220, 255)
title.TextSize = 26
title.Text = 'Sistema de Key do Snow Hub'
title.Parent = frame

-- Subtítulo
local subtitle = Instance.new('TextLabel')
subtitle.BackgroundTransparency = 1
subtitle.Size = UDim2.new(1, 0, 0, 24)
subtitle.Position = UDim2.new(0, 0, 0, 37)
subtitle.Font = Enum.Font.Gotham
subtitle.TextColor3 = Color3.fromRGB(200, 200, 220)
subtitle.TextSize = 16
subtitle.Text = 'Insira sua key abaixo ou obtenha uma.'
subtitle.Parent = frame

-- Caixa de texto da key
local textbox = Instance.new('TextBox')
textbox.Size = UDim2.new(0.82, 0, 0, 33)
textbox.Position = UDim2.new(0.09, 0, 0, 72)
textbox.BackgroundColor3 = Color3.fromRGB(44, 48, 80)
textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
textbox.PlaceholderText = 'Digite sua key aqui'
textbox.Font = Enum.Font.Gotham
textbox.TextSize = 19
textbox.ClearTextOnFocus = false
textbox.Parent = frame

local tbCorner = Instance.new('UICorner')
tbCorner.CornerRadius = UDim.new(0, 12)
tbCorner.Parent = textbox

-- Efeito de borda sutil na caixa de texto
local textboxStroke = Instance.new('UIStroke')
textboxStroke.Color = Color3.fromRGB(100, 140, 200)
textboxStroke.Thickness = 1.2
textboxStroke.Transparency = 0.4
textboxStroke.Parent = textbox

-- Botão verificar key
local checkBtn = Instance.new('TextButton')
checkBtn.Size = UDim2.new(0.38, 0, 0, 34)
checkBtn.Position = UDim2.new(0.09, 0, 0, 125)
checkBtn.BackgroundColor3 = Color3.fromRGB(70, 110, 180)
checkBtn.Font = Enum.Font.GothamBold
checkBtn.TextSize = 18
checkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
checkBtn.Text = 'Verificar Key'
checkBtn.Parent = frame

local chkCorner = Instance.new('UICorner')
chkCorner.CornerRadius = UDim.new(0, 12)
chkCorner.Parent = checkBtn

local checkStroke = Instance.new('UIStroke')
checkStroke.Color = Color3.fromRGB(120, 180, 255)
checkStroke.Thickness = 1
checkStroke.Transparency = 0.35
checkStroke.Parent = checkBtn

-- Botão obter key
local getBtn = Instance.new('TextButton')
getBtn.Size = UDim2.new(0.38, 0, 0, 34)
getBtn.Position = UDim2.new(0.53, 0, 0, 125)
getBtn.BackgroundColor3 = Color3.fromRGB(70, 110, 180)
getBtn.Font = Enum.Font.GothamBold
getBtn.TextSize = 18
getBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getBtn.Text = 'Obter Key'
getBtn.Parent = frame

local getCorner = Instance.new('UICorner')
getCorner.CornerRadius = UDim.new(0, 12)
getCorner.Parent = getBtn

local getStroke = Instance.new('UIStroke')
getStroke.Color = Color3.fromRGB(120, 180, 255)
getStroke.Thickness = 1
getStroke.Transparency = 0.35
getStroke.Parent = getBtn

-- Label de status
local statusLbl = Instance.new('TextLabel')
statusLbl.BackgroundTransparency = 1
statusLbl.Size = UDim2.new(1, 0, 0, 32)
statusLbl.Position = UDim2.new(0, 0, 0, 180)
statusLbl.Font = Enum.Font.Gotham
statusLbl.TextSize = 16
statusLbl.TextColor3 = Color3.fromRGB(120, 190, 255)
statusLbl.Text = ''
statusLbl.Parent = frame

-- Função para verificar key (troque por sua lógica)
local validKey = "CHAVEEXEMPLO123" -- Troque para sua key real
checkBtn.MouseButton1Click:Connect(function()
    if textbox.Text == validKey then
        statusLbl.Text = "Key correta! Acesso liberado."
        statusLbl.TextColor3 = Color3.fromRGB(100, 255, 100)
        -- Código para liberar acesso pode ser adicionado aqui
    else
        statusLbl.Text = "Key inválida! Obtenha uma key válida."
        statusLbl.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

-- Função copiar link ao clicar em Obter Key
getBtn.MouseButton1Click:Connect(function()
    local link = "https://tinyurl.com/mw9f352c"
    if setclipboard then
        setclipboard(link)
        statusLbl.Text = "Link copiado para a área de transferência!"
        statusLbl.TextColor3 = Color3.fromRGB(120, 190, 255)
    else
        statusLbl.Text = "Não foi possível copiar. Copie manualmente:"
        statusLbl.TextColor3 = Color3.fromRGB(255, 200, 100)
    end
    if syn and syn.request then
        syn.request({Url = link, Method = "GET"})
    elseif http_request then
        http_request({Url = link, Method = "GET"})
    end
end)
