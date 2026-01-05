-- Ejemplo de script compartido para tu mod
-- Este archivo se ejecuta tanto en cliente como en servidor

-- Función de ejemplo que se puede llamar desde otros scripts
function MyModFunction()
    print("¡Mi mod está funcionando!")
end

-- Evento que se ejecuta cuando el mod se carga
Events.OnGameBoot.Add(function()
    print("Mi Mod cargado correctamente")
end)


