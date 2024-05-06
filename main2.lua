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
local GamesTab = Window:AddTab('Games', {default = false})
local SettingsTab = Window:AddTab('Settings', {default = false})


-- Define MainTab - Sections
local ClientSection = MainTab:AddSection('Client', {default = false})



-- ClientSection - Features
ClientSection:AddLabel('Platform: '..(UserInputService:GetPlatform().Name))





local function GetHumanoid()
	local Player = Players.LocalPlayer


	local Char = Player.Character or Player.CharacterAdded:Wait()


	if Char then
		local Hum = Char:FindFirstChildOfClass('Humanoid')


		if Hum then
			return Hum
		end
	end
end






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



	local Break_In_Lobby = GamesTab:AddSection('Break In - Lobby')
	local Roles2 = Break_In_Lobby:AddSubSection('Roles', {default = false})






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

			['The Fighter'] = {
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
	local Kids = Roles2:AddDropdown('Kids', {'The Stealthy', 'The Hungry', 'The Fighter'}, {default = 'The Stealthy'}, function(selected)
		RoleSelected = Roles['Kids'][selected]['Equip']
	end)

	
	local UsingSkin = Roles2:AddToggle('Using Skin', {flag = 'Toggle_Flag', default = false}, function(bool)
		IsUsingSkin = bool
	end)


	Roles2:AddButton('Equip', function()
		RoleSelected(IsUsingSkin)
	end)
else
	if game.PlaceId == 4620170611 then
		local Events = ReplicatedStorage:WaitForChild('RemoteEvents')
	
		local GiveTool = Events:WaitForChild('GiveTool')
		local BasementWeapon = Events:WaitForChild('BasementWeapon')
	



		local function DoEvent(Event, ...)
			if Event == 'Cat' then
				local args = {
					[1] = 244,
					[2] = true
				}


				Events:WaitForChild('DoDialogue'):FireServer(unpack(args))

				Events:WaitForChild('Cattery'):FireServer()
			else
				if Event == 'Pan' then
					local args = {
						[1] = 'Pan',
						[2] = 0
					}

					RemoteEvents:WaitForChild('BuyItem'):FireServer(unpack(args))
				else
					if Event == 'Drown' then
						local args = {
							[1] = 1,
							[2] = Players[({...})[1]]
						}

						Events:WaitForChild('ToxicDrown'):FireServer(unpack(args))
					end
				end
			end
		end
	
	
	
	
		local Break_In_Game = GamesTab:AddSection('Break In - In-Game')
		
	
		local Break_In_Game_ItemGiver = Break_In_Game:AddSubSection('Item Giver')
		local Break_In_Game_Events = Break_In_Game:AddSubSection('Events')
		local Break_In_Game_Basement = Break_In_Game:AddSubSection('Basement Events')
	
	
	
		Break_In_Game_ItemGiver:AddButton('Give Apple', function()
			local args = {
				[1] = 'Apple'
			}
	
			GiveTool:FireServer(unpack(args))
		end)
	
		Break_In_Game_ItemGiver:AddButton('Give Cookie', function()
			local args = {
				[1] = 'Cookie'
			}
	
			GiveTool:FireServer(unpack(args))
		end)
	
		Break_In_Game_ItemGiver:AddButton('Give BloxyCola', function()
			local args = {
				[1] = 'BloxyCola'
			}
	
			GiveTool:FireServer(unpack(args))
		end)
	
		Break_In_Game_ItemGiver:AddButton('Give Chips', function()
			local args = {
				[1] = 'Chips'
			}
	
			GiveTool:FireServer(unpack(args))
		end)
	
		Break_In_Game_ItemGiver:AddButton('Give Lollipop', function()
			local args = {
				[1] = 'Lollipop'
			}
	
			GiveTool:FireServer(unpack(args))
		end)

		Break_In_Game_ItemGiver:AddButton(' ')
	
		Break_In_Game_ItemGiver:AddButton('Give Pizza', function()
			local args = {
				[1] = 'Pizza3'
			}
	
			GiveTool:FireServer(unpack(args))
		end)

		Break_In_Game_ItemGiver:AddButton('Give Small Pizza', function()
			local args = {
				[1] = 'Pizza1'
			}
	
			GiveTool:FireServer(unpack(args))
		end)

		Break_In_Game_ItemGiver:AddButton('Give Normal Pizza', function()
			local args = {
				[1] = 'Pizza2'
			}
	
			GiveTool:FireServer(unpack(args))
		end)

		Break_In_Game_ItemGiver:AddButton('Give Big Pizza', function()
			local args = {
				[1] = 'Pizza3'
			}
	
			GiveTool:FireServer(unpack(args))
		end)

		Break_In_Game_ItemGiver:AddButton(' ')

		Break_In_Game_ItemGiver:AddButton('Give Expired BloxyCola', function()
			local args = {
				[1] = 'ExpiredBloxyCola'
			}


			GiveTool:FireServer(unpack(args))
		end)

		Break_In_Game_ItemGiver:AddButton('Give Poisonous Pizza', function()
			local args = {
				[1] = 'EpicPizza'
			}
			
			GiveTool:FireServer(unpack(args))			
		end)

		Break_In_Game_ItemGiver:AddButton(' ')

		Break_In_Game_ItemGiver:AddButton('Give Key', function()
			local args = {
				[1] = 'Key'
			}

			GiveTool:FireServer(unpack(args))
		end)

		Break_In_Game_ItemGiver:AddButton('Give CarKey', function()
			local args = {
				[1] = 'CarKey'
			}

			GiveTool:FireServer(unpack(args))
		end)

		Break_In_Game_ItemGiver:AddButton(' ')

		Break_In_Game_ItemGiver:AddButton('Give MedKit', function()
			local args = {
				[1] = 'MedKit'
			}

			GiveTool:FireServer(unpack(args))
		end)

		Break_In_Game_ItemGiver:AddButton('Give Cure', function()
			local args = {
				[1] = 'Cure'
			}

			GiveTool:FireServer(unpack(args))
		end)

		Break_In_Game_ItemGiver:AddButton(' ')

		Break_In_Game_ItemGiver:AddButton('Give Bat', function()
			local args = {
				[1] = 'Bat'
			}

			GiveTool:FireServer(unpack(args))
		end)

		Break_In_Game_ItemGiver:AddButton('Give Hammer', function()
			local args = {
				[1] = true,
				[2] = 'Hammer'
			}

			BasementWeapon:FireServer(unpack(args))
		end)

		Break_In_Game_ItemGiver:AddButton('Give Wrench', function()
			local args = {
				[1] = true,
				[2] = 'Spanner'
			}

			BasementWeapon:FireServer(unpack(args))
		end)

		Break_In_Game_ItemGiver:AddButton('Give Pitchfork', function()
			local args = {
				[1] = true,
				[2] = 'Pitchfork'
			}
			
			BasementWeapon:FireServer(unpack(args))			
		end)

		Break_In_Game_ItemGiver:AddButton('Give Broom', function()
			local args = {
				[1] = true,
				[2] = 'Broom'
			}
			
			BasementWeapon:FireServer(unpack(args))			
		end)

		Break_In_Game_ItemGiver:AddButton('Give Crowbar', function()
			local args = {
				[1] = true,
				[2] = 'Crowbar'
			}
			
			BasementWeapon:FireServer(unpack(args))			
		end)

		Break_In_Game_ItemGiver:AddButton('Give IceBreaker', function()
			local args = {
				[1] = true,
				[2] = 'Breaker'
			}
			
			BasementWeapon:FireServer(unpack(args))			
		end)

		Break_In_Game_ItemGiver:AddButton('Give LinkedSword', function()
			local args = {
				[1] = 'LinkedSword'
			}

			GiveTool:FireServer(unpack(args))
		end)

		Break_In_Game_ItemGiver:AddButton(' ')

		Break_In_Game_ItemGiver:AddButton('Give TeddyBear', function()
			local args = {
				[1] = 'TeddyBloxpin'
			}

			GiveTool:FireServer(unpack(args))
		end)

		Break_In_Game_ItemGiver:AddButton('Give Plank', function()
			local args = {
				[1] = 'Plank'
			}

			GiveTool:FireServer(unpack(args))
		end)


		

		Break_In_Game_Events:AddButton('Best Friend Cat', function()
			DoEvent('Cat')
		end)

		Break_In_Game_Events:AddButton('Buy Pie Pan', function()
			DoEvent('Pan')
		end)

		Break_In_Game_Events:AddButton('Activate Basement Lights', function()
			Events:WaitForChild('BasementMission'):FireServer()
		end)

		Break_In_Game_Events:AddButton('Skip Television', function()
			Events:WaitForChild('SkipTele'):FireServer()
		end)


		Break_In_Game_Events:AddButton('Unlock Basement Door', function()
			Events:WaitForChild('UnlockDoor'):FireServer()
		end)


		Break_In_Game_Events:AddButton('Unlock Basement (FULLY)', function()
			Events:WaitForChild('UnlockDoor'):FireServer()
			Events:WaitForChild('BasementMission'):FireServer()
		end)





		Break_In_Game_Basement:AddButton('PickUp Laddeer', function()
			local args = {
				[1] = 1
			}
			
			Events.Ladder:FireServer(unpack(args))			
		end)

		Break_In_Game_Basement:AddButton('Drop Ladder', function()
			local args = {
				[1] = 2
			}
			
			Events.Ladder:FireServer(unpack(args))
		end)

		Break_In_Game_Basement:AddButton(' ')

		Break_In_Game_Basement:AddButton('Open/Close Attic Door', function()
			local args = {
				[1] = "Attic"
			}
			
			Events.Door:FireServer(unpack(args))			
		end)

		


		local KillPlayer = Break_In_Game:AddSubSection('Kill Player')




		local Tabl = {}



		local PlayerSelected = nil







		for i, v in Players:GetPlayers() do
			Tabl[v.Name] = v.Name
		end




		local PlayersToKill = KillPlayer:AddDropdown('Players', Tabl, {default = 'nil'}, function(selected)
			if selected == 'nil' then
			else
				PlayerSelected = selected
			end
		end)



		PlayersToKill:Remove(Players.LocalPlayer.Name)


		Players.PlayerAdded:Connect(function(plr)
			Tabl[plr.Name] = plr.Name


			PlayersToKill:Add(Tabl[plr.Name])
		end)

		Players.PlayerRemoving:Connect(function(plr)
			PlayersToKill:Remove(plr.Name)
		end)



		KillPlayer:AddButton('Kill', function()
			DoEvent('Drown', PlayerSelected)
		end)


		KillPlayer:AddButton('Kill All', function()
			for i, v in Players:GetPlayers() do
				DoEvent('Drown', v.Name)
			end
		end)
	else
		if game.PlaceId == 13864661000 then
			--[[Break In 2 (Story)]]
			local RemoteEvents = ReplicatedStorage:WaitForChild('RemoteEvents')


			local function EquipRole(Role, RoleData)
				local MakeRole = RemoteEvents:WaitForChild('MakeRole')
				local OutsideRole = RemoteEvents:WaitForChild('OutsideRole')
		
		
		
				if Role and RoleData then
					if Role == 'The Hacker' or Role == 'The Nerd' then
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

					['The Hacker'] = {
						['Equip'] = function(usingSkin)
							local args = {
								[1] = 'Phone',
								[2] = false,
								[3] = usingSkin
							}
		
		
							EquipRole('The Hacker', args)
						end
					}
				},

				['Kids'] = {
					['The Hyper'] = {
						['Equip'] = function(usingSkin)
							local args = {
								[1] = 'Lollipop',
								[2] = false,
								[3] = usingSkin
							}
		
		
							EquipRole('M', args)
						end
					},

					['The Sporty'] = {
						['Equip'] = function(usingSkin)
							local args = {
								[1] = 'Bottle',
								[2] = false,
								[3] = usingSkin
							}
		
		
							EquipRole('M', args)
						end
					},

					['The Nerd'] = {
						['Equip'] = function(usingSkin)
							local args = {
								[1] = 'Book',
								[2] = false,
								[3] = usingSkin
							}
		
		
							EquipRole('The Nerd', args)
						end
					}
				}
			}






			local Break_In_Lobby = GamesTab:AddSection('Break In 2 - Lobby')
				local Roles2 = Break_In_Lobby:AddSubSection('Roles', {default = false})





				local Adults = Roles2:AddDropdown('Adults', {'The Protector', 'The Medic', 'The Hacker'}, {default = 'The Protector'}, function(selected)
					RoleSelected = Roles['Adults'][selected]['Equip']
				end)
				local Kids = Roles2:AddDropdown('Kids', {'The Hyper', 'The Sporty', 'The Nerd'}, {default = 'The Hyper'}, function(selected)
					RoleSelected = Roles['Kids'][selected]['Equip']
				end)
			
				
				local UsingSkin = Roles2:AddToggle('Using Skin', {flag = 'Toggle_Flag', default = false}, function(bool)
					IsUsingSkin = bool
				end)
			


				local RoleSelected = function(...) print('Please Select a Role') end
				local IsUsingSkin = false


			
				Roles2:AddButton('Equip', function()
					RoleSelected(IsUsingSkin)
				end)


				print('OK')


			print('Continue')
		end
	end
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
