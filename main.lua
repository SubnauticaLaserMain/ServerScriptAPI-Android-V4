-- Define Service(s)
local MarketPlaceService = game:GetService('MarketplaceService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local UserInputService = game:GetService('UserInputService')
local CorePackages = game:GetService('CorePackages')
local HttpService = game:GetService('HttpService')
local RunService = game:GetService('RunService')
local Players = game:GetService('Players')
local CoreGui = game:GetService('CoreGui')


-- Define Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua"))()


-- Create Window
local Window = Library:AddWindow({
	title = {'ServerScriptAPI V4', 'UI Library'},
	theme = {
		Accent = Color3.fromRGB(34, 255, 0)
	},
	key = Enum.KeyCode.RightControl,
	default = true
})


-- Define Tabs
local MainTab = Window:AddTab('Main', {default = false})
local GameTab = Window:AddTab('Game', {default = false})
local SettingsTab = Window:AddTab('Settings', {default = false})


-- Define MainTab - Sections
local ClientSection = MainTab:AddSection('Client', {default = false})



-- ClientSection - Features
ClientSection:AddLabel('Platform: '..(UserInputService:GetPlatform().Name))





-- Define GameTab - Sections
local GameInfo = GameTab:AddSection('Game-Info', {default = false})


-- GameInfo - Features
GameInfo:AddLabel('PlaceID: '..tostring(game.PlaceId))
GameInfo:AddLabel('GameID: '..tostring(game.GameId))
GameInfo:AddLabel('JobID: '..tostring(game.JobId))
GameInfo:AddLabel('PlaceVersion: '..tostring(game.PlaceVersion))




-- Define SettingsTab - Sections
local CustomizeSection = SettingsTab:AddSection('Customize Library', {default = false})


-- CustomizeSection - Features
local ColorPickerForWindow = CustomizeSection:AddPicker('Window Color', {color = Color3.fromRGB(34, 255, 0)}, function(color)
    Window:SetAccent(color)
end)

local SetKeyForWindow = CustomizeSection:AddBind('Window Key', Enum.KeyCode.RightControl, {toggleable = true, default = false, flag = 'Bind_Flag'}, function(keycode)
    Window:SetKey(keycode)
end)
