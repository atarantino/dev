# Kinesis Advantage — kinT (kint2pp) QMK keymap

Keymap `tiny` for `kinesis/kint2pp` (stapelberg kinT controller, Teensy++ 2.0 / AT90USB1286, HalfKay bootloader).

## Files

- `keymap.c` — source of truth. Drop into `qmk_firmware/keyboards/kinesis/keymaps/tiny/`.
- `tiny.json` — importable at <https://config.qmk.fm> to view/edit the layers visually. Note: the configurator can't represent the LED indicator code in `keymap.c`, so treat the JSON as a viewer, not the source of truth.

## Layers

- **Layer 0** — base QWERTY with tap-hold mods (Ctrl/Caps, RAlt/Quote, RCtl/Space, Meh/PgDn).
- **Layer 1** — left-hand Excalidraw layer, toggled by the **Keypad** key (`TG(1)`). The **Num Lock LED lights while active**. Designed for drawing with the pen in the right hand:
  - Number row `1–5`: native Excalidraw tools (select / rect / diamond / ellipse / arrow)
  - `Q W E R T` → `6 7 8 9 0` (line / draw / text / image / eraser)
  - `Tab` → `H` (hand tool), `B` → `Q` (lock tool)
  - `A` undo, `S` redo, `D` delete, `F` duplicate, `G` group
  - `Z X C V` → undo / cut / copy / paste
  - `F1/F2` zoom out/in, `F3` zoom to fit
  - Backspace thumb → `Space` (hold to pan)
- **Layer 2** — left-hand Lucidspark/Lucidchart layer, toggled by the **Pause** key (`TG(2)`). The **Scroll Lock LED lights while active**. Same physical philosophy as layer 1:
  - Number row `1–5` → `V S O F E` (select / shape / oval / frame / eraser)
  - `Q W E R T` → `N P T R L` (sticky note / pen / text / rectangle / line)
  - `Tab` → `H` (pan tool)
  - `A` undo, `S` redo (Ctrl+Y), `D` delete, `F` duplicate, `G` group
  - `Z X C V` → undo / cut / copy / paste, `B` → select all
  - `F1/F2` zoom out/in, `F3` zoom to default (Ctrl+0)
  - Backspace thumb → `Space` (hold to pan)

The two drawing layers can't stack: each layer disables the other layer's toggle key while active.

## LED indicators

Caps LED = real host caps lock. Num = layer 1, Scroll = layer 2, Keypad = layer 3 (layer 3 not yet defined). Host lock-state updates for the three layer LEDs are blocked in `led_update_user`.

## Build (Docker, no local toolchain)

```sh
docker run --rm -v "<qmk_firmware>:/qmk_firmware" -w /qmk_firmware qmkfm/qmk_cli make kinesis/kint2pp:tiny
```

## Flash

Open QMK Toolbox, load the built hex, set MCU to **AT90USB1286**, enable Auto-Flash, then press the **Progrm** key (mapped to `QK_BOOT`) on the keyboard.
