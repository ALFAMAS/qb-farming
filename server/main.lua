
local QBCore = exports['qb-core']:GetCoreObject()

local playersProcessingCannabis = {}

RegisterServerEvent('qb-farming:server:UnRentTractor')
AddEventHandler('qb-farming:server:UnRentTractor', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	TriggerClientEvent('qb-farming:UnRentTractor', src)
	Player.Functions.AddMoney('cash', Config.TractorRent)
end)

RegisterServerEvent('qb-farming:pickedUpCannabis')
AddEventHandler('qb-farming:pickedUpCannabis', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	  if TriggerClientEvent("QBCore:Notify", src, "Picked up some Corn Kernels!!", "Success", 3000) then
		  Player.Functions.AddItem('corn_kernel', Config.CornOutput) ---- change this shit 
		  TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['corn_kernel'], "add")
	  end
end)

RegisterServerEvent('qb-farming:server:SpawnTractor')
AddEventHandler('qb-farming:server:SpawnTractor', function()
		local src = source
    	local Player = QBCore.Functions.GetPlayer(src)
		local cashamount = Player.PlayerData.money["cash"]

		if cashamount >= Config.TractorRent then
			Player.Functions.RemoveMoney('cash', Config.TractorRent) 
			TriggerClientEvent('qb-farming:SpawnTractor', src)
		else
			TriggerClientEvent('QBCore:Notify', src, 'You need $'..Config.TractorRent..' Cash to Rent a Tractor', "success")   
		end
end)

RegisterServerEvent("qb-farming:server:SellFarmingItems")
AddEventHandler("qb-farming:server:SellFarmingItems", function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Config.ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price + (Config.ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                end
            end
        end
        Player.Functions.AddMoney("cash", price, "sold-farm-items")
        TriggerClientEvent('QBCore:Notify', src, "You have sold your items for"..price)
    end
end)

RegisterServerEvent('qb-farming:CowMilked')
AddEventHandler('qb-farming:CowMilked', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	  if TriggerClientEvent("QBCore:Notify", src, "You got some Milk!", "Success", 4000) then
		  Player.Functions.AddItem('milk', Config.MilkOutput) ---- change this shit 
		  TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['milk'], "add")
	  end
end)

RegisterServerEvent('qb-farming:ProcessCorn')
AddEventHandler('qb-farming:ProcessCorn', function()
	print('corn')
		local src = source
    	local Player = QBCore.Functions.GetPlayer(src)

		local item = Player.Functions.GetItemByName('corn_kernel')
		if item ~= nil then 
			if item.amount > 4 then 
				Player.Functions.RemoveItem('corn_kernel', 4)----change this
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['corn_kernel'], "remove")
				Player.Functions.AddItem('corn_packet', 1)----change this
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['corn_packet'], "add")
				TriggerClientEvent('QBCore:Notify', src, 'You made a Corn Packet!', "success")   
			else 
				TriggerClientEvent('QBCore:Notify', src, 'You need atleast 4 Corn Kernels!', "success")   
			end     
		else    
			TriggerClientEvent('QBCore:Notify', src, 'You need atleast 4 Corn Kernels!', "success")   
	end                                                                				
end)

RegisterServerEvent('qb-farming:ProcessOranges')
AddEventHandler('qb-farming:ProcessOranges', function()
	print('orange')
		local src = source
    	local Player = QBCore.Functions.GetPlayer(src)

		local item = Player.Functions.GetItemByName('orange')
		if item ~= nil then 
			if item.amount > 10 then 
				Player.Functions.RemoveItem('orange', math.random(5,10))----change this
				Player.Functions.AddItem('fruit_pack', 1)----change this
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['orange'], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['fruit_pack'], "add")
				TriggerClientEvent('QBCore:Notify', src, 'You made a Fruit Pack!', "success")   
			else 
				TriggerClientEvent('QBCore:Notify', src, 'You need atleast 10 Oranges!', "success")   
			end     
		else    
			TriggerClientEvent('QBCore:Notify', src, 'You need atleast 10 Oranges!', "success")   
		end                                                                				
end)

RegisterServerEvent('qb-farming:ProcessMilk')
AddEventHandler('qb-farming:ProcessMilk', function()
	print('milk')
		local src = source
    	local Player = QBCore.Functions.GetPlayer(src)

		local item = Player.Functions.GetItemByName('milk')
		if item ~= nil then 
			if item.amount > 5 then 
				Player.Functions.RemoveItem('milk', math.random(2,5))----change this
				Player.Functions.AddItem('milk_pack', 1)----change this
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['milk'], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['milk_pack'], "add")
				TriggerClientEvent('QBCore:Notify', src, 'You made a Milk Carton!', "success")   
			else 
				TriggerClientEvent('QBCore:Notify', src, 'You need atleast 5 Milk!!', "success")   
			end     
		else    
			TriggerClientEvent('QBCore:Notify', src, 'You need atleast 5 Milk!', "success")   
		end                                                                				
end)

RegisterServerEvent('qb-farming:GiveOranges')
AddEventHandler('qb-farming:GiveOranges', function()
		local src = source
    	local Player = QBCore.Functions.GetPlayer(src)
		Player.Functions.AddItem('orange', math.random(4, 7))----change this
		TriggerClientEvent('QBCore:Notify', src, 'You got a few oranges from the Tree!', "success")                                                                         				
end)

RegisterServerEvent('qb-farming:cancelProcessing')
AddEventHandler('qb-farming:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('qb-farming:playerDropped', function(playerId, reason)
	CancelProcessing(playerId)
end)

RegisterServerEvent('qb-farming:onPlayerDeath')
AddEventHandler('qb-farming:onPlayerDeath', function(data)
	local src = source
	CancelProcessing(src)
end)

QBCore.Functions.CreateCallback('qb-farming:server:GetSellingPrice', function(source, cb)
    local retval = 0
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Config.ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    retval = retval + (Config.ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                end
            end
        end
    end
    cb(retval)
end)

------------------------------------------------------------------------------------------------------------------------------

function CancelProcessing(playerId)
	if playersProcessingCannabis[playerId] then
		ClearTimeout(playersProcessingCannabis[playerId])
		playersProcessingCannabis[playerId] = nil
	end
end