ESX = exports["es_extended"]:getSharedObject()

RMenu.Add('ydshop', 'main', RageUI.CreateMenu("Magasin", "Menu du magasin"))
RMenu.Add('ydshop', 'boisson', RageUI.CreateSubMenu(RMenu:Get('ydshop', 'main'), "Boisson", "Menu des boissons"))
RMenu.Add('ydshop', 'nourriture', RageUI.CreateSubMenu(RMenu:Get('ydshop', 'main'), "Nourriture", "Menu des nourritures"))


Citizen.CreateThread(function()
    while true do 
            RageUI.IsVisible(RMenu:Get('ydshop', 'main'), true, true, true, function()
                RageUI.Button("Boisson", "Menu des boissons", {RightLabel = "→→→"},true, function()
                end, RMenu:Get('ydshop', 'boisson'))
                RageUI.Button("Nourriture", "Menu des nourritures", {RightLabel = "→→→"},true, function()
                end, RMenu:Get('ydshop', 'nourriture'))
            end, function()
            end)
    
    
            RageUI.IsVisible(RMenu:Get('ydshop', 'boisson'), true, true, true, function()
                RageUI.Button("Eau", "Une bouteille d'eau", {RightLabel = "~g~1$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('ydshop:buywater')
                    end
                end)

            end,function()
            end)

            RageUI.IsVisible(RMenu:Get('ydshop', 'nourriture'), true, true, true, function()
                RageUI.Button("Pain", "Un pain", {RightLabel = "~g~1$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('ydshop:buybread')
                    end
                end)

            end,function()
            end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    Citizen.Wait(0)
        end
    end)



    local positions = {
        { x = 25.767035, y = -1345.556030, z = 29.482056 }, -- Exemple de position
        { x = -707.4064, y = -914.5716, z = 19.2156},
        { x = -1222.8323, y = -907.1450, z = 12.3263}
        
        -- Ajoutez d'autres positions ici
    }
    
    local blips = {}
    
    function CreateBlips()
        for _, position in ipairs(positions) do
            local blip = AddBlipForCoord(position.x, position.y, position.z)
            SetBlipSprite(blip, 52) -- Icône de panier
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 0.8)
            SetBlipColour(blip, 2) -- Couleur verte
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Panier")
            EndTextCommandSetBlipName(blip)
            table.insert(blips, blip)
        end
    end
    
    function OpenShopMenu()
        RageUI.Visible(RMenu:Get('ydshop', 'main'), not RageUI.Visible(RMenu:Get('ydshop', 'main')))
    end
    
    CreateBlips()
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            
            for _, position in ipairs(positions) do
                local distance = GetDistanceBetweenCoords(playerCoords, position.x, position.y, position.z, true)
                
                if distance < 2.0 then

                    ESX.ShowHelpNotification('Appuyez sur  ~INPUT_CONTEXT~ pour accéder au ~g~magasin')
                    
                    if IsControlJustPressed(0, 38) then -- Touche E
                        OpenShopMenu()
                    end
                end
            end
        end
    end)
    
    