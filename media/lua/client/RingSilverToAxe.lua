-- RingSilverToAxe Mod - Build 41 Compatible
-- Cambia anillos por objetos

print("RingSilverToAxe: Mod cargado correctamente")

require "Items/InventoryItemFactory"

Events.OnFillInventoryObjectContextMenu.Add(function(playerNum, context, items)
    local player = getSpecificPlayer(playerNum)
    if not player then return end

    local inv = player:getInventory()
    if not inv then return end

    -- Contar todos los anillos (excluyendo KeyRing)
    local ringCount = 0
    local allItems = inv:getItems()
    if allItems then
        for i = 0, allItems:size() - 1 do
            local item = allItems:get(i)
            if item then
                local itemType = item:getFullType()
                -- Buscar cualquier item que contenga "Ring" pero NO "KeyRing"
                if string.find(itemType, "Ring") and not string.find(itemType, "KeyRing") then
                    ringCount = ringCount + item:getCount()
                end
            end
        end
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

                    -- Remover anillos
                    local removed = 0
                    local allItems2 = pInv:getItems()
                    if allItems2 then
                        for i = 0, allItems2:size() - 1 do
                            local item = allItems2:get(i)
                            if item and removed < exchange.rings then
                                local itemType = item:getFullType()
                                -- Buscar anillos (excluyendo KeyRing)
                                if string.find(itemType, "Ring") and not string.find(itemType, "KeyRing") then
                                    local count = item:getCount()
                                    for j = 1, math.min(count, exchange.rings - removed) do
                                        pInv:Remove(item)
                                        removed = removed + 1
                                        if removed >= exchange.rings then break end
                                    end
                                end
                            end
                            if removed >= exchange.rings then break end
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
