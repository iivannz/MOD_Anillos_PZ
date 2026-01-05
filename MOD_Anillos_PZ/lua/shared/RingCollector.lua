-- Sistema de detección de anillos recolectados
-- Detecta cuando el jugador recoge anillos y actualiza el contador
-- NOTA: Funciona con los anillos del juego base de Project Zomboid
-- NO es necesario instalar mods adicionales para recolectar anillos

require "RingTracker"

-- Lista de tipos de anillos en Project Zomboid (juego base)
-- Estos son los anillos que vienen incluidos en el juego
local ringTypes = {
    "Base.Ring",                      -- Anillo genérico
    "Base.Ring_Left_RingFinger",      -- Anillo en dedo anular izquierdo
    "Base.Ring_Right_RingFinger",     -- Anillo en dedo anular derecho
    "Base.Ring_Left_MiddleFinger",   -- Anillo en dedo medio izquierdo
    "Base.Ring_Right_MiddleFinger",  -- Anillo en dedo medio derecho
}

-- Verificar si un item es un anillo
local function isRing(item)
    if not item then return false end
    
    local itemType = item:getType()
    
    -- Verificar por tipo
    for _, ringType in ipairs(ringTypes) do
        if itemType == ringType then
            return true
        end
    end
    
    -- Verificar por nombre (por si hay mods que agreguen anillos)
    local itemName = item:getName()
    if itemName and string.find(string.lower(itemName), "ring") then
        return true
    end
    
    return false
end

-- Evento cuando se agrega un item al inventario
Events.OnItemAdded.Add(function(item, inventory)
    if not item or not inventory then return end
    
    local player = getPlayer()
    if not player then return end
    
    -- Verificar que el item fue agregado al inventario del jugador
    if inventory == player:getInventory() and isRing(item) then
        -- Contar cuántos anillos se agregaron (puede ser un stack)
        local count = item:getCount()
        RingTracker.addRings(count)
    end
end)

-- Evento cuando el juego inicia para inicializar el tracker
Events.OnGameStart.Add(function()
    -- Esperar un momento para que el jugador esté completamente cargado
    local player = getPlayer()
    if player then
        RingTracker.init()
    end
end)

-- Evento cuando el personaje se carga (para cargar datos guardados)
Events.OnCreatePlayer.Add(function(playerIndex, player)
    if player then
        RingTracker.init()
    end
end)

