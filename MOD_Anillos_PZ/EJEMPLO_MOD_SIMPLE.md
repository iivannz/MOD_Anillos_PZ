# Ejemplo de Mod Simple

## Mod: "Saludo Personalizado"

Este es un ejemplo de un mod muy simple que muestra un mensaje cuando el jugador inicia el juego.

### Archivo: `lua/shared/SaludoMod.lua`

```lua
-- Mod de Saludo Personalizado
-- Muestra un mensaje cuando el jugador inicia el juego

Events.OnGameStart.Add(function()
    -- Esperar un momento para que el juego esté completamente cargado
    local player = getPlayer()
    if player then
        player:Say("¡Hola! Mi mod está funcionando correctamente.")
    end
end)
```

## Tipos de Mods Comunes

### 1. Mods de Items/Objetos
- Agregar nuevas armas, herramientas, comida, etc.
- Requiere crear texturas en `media/textures/`
- Requiere definir el item en Lua

### 2. Mods de Mapas
- Agregar nuevas ubicaciones al mapa
- Requiere archivos `.lot` y `.map`

### 3. Mods de Mecánicas
- Cambiar cómo funciona el juego
- Modificar sistemas existentes
- Agregar nuevas características

### 4. Mods de Personajes/Profesiones
- Agregar nuevas profesiones
- Modificar características de personajes

### 5. Mods de Vehículos
- Agregar nuevos vehículos
- Modificar vehículos existentes

## Eventos Comunes de Project Zomboid

- `Events.OnGameStart` - Cuando el juego inicia
- `Events.OnPlayerUpdate` - Cada frame del jugador
- `Events.OnPlayerDeath` - Cuando el jugador muere
- `Events.OnZombieUpdate` - Cada frame de un zombie
- `Events.OnPreInit` - Antes de que el juego se inicialice
- `Events.OnInit` - Cuando el juego se inicializa
- `Events.OnPostInit` - Después de que el juego se inicializa

## Funciones Útiles

```lua
-- Obtener el jugador
local player = getPlayer()

-- Obtener la celda actual
local cell = getCell()

-- Obtener todos los zombies en un área
local zombies = cell:getZombieList()

-- Mostrar mensaje en pantalla
player:Say("Mensaje")

-- Agregar item al inventario
player:getInventory():AddItem("Base.Axe")
```


