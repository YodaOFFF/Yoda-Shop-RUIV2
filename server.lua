ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('ydshop:buywater')
AddEventHandler('ydshop:buywater', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local price = 100
    local xMoney = xPlayer.getMoney()
    if xMoney >= price then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('water', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Vous avez acheté une bouteille d'eau")
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
    end
end)

RegisterNetEvent('ydshop:buybread')
AddEventHandler('ydshop:buybread', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local price = 100
    local xMoney = xPlayer.getMoney()
    if xMoney >= price then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('bread', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Vous avez acheté un pain")
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
    end
end)