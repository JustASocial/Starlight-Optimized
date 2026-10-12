local Starlight = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/starlight"))()
local NebulaIcons = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/nebula-icon-library-loader"))()

local Window = Starlight:CreateWindow({
	Name = "Starlight Example",
	Subtitle = "v1.0",
	Icon = 105789146907268,
	LoadingSettings = {
		Title = "Starlight Example",
		Subtitle = "Testing every element",
	},
	FileSettings = {
		ConfigFolder = "StarlightExample",
	},
	NotifyOnCallbackError = true,
})

local MainSection = Starlight.Window:CreateTabSection("Main", true)
local TestSection = Starlight.Window:CreateTabSection("Tests", true)

local Tab = MainSection:CreateTab({
	Name = "Elements",
	Icon = NebulaIcons:GetIcon("view_in_ar", "Material"),
	Columns = 2,
}, "elements")

local Tab2 = TestSection:CreateTab({
	Name = "More",
	Icon = NebulaIcons:GetIcon("settings", "Material"),
	Columns = 2,
}, "more")

local G = Tab:CreateGroupbox({ Name = "Buttons and Toggles", Column = 1 }, "g1")
local G2 = Tab:CreateGroupbox({ Name = "Inputs and Sliders", Column = 2 }, "g2")

local Btn = G:CreateButton({
	Name = "Dialog Button",
	Icon = NebulaIcons:GetIcon("check", "Material"),
	Tooltip = "Opens a dialog",
	Style = 1,
	Callback = function()
		Starlight.Window:PromptDialog({
			Name = "Dialog Test",
			Content = "Pick an action",
			Type = 1,
			Actions = {
				Primary = {
					Name = "OK",
					Callback = function()
						Starlight:Notification({ Title = "Dialog", Content = "OK pressed" })
					end,
				},
				{ Name = "Cancel", Callback = function() end },
			},
		})
	end,
}, "btn")

local Tgl
G:CreateButton({
	Name = "Lock Toggle Test",
	Callback = function()
		Tgl:Lock("locked from example")
		task.delay(1.5, function() Tgl:Unlock() end)
	end,
}, "btnlock")

Tgl = G:CreateToggle({
	Name = "Toggle Checkbox",
	CurrentValue = false,
	Tooltip = "checkbox style",
	Callback = function(v) print("toggle:", v) end,
}, "tggle")

G:CreateToggle({
	Name = "Toggle Switch",
	Style = 2,
	CurrentValue = true,
	SyncToggleState = true,
	Callback = function(v) print("switch:", v) end,
}, "tggle2"):AddBind({
	CurrentValue = "Q",
	SyncToggleState = true,
	Tooltip = "bind on toggle",
}, "bnd2")

G:CreateCheckbox({
	Name = "Standalone Checkbox",
	CurrentValue = false,
	Callback = function(v) print("checkbox:", v) end,
}, "chk")

G:CreateSwitch({
	Name = "Standalone Switch",
	CurrentValue = true,
	Callback = function(v) print("switch2:", v) end,
}, "sw")

G:CreatePrimaryButton({ Name = "Primary", Callback = function() print("primary") end }, "pbtn")
G:CreateSecondaryButton({ Name = "Secondary", Callback = function() print("secondary") end }, "sbtn")

G2:CreateSlider({
	Name = "Slider",
	Range = { -100, 100 },
	Increment = 0.5,
	Suffix = "%",
	CurrentValue = 10,
	Callback = function(v) print("slider:", v) end,
}, "sldr")

G2:CreateSlider({
	Name = "Speed",
	Range = { 0.2, 1 },
	Increment = 0.002,
	Suffix = "km/h",
	HideMax = true,
	CurrentValue = 0.2,
	Callback = function(v) print("speed:", v) end,
}, "sldr2")

G2:CreateInput({
	Name = "Text Input",
	PlaceholderText = "Type here",
	Callback = function(t) print("input:", t) end,
}, "inpt")

G2:CreateInput({
	Name = "Numeric Input",
	Numeric = true,
	MaxCharacters = 5,
	PlaceholderText = "Numbers only",
	Callback = function(t) print("num:", t) end,
}, "ninpt")

G2:CreateLabel({ Name = "Label Bind", Tooltip = "hold E" }, "lblbnd"):AddBind({
	CurrentValue = "E",
	HoldToInteract = true,
	Callback = function(v) print("hold bind:", v) end,
}, "bnd")

G2:CreateLabel({ Name = "Window Keybind" }, "wbind"):AddBind({
	CurrentValue = "K",
	WindowSetting = true,
}, "wbnd")

G:CreateDivider()

local DD = G:CreateLabel({ Name = "Single Dropdown" }, "lbld"):AddDropdown({
	Options = { "Alpha", "Beta", "Gamma" },
	CurrentOption = { "Alpha" },
	Placeholder = "Pick one",
	Callback = function(v) print("dd:", table.concat(v, ",")) end,
}, "dd")

local DDM = G:CreateLabel({ Name = "Multi Dropdown" }, "lbldm"):AddDropdown({
	Options = { "One", "Two", "Three" },
	MultipleOptions = true,
	Callback = function(v) print("ddm:", table.concat(v, ",")) end,
}, "ddm")

local DDP = G:CreateLabel({ Name = "Player Dropdown" }, "lbldp"):AddDropdown({
	Options = {},
	Special = 1,
	Placeholder = "Select a player",
	Callback = function(v) print("player:", v[1]) end,
}, "ddp")

G:CreateDropdown({
	Name = "Groupbox Dropdown",
	Options = { "1", "2", "3" },
	CurrentOption = { "1" },
	Callback = function(v) print("gdd:", v[1]) end,
}, "gdd")

local CP = G2:CreateLabel({ Name = "Color", Icon = NebulaIcons:GetIcon("color_lens", "Material") }, "lblc"):AddColorPicker({
	CurrentValue = Color3.fromRGB(255, 0, 0),
	Transparency = 0,
	Callback = function(c, t) print("color:", c, t) end,
}, "cp")

G2:CreateLabel({ Name = "Just a Label", Tooltip = "tooltip test" }, "lbli")

G2:CreateParagraph({
	Name = "Paragraph",
	Content = "Hello! Paragraphs auto-resize with content.\nSecond line here.",
}, "para")

local G3 = Tab2:CreateGroupbox({ Name = "Notify and Theme", Column = 1 }, "g3")

G3:CreateButton({
	Name = "Test Notification",
	Callback = function()
		Starlight:Notification({
			Title = "Hi",
			Content = "Auto-sized notification body.",
			Icon = NebulaIcons:GetIcon("notifications_active", "Material"),
		})
	end,
}, "nbtn")

G3:CreateButton({
	Name = "Infinite Notification",
	Callback = function()
		Starlight:Notification({ Title = "Pinned", Content = "Duration -1 never expires.", Duration = -1 })
	end,
}, "nbtn2")

G3:CreateButton({
	Name = "Set Nebula Theme",
	Callback = function() Starlight:SetTheme("Nebula") end,
}, "tbtn")

G3:CreateButton({
	Name = "Perf Stats",
	Callback = function()
		local s = Starlight.Perf.Stats()
		print("tweens:", s.ActiveTweenObjects, "infos:", s.CachedTweenInfos, "binds:", s.ThemeBindings)
	end,
}, "perfbtn")

Tab2:BuildConfigGroupbox(2)
Tab2:BuildThemeGroupbox(1)

Starlight:LoadAutoloadConfig()
Starlight:LoadAutoloadTheme()

Starlight:OnDestroy(function()
	print("Starlight destroyed, cleanup here")
end)
