# RingSilverToAxe - Mod de Intercambio de Anillos

Mod para Project Zomboid Build 41.78.16 que permite intercambiar anillos por objetos útiles.

## 📋 Descripción

Este mod agrega la funcionalidad de intercambiar anillos por diferentes objetos en el juego. Los anillos pueden ser encontrados en el mundo y luego canjeados por items valiosos.

## 🎮 Cómo Usar

1. **Activa el mod** en el menú de mods de Project Zomboid
2. **Recolecta anillos** del mundo (casas, zombis, contenedores)
3. **Abre tu inventario** (Tab o I)
4. **Haz clic derecho** en cualquier item del inventario
5. **Selecciona la opción de intercambio** que desees

## 💰 Intercambios Disponibles

- **3 anillos** → Hacha (Base.Axe)
- **5 anillos** → Batería (Base.Battery)
- **100 anillos** → Pistola (Base.Pistol)
- **150 anillos** → Piezas Motor (Base.EngineParts)
- **250 anillos** → Escopeta (Base.Shotgun)

## ✨ Características

- ✅ Funciona con todos los tipos de anillos (Gold, Silver, etc.)
- ✅ Cuenta anillos equipados y en inventario
- ✅ No cuenta KeyRing como anillo
- ✅ Interfaz simple mediante menú contextual
- ✅ Compatible con Build 41.78.16

## 📦 Instalación

1. Descarga o clona este repositorio
2. Copia la carpeta `RingSilverToAxe` a tu carpeta de mods:
   - **Windows**: `C:\Users\TU_USUARIO\Zomboid\mods\`
   - **Mac/Linux**: `~/.local/share/Steam/steamapps/common/ProjectZomboid/mods/`
   - **No Steam**: `~/Zomboid/mods/`
3. Activa el mod en el menú de mods del juego
4. Reinicia completamente Project Zomboid

## 🔧 Estructura del Mod

```
RingSilverToAxe/
├── mod.info
├── README.md
└── media/
    └── lua/
        └── client/
            └── RingSilverToAxe.lua
```

## 📝 Notas

- El mod busca anillos que contengan "Ring" en su nombre (excluyendo KeyRing)
- Funciona con anillos equipados en los dedos
- Las opciones de intercambio solo aparecen si tienes suficientes anillos

## 🐛 Reportar Problemas

Si encuentras algún problema, por favor abre un issue en el repositorio de GitHub.

## 📄 Licencia

Este mod es de código abierto. Siéntete libre de modificarlo y mejorarlo.

