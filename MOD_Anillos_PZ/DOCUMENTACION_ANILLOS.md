# Mod de Canje de Anillos - Documentación

## Descripción

Este mod permite al jugador recolectar anillos y canjearlos por armas. Cada vez que recolectas 1000 anillos, puedes canjearlos por un arma de tu elección.

## ⚠️ IMPORTANTE: No Necesitas Otros Mods

**Este mod funciona con los anillos que ya vienen incluidos en Project Zomboid.** No necesitas instalar ningún mod adicional como "Collect Jewelry" o similares. Los anillos del juego base se pueden encontrar en:
- Casas residenciales (dormitorios, baños)
- Cuerpos de zombis
- Contenedores diversos

El mod detecta automáticamente todos los anillos que recolectas del juego base.

## Funcionalidades

### 1. Rastreo Automático de Anillos
- El mod detecta automáticamente cuando recoges anillos
- Cuenta todos los anillos que agregas a tu inventario
- El contador se guarda automáticamente en tu partida

### 2. Sistema de Canje
- Cuando alcanzas 1000 anillos, puedes canjearlos por un arma
- Ventana de interfaz para seleccionar el arma que deseas
- Lista de armas disponibles para canjear

### 3. Persistencia de Datos
- El contador de anillos se guarda usando ModData
- Los datos persisten entre sesiones de juego
- Se carga automáticamente cuando inicias una partida

## Estructura del Mod

```
RingExchangeMod/
├── mod.info                          # Información del mod
├── lua/
│   ├── shared/
│   │   ├── RingTracker.lua          # Sistema de rastreo y guardado
│   │   └── RingCollector.lua        # Detección de anillos recolectados
│   └── client/
│       ├── RingExchangeUI.lua       # Interfaz de usuario
│       └── RingExchangeCommands.lua  # Comandos y atajos
```

## Cómo Usar

### Recolectar Anillos
1. Simplemente recoge anillos del mundo como lo harías normalmente
2. El mod detectará automáticamente cuando agregas anillos a tu inventario
3. Verás un mensaje indicando cuántos anillos has recolectado

### Canjear Anillos por Arma
1. Cuando tengas 1000 o más anillos, abre la ventana de canje usando una de estas formas:
   - **Presiona la tecla `J`** (más fácil)
   - **Clic derecho en tu personaje/inventario** → "Canje de Anillos"
   - Desde la consola: `RingExchangeUI.createWindow()`
2. Selecciona el arma que deseas de la lista
3. Haz clic en "Canjear Anillos por Arma"
4. El arma se agregará a tu inventario y se restarán 1000 anillos del contador

### Abrir la Ventana de Canje
- **Tecla `J`**: Presiona J mientras juegas (recomendado)
- **Menú contextual**: Clic derecho en personaje/inventario → "Canje de Anillos"
- **Desde la consola**: Ejecuta `RingExchangeUI.createWindow()`

## Armas Disponibles

El mod incluye las siguientes armas para canjear:
- Hacha (Axe)
- Bate de Béisbol (BaseballBat)
- Cuchillo de Caza (HuntingKnife)
- Machete
- Katana
- Pistola (Pistol)
- Escopeta (Shotgun)
- Rifle de Asalto (AssaultRifle)

Puedes modificar la lista en `lua/client/RingExchangeUI.lua` en la variable `availableWeapons`.

## Personalización

### Cambiar la Cantidad de Anillos Necesarios

Edita `lua/shared/RingTracker.lua`:
```lua
RingTracker.ringsNeeded = 1000  -- Cambia este valor
```

### Agregar Más Armamentos

Edita `lua/client/RingExchangeUI.lua` y agrega a la lista `availableWeapons`:
```lua
{type = "Base.TuArma", name = "Nombre del Arma"},
```

### Agregar Más Tipos de Anillos

Si tienes mods que agregan nuevos tipos de anillos, edita `lua/shared/RingCollector.lua`:
```lua
local ringTypes = {
    "Base.Ring",
    "Base.TuNuevoAnillo",  -- Agrega aquí
    -- ...
}
```

## Información Técnica

### Eventos Utilizados
- `Events.OnItemAdded`: Detecta cuando se agregan items al inventario
- `Events.OnGameStart`: Inicializa el sistema cuando el juego inicia
- `Events.OnCreatePlayer`: Carga los datos guardados cuando se crea el personaje

### ModData
El mod guarda los datos usando ModData del jugador:
- Clave: `"RingExchangeMod"`
- Datos guardados: `ringCount` (número de anillos recolectados)

### Compatibilidad
- Compatible con Project Zomboid versión 41.78.16 o superior
- Funciona en modo singleplayer y multiplayer
- Compatible con otros mods que no modifiquen el sistema de anillos
- **Funciona con anillos del juego base** - No requiere mods adicionales
- Compatible con mods que agreguen nuevos tipos de anillos (se detectan por nombre)

## Solución de Problemas

### El contador no se actualiza
- Verifica que el mod esté activado en el menú de mods
- Asegúrate de que los anillos se agreguen a tu inventario (no solo los recojas del suelo)
- Revisa la consola del juego para mensajes de error

### No puedo abrir la ventana de canje
- Verifica que tengas al menos 1000 anillos recolectados
- Intenta reiniciar el juego
- Revisa los logs del juego para errores

### Los datos no se guardan
- El ModData se guarda automáticamente con la partida
- Si pierdes los datos, puede ser un problema de guardado del juego
- Considera hacer backups de tus partidas

## Desarrollo y Testing

### Comandos Útiles para Testing

Puedes usar estas funciones desde la consola del juego (si está disponible):
```lua
-- Ver contador actual
RingExchangeCommands.showCount()

-- Agregar anillos manualmente
RingExchangeCommands.addRings(1000)

-- Resetear contador
RingExchangeCommands.reset()

-- Abrir ventana de canje
RingExchangeUI.createWindow()
```

## Próximas Mejoras Posibles

- [ ] Agregar más tipos de recompensas (no solo armas)
- [ ] Sistema de niveles (diferentes recompensas según cantidad de anillos)
- [ ] Interfaz mejorada con iconos
- [ ] Sonidos y efectos visuales
- [ ] Estadísticas de anillos recolectados
- [ ] Logros relacionados con anillos

## Créditos

Mod creado para Project Zomboid
Versión: 1.0.0

