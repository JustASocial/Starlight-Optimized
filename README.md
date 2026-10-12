# Starlight-Optimized

Optimized build of the Starlight Interface Suite (+ usage example).

- `Source.lua` — optimized, comment-free build (Perf core: cached TweenInfos,
  tween manager with cancellation, batched theme dispatcher, throttled
  per-frame handlers, fast Hide/Unhide).
- `Example.lua` — full interface test: window, tab sections, tabs, groupboxes,
  toggles, sliders, buttons, inputs, labels, paragraphs, dividers, nested
  binds / dropdowns / color pickers, notifications, dialogs, themes, configs.

Load order:

```lua
local Starlight = loadstring(game:HttpGet("https://raw.githubusercontent.com/JustASocial/Starlight-Optimized/main/Source.lua"))()
```

Original project by Nebula Softworks. See `LICENSE`.
