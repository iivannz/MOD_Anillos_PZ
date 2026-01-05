require "Items/InventoryItemFactory"

print("RING EXCHANGE MOD CARGADO (CLIENT)")

-- Usar OnFillInventoryContextMenu (se dispara siempre, no requiere item seleccionado)
Events.OnFillInventoryContextMenu.Add(function(playerNum, context)
    local player = getSpecificPlayer(playerNum)
    if not player then return end

    local inv = player:getInventory()
    if not inv then return end

    -- Contar todos los tipos de anillos (incluye equipados)
    local RING_TYPES = {
        "Base.Ring",
        "Base.Ring_Left_RingFinger",
        "Base.Ring_Right_RingFinger",
        "Base.Ring_Left_MiddleFinger",
        "Base.Ring_Right_MiddleFinger",
    }

    local ringCount = 0
    for _, ringType in ipairs(RING_TYPES) do
        ringCount = ringCount + inv:getItemCount(ringType, true)
    end

    if ringCount <= 0 then return end

    -- Configuración de intercambios
    local EXCHANGES = {
        {rings = 3, item = "Base.Axe", name = "Hacha"},
        {rings = 5, item = "Base.Battery", name = "Batería"},
        {rings = 100, item = "Base.Pistol", name = "Pistola"},
        {rings = 150, item = "Base.EngineParts", name = "Piezas Motor"},
        {rings = 250, item = "Base.Shotgun", name = "Escopeta"},
    }

    -- Agregar opciones de intercambio
    for _, exchange in ipairs(EXCHANGES) do
        if ringCount >= exchange.rings then
            context:addOption(
                exchange.rings .. " Anillos → " .. exchange.name,
                player,
                function(p)
                    local pInv = p:getInventory()
                    if not pInv then return end

                    -- Remover anillos usando RemoveOneOf (método seguro)
                    local removed = 0
                    for i = 1, exchange.rings do
                        for _, ringType in ipairs(RING_TYPES) do
                            if pInv:getItemCount(ringType, true) > 0 then
                                pInv:RemoveOneOf(ringType)
                                removed = removed + 1
                                break
                            end
                        end
                    end

                    -- Si se removieron suficientes anillos, agregar el item
                    if removed >= exchange.rings then
                        local newItem = InventoryItemFactory.CreateItem(exchange.item)
                        if newItem then
                            pInv:AddItem(newItem)
                            p:Say(exchange.name .. " obtenida")
                        end
                    else
                        p:Say("Error al remover anillos")
                    end
                end
            )
        end
    end
end)
