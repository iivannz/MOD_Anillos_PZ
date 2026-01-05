-- Sistema de rastreo de anillos recolectados
-- Este módulo gestiona el contador de anillos y el guardado de datos

RingTracker = {}
RingTracker.ringCount = 0
RingTracker.ringsNeeded = 1000
RingTracker.modDataKey = "RingExchangeMod"

-- Inicializar el contador desde ModData
function RingTracker.init()
    local player = getPlayer()
    if not player then return end
    
    local modData = player:getModData()
    if modData[RingTracker.modDataKey] then
        RingTracker.ringCount = modData[RingTracker.modDataKey].ringCount or 0
    else
        modData[RingTracker.modDataKey] = {}
        modData[RingTracker.modDataKey].ringCount = 0
        RingTracker.ringCount = 0
    end
    
    print("RingTracker: Inicializado. Anillos actuales: " .. RingTracker.ringCount)
end

-- Guardar el contador en ModData
function RingTracker.save()
    local player = getPlayer()
    if not player then return end
    
    local modData = player:getModData()
    if not modData[RingTracker.modDataKey] then
        modData[RingTracker.modDataKey] = {}
    end
    modData[RingTracker.modDataKey].ringCount = RingTracker.ringCount
end

-- Agregar anillos al contador
function RingTracker.addRings(amount)
    amount = amount or 1
    RingTracker.ringCount = RingTracker.ringCount + amount
    RingTracker.save()
    
    local player = getPlayer()
    if player then
        player:Say("Anillos recolectados: " .. RingTracker.ringCount .. " / " .. RingTracker.ringsNeeded)
        
        -- Notificar cuando se alcanza el objetivo
        if RingTracker.ringCount >= RingTracker.ringsNeeded then
            player:Say("¡Has recolectado " .. RingTracker.ringsNeeded .. " anillos! Puedes canjearlos por un arma.")
        end
    end
    
    print("RingTracker: Anillos agregados. Total: " .. RingTracker.ringCount)
end

-- Obtener el contador actual
function RingTracker.getCount()
    return RingTracker.ringCount
end

-- Verificar si se pueden canjear anillos
function RingTracker.canExchange()
    return RingTracker.ringCount >= RingTracker.ringsNeeded
end

-- Canjear anillos por arma (resta los anillos del contador)
function RingTracker.exchangeRings()
    if not RingTracker.canExchange() then
        return false
    end
    
    RingTracker.ringCount = RingTracker.ringCount - RingTracker.ringsNeeded
    RingTracker.save()
    
    print("RingTracker: Anillos canjeados. Restantes: " .. RingTracker.ringCount)
    return true
end

-- Resetear el contador (útil para testing)
function RingTracker.reset()
    RingTracker.ringCount = 0
    RingTracker.save()
    print("RingTracker: Contador reseteado")
end

