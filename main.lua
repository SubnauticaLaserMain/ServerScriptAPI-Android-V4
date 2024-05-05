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
local GamesTab = Window:AddTab('Games', {default = false})


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





-- Define GamesTab - Section
if game.PlaceId == 3851622790 then
	local RemoteEvents = ReplicatedStorage:WaitForChild('RemoteEvents')






	local function EquipRole(Role, RoleData)
		local MakeRole = RemoteEvents:WaitForChild('MakeRole')
		local OutsideRole = RemoteEvents:WaitForChild('OutsideRole')



		if Role and RoleData then
			if Role == 'The Swat' or Role == 'The Officer' then
				local OutsideRole_Data = {
					[1] = RoleData[1],
					[2] = RoleData[3]
				}

				OutsideRole:FireServer(OutsideRole_Data)
				MakeRole:FireServer(RoleData)
			else
				MakeRole:FireServer(RoleData)
			end
		end	
	end



	local Break_In_2_Lobby = GamesTab:AddSection('Break In 2 - Lobby')






	-- Break In 2 - Lobby | Features
	local RoleSelected = function(...) print('Please Select a Role') end




	local Roles = {
		['Adults'] = {
			['The Protector'] = {	
				['Equip'] = function(usingSkin)
					if usingSkin then
						local args = {
							[1] = 'Bat',
							[2] = false,
							[3] = usingSkin
						}


						EquipRole('M', args)
					end
				end
			},

			['The Medic'] = {
				['Equip'] = function(usingSkin)
					if usingSkin then
						local args = {
							[1] = 'MedKit',
							[2] = false,
							[3] = usingSkin
						}


						EquipRole('M', args)
					end
				end
			},

			['The Officer'] = {
				['Equip'] = function(usingSkin)
					if usingSkin then
						local args = {
							[1] = 'Gun',
							[2] = false,
							[3] = usingSkin
						}


						EquipRole('The Officer', args)
					end
				end
			},

			['The Swat'] = {
				['Equip'] = function(usingSkin)
					if usingSkin then
						local args = {
							[1] = 'SwatGun',
							[2] = false,
							[3] = usingSkin
						}


						EquipRole('The Swat', args)
					end
				end
			}
		}
	}
end






-- Define SettingsTab - Sections
local CustomizeSection = SettingsTab:AddSection('Customize Library', {default = false})


-- CustomizeSection - Features
local ColorPickerForWindow = CustomizeSection:AddPicker('Window Color', {color = Color3.fromRGB(34, 255, 0)}, function(color)
    Window:SetAccent(color)
end)

local SetKeyForWindow = CustomizeSection:AddBind('Window Key', Enum.KeyCode.RightControl, {toggleable = true, default = false, flag = 'Bind_Flag'}, function(keycode)
    Window:SetKey(keycode)
end)






-- loadstring(game:HttpGet('https://raw.githubusercontent.com/SubnauticaLaserMain/ServerScriptAPI-Android-V4/main/main.lua', true))()
