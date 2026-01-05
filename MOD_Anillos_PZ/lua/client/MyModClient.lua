-- Script del cliente
-- Este código solo se ejecuta en el cliente

-- Ejemplo: Agregar un comando de consola
Events.OnGameStart.Add(function()
    -- Tu código aquí
    print("Cliente: Mi mod está activo")
end)

-- Ejemplo: Interceptar eventos del juego
Events.OnPlayerUpdate.Add(function(player)
    -- Tu código aquí
end)


