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
			if Role == 'The Swat' or Role == 'The Officer' or Role == 'The Fighter' then
				local OutsideRole_Data = {
					[1] = RoleData[1],
					[2] = RoleData[3]
				}

				OutsideRole:FireServer(unpack(OutsideRole_Data))
				MakeRole:FireServer(unpack(RoleData))
			else
				MakeRole:FireServer(unpack(RoleData))
			end
		end	
	end



	local Break_In_2_Lobby = GamesTab:AddSection('Break In 2 - Lobby')
	local Roles2 = Break_In_2_Lobby:AddSubSection('Roles', {default = false})






	-- Break In 2 - Lobby | Features
	local RoleSelected = function(...) print('Please Select a Role') end
	local IsUsingSkin = false




	local Roles = {
		['Adults'] = {
			['The Protector'] = {	
				['Equip'] = function(usingSkin)
					local args = {
						[1] = 'Bat',
						[2] = false,
						[3] = usingSkin
					}


					EquipRole('M', args)
				end
			},

			['The Medic'] = {
				['Equip'] = function(usingSkin)
					local args = {
						[1] = 'MedKit',
						[2] = false,
						[3] = usingSkin
					}


					EquipRole('M', args)
				end
			},

			['The Officer'] = {
				['Equip'] = function(usingSkin)
					local args = {
						[1] = 'Gun',
						[2] = false,
						[3] = usingSkin
					}


					EquipRole('The Officer', args)
				end
			},

			['The Swat'] = {
				['Equip'] = function(usingSkin)
					local args = {
						[1] = 'SwatGun',
						[2] = false,
						[3] = usingSkin
					}


					EquipRole('The Swat', args)
				end
			}
		},

		['Kids'] = {
			['The Stealthy'] = {
				['Equip'] = function(usingSkin)
					local args = {
						[1] = 'TeddyBloxpin',
						[2] = true,
						[3] = usingSkin
					}

					EquipRole('M', args)
				end
			},

			['The Hungry'] = {
				['Equip'] = function(usingSkin)
					local args = {
						[1] = 'Chips',
						[2] = true,
						[3] = usingSkin
					}

					EquipRole('M', args)
				end
			},

			['The Figther'] = {
				['Equip'] = function(usingSkin)
					local args = {
						[1] = 'Sword',
						[2] = true,
						[3] = usingSkin
					}

					EquipRole('The Fighter', args)
				end
			},
		}
	}



	local Adults = Roles2:AddDropdown('Adults', {'The Protector', 'The Medic', 'The Officer', 'The Swat'}, {default = 'The Protector'}, function(selected)
		RoleSelected = Roles['Adults'][selected]['Equip']
	end)

	
	local UsingSkin = Roles2:AddToggle('Using Skin', {flag = 'Toggle_Flag', default = false}, function(bool)
		IsUsingSkin = bool
	end)


	Roles2:AddButton('Equip', function()
		RoleSelected(IsUsingSkin)
	end)
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
