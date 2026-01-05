# Cómo Usar el Mod de Canje de Anillos

## 🎮 Formas de Abrir la Ventana de Canje

Una vez que tengas 1000 o más anillos recolectados, puedes canjearlos por un arma de estas formas:

### 1. **Atajo de Teclado (Más Fácil)**
- Presiona la tecla **`J`** mientras juegas
- Se abrirá automáticamente la ventana de canje

### 2. **Menú Contextual**
- Haz **clic derecho** en tu personaje o en tu inventario
- Selecciona la opción **"Canje de Anillos"**
- Se mostrará cuántos anillos tienes: "Canje de Anillos (X / 1000)"

### 3. **Desde la Consola del Juego** (Avanzado)
Si tienes acceso a la consola de depuración:
```lua
RingExchangeUI.createWindow()
```

## 📋 Pasos para Canjear Anillos

1. **Recolecta anillos** del mundo del juego (casas, zombis, contenedores)
2. El mod cuenta automáticamente cada anillo que agregas a tu inventario
3. Verás un mensaje cada vez que recolectas anillos mostrando tu progreso
4. Cuando tengas **1000 o más anillos**, abre la ventana de canje (tecla `J` o menú contextual)
5. **Selecciona un arma** de la lista
6. Haz clic en **"Canjear Anillos por Arma"**
7. ¡El arma aparecerá en tu inventario y se restarán 1000 anillos!

## 💡 Consejos

- **Ver tu progreso**: Cada vez que recolectas anillos, verás un mensaje con tu contador actual
- **Múltiples canjes**: Puedes canjear varias veces si tienes suficientes anillos
- **El contador persiste**: Tu progreso se guarda automáticamente con tu partida
- **No pierdes anillos**: Los anillos físicos NO se eliminan de tu inventario, solo se cuenta cuántos has recolectado

## 🔧 Comandos Útiles (Para Testing)

Si necesitas probar el mod, puedes usar estos comandos desde la consola:

```lua
-- Ver cuántos anillos tienes
RingExchangeCommands.showCount()

-- Agregar anillos manualmente (para testing)
RingExchangeCommands.addRings(1000)

-- Resetear el contador
RingExchangeCommands.reset()
```

## ❓ Preguntas Frecuentes

**P: ¿Los anillos se eliminan de mi inventario cuando los canjeo?**
R: No, el mod solo cuenta cuántos anillos has recolectado. Los anillos físicos permanecen en tu inventario.

**P: ¿Puedo canjear si tengo exactamente 1000 anillos?**
R: Sí, necesitas tener 1000 o más anillos para poder canjear.

**P: ¿Qué pasa si no tengo espacio en el inventario?**
R: El canje fallará y se te notificará. Los anillos no se descontarán si no hay espacio.

**P: ¿Puedo cambiar el atajo de teclado?**
R: Actualmente está configurado en la tecla `J`. Puedes modificarlo editando `lua/client/RingExchangeCommands.lua` (línea 36).

