# Mod de Canje de Anillos - Project Zomboid

## ⚠️ No Necesitas Mods Adicionales

Este mod funciona con los **anillos del juego base** de Project Zomboid. No necesitas instalar ningún mod adicional como "Collect Jewelry" o similares. Los anillos ya están en el juego y se pueden encontrar en casas, baños, dormitorios y en los cuerpos de zombis.

## Estructura del Mod

Los mods de Project Zomboid siguen una estructura específica:

```
MiMod/
├── mod.info          # Información del mod (obligatorio)
├── media/            # Recursos del juego (texturas, sonidos, etc.)
│   ├── textures/     # Texturas
│   ├── sounds/       # Sonidos
│   └── ui/           # Interfaz de usuario
├── lua/              # Scripts Lua
│   └── client/       # Scripts del cliente
│   └── server/       # Scripts del servidor
│   └── shared/       # Scripts compartidos
└── scripts/          # Scripts adicionales
```

## Instalación

1. Copia la carpeta del mod a: `C:\Users\TU_USUARIO\Zomboid\mods\` (Windows) o `~/.local/share/Steam/steamapps/common/ProjectZomboid/mods/` (Linux/Mac)

2. Activa el mod desde el menú de mods en el juego

## Desarrollo

### Archivo mod.info
- `id`: Identificador único del mod (sin espacios)
- `name`: Nombre que se muestra en el juego
- `description`: Descripción del mod
- `modversion`: Versión del mod
- `pzversion`: Versión de Project Zomboid requerida

### Scripts Lua
Los scripts Lua se ejecutan en diferentes contextos:
- **client/**: Solo se ejecuta en el cliente
- **server/**: Solo se ejecuta en el servidor
- **shared/**: Se ejecuta en ambos

## Recursos

- [Documentación oficial de modding](https://pzwiki.net/wiki/Modding)
- [API de Project Zomboid](https://projectzomboid.com/modding/)
- [Foros de modding](https://theindiestone.com/forums/index.php?/forum/31-modding/)


