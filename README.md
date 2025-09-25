-- LocalScript (filho do botão GetKey ou em StarterGui)
local GuiService = game:GetService("GuiService")
local StarterGui = game:GetService("StarterGui")

local url = "https://tinyurl.com/mw9f352c"
local button = script.Parent -- ajuste se o script não estiver dentro do botão

local function notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title or "Aviso",
            Text = text or "",
            Duration = duration or 4
        })
    end)
end

-- Envia uma mensagem de sistema no chat (útil para copiar/abrir manualmente)
local function sendChatMessage(msg)
    pcall(function()
        StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = msg,
            Color = Color3.fromRGB(255, 255, 255),
            Font = Enum.Font.SourceSans,
            FontSize = Enum.FontSize.Size24
        })
    end)
end

local function openUrl(u)
    -- tenta abrir com GuiService
    local ok, err = pcall(function()
        GuiService:OpenBrowserWindow(u)
    end)

    if ok then
        notify("Link aberto", "O link foi aberto no seu navegador.", 3)
        return
    end

    -- se falhar, loga e tenta fallback
    warn("OpenBrowserWindow falhou: ", err)
    notify("Não abriu automaticamente", "Tentando alternativas...", 4)

    -- Fallback: coloca o link no chat para o usuário copiar manualmente
    sendChatMessage("Link: " .. u)
    notify("Link no chat", "O link foi enviado no chat (copie/abra manualmente).", 6)
end

button.Activated:Connect(function()
    -- debug print para ver no Output
    print("[GetKey] Botão ativado, tentando abrir URL:", url)
    openUrl(url)
end)
