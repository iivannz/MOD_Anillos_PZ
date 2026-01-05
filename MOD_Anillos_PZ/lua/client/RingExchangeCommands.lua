-- Comandos y atajos de teclado para el mod de canje de anillos

require "RingTracker"
require "RingExchangeUI"

RingExchangeCommands = {}

-- Función para abrir la ventana desde la consola
function RingExchangeCommands.openExchangeWindow()
    RingExchangeUI.createWindow()
end

-- Función para ver el contador actual
function RingExchangeCommands.showCount()
    local player = getPlayer()
    if player then
        local count = RingTracker.getCount()
        player:Say("Anillos recolectados: " .. count .. " / " .. RingTracker.ringsNeeded)
    end
end

-- Función para resetear el contador (útil para testing)
function RingExchangeCommands.reset()
    local player = getPlayer()
    if player then
        RingTracker.reset()
        player:Say("Contador de anillos reseteado.")
    end
end

-- Función para agregar anillos manualmente (útil para testing)
function RingExchangeCommands.addRings(amount)
    amount = tonumber(amount) or 100
    RingTracker.addRings(amount)
    local player = getPlayer()
    if player then
        player:Say("Se agregaron " .. amount .. " anillos.")
    end
end

-- Configurar atajo de teclado para abrir la ventana de canje
-- Usaremos un hook en OnKeyPressed para detectar cuando se presiona 'J'
Events.OnKeyPressed.Add(function(key)
    -- Presionar 'J' (código 36) para abrir la ventana de canje
    -- Solo funciona cuando el juego no está pausado y hay un jugador
    if key == 36 then -- Tecla J
        local player = getPlayer()
        if player and not isPaused() and not getCore():getKey("MainMenu"):isDown() then
            -- Verificar que no haya otra ventana abierta
            if not RingExchangeUI.window then
                RingExchangeUI.createWindow()
            end
        end
    end
end)

-- Agregar opción al menú contextual del inventario del personaje
Events.OnFillInventoryObjectContextMenu.Add(function(player, context, items)
    if not player or not context then return end
    
    local ringCount = RingTracker.getCount()
    
    -- Agregar opción al menú contextual
    context:addOption("Canje de Anillos (" .. ringCount .. " / " .. RingTracker.ringsNeeded .. ")", player, function()
        RingExchangeUI.createWindow()
    end)
end)

