-- Interfaz de usuario para canjear anillos por armas
-- Crea una ventana donde el jugador puede canjear sus anillos

require "RingTracker"

RingExchangeUI = {}
RingExchangeUI.window = nil

-- Lista de armas disponibles para canjear
RingExchangeUI.availableWeapons = {
    {type = "Base.Axe", name = "Hacha"},
    {type = "Base.BaseballBat", name = "Bate de Béisbol"},
    {type = "Base.HuntingKnife", name = "Cuchillo de Caza"},
    {type = "Base.Machete", name = "Machete"},
    {type = "Base.Katana", name = "Katana"},
    {type = "Base.Pistol", name = "Pistola"},
    {type = "Base.Shotgun", name = "Escopeta"},
    {type = "Base.AssaultRifle", name = "Rifle de Asalto"},
}

-- Crear la ventana de intercambio
function RingExchangeUI.createWindow()
    if RingExchangeUI.window then
        RingExchangeUI.window:destroy()
    end
    
    local player = getPlayer()
    if not player then return end
    
    local ringCount = RingTracker.getCount()
    local canExchange = RingTracker.canExchange()
    
    -- Crear la ventana
    local width = 400
    local height = 300
    local x = (getCore():getScreenWidth() - width) / 2
    local y = (getCore():getScreenHeight() - height) / 2
    
    RingExchangeUI.window = ISWindow:new(x, y, width, height)
    RingExchangeUI.window:initialise()
    RingExchangeUI.window:setTitle("Canje de Anillos")
    RingExchangeUI.window:setVisible(true)
    RingExchangeUI.window:addToUIManager()
    RingExchangeUI.window:setAlwaysOnTop(true)
    
    -- Texto informativo
    local infoY = 30
    local infoText = ISRichTextPanel:new(10, infoY, width - 20, 60)
    infoText:initialise()
    infoText:paginate()
    infoText:setText("Anillos recolectados: " .. ringCount .. " / " .. RingTracker.ringsNeeded)
    RingExchangeUI.window:addChild(infoText)
    
    -- Lista de armas disponibles
    local listY = infoY + 70
    local listHeight = 150
    local weaponList = ISScrollingListBox:new(10, listY, width - 20, listHeight)
    weaponList:initialise()
    weaponList:setFont(UIFont.Medium)
    
    for i, weapon in ipairs(RingExchangeUI.availableWeapons) do
        weaponList:addItem(weapon.name, weapon)
    end
    
    RingExchangeUI.window:addChild(weaponList)
    
    -- Botón de canje
    local buttonY = listY + listHeight + 10
    local exchangeButton = ISButton:new(10, buttonY, width - 20, 30, "Canjear Anillos por Arma", RingExchangeUI.window, RingExchangeUI.onExchangeClick)
    exchangeButton:initialise()
    exchangeButton:setEnable(canExchange)
    RingExchangeUI.window:addChild(exchangeButton)
    
    RingExchangeUI.weaponList = weaponList
    RingExchangeUI.exchangeButton = exchangeButton
end

-- Función que se ejecuta al hacer clic en el botón de canje
function RingExchangeUI.onExchangeClick()
    local player = getPlayer()
    if not player then return end
    
    if not RingTracker.canExchange() then
        player:Say("No tienes suficientes anillos. Necesitas " .. RingTracker.ringsNeeded .. " anillos.")
        return
    end
    
    local selectedWeapon = RingExchangeUI.weaponList.selected
    if not selectedWeapon or selectedWeapon < 0 then
        player:Say("Por favor, selecciona un arma de la lista.")
        return
    end
    
    local weaponData = RingExchangeUI.availableWeapons[selectedWeapon + 1]
    if not weaponData then return end
    
    -- Canjear los anillos
    if RingTracker.exchangeRings() then
        -- Agregar el arma al inventario
        local weapon = player:getInventory():AddItem(weaponData.type)
        if weapon then
            player:Say("¡Has canjeado " .. RingTracker.ringsNeeded .. " anillos por " .. weaponData.name .. "!")
            RingExchangeUI.window:destroy()
            RingExchangeUI.window = nil
        else
            player:Say("Error: No se pudo agregar el arma al inventario.")
            -- Devolver los anillos si falla
            RingTracker.addRings(RingTracker.ringsNeeded)
        end
    else
        player:Say("Error al canjear los anillos.")
    end
end

-- Comando para abrir la ventana de canje
RingExchangeUI.command = function()
    RingExchangeUI.createWindow()
end

-- Registrar el comando en el juego
Events.OnGameStart.Add(function()
    -- El comando se puede llamar desde la consola o desde un menú
    -- Por ahora, lo haremos accesible desde un evento de teclado o desde la consola
end)

