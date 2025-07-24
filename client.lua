-- 🔒 Script protégé & signé par Ducratif pour le serveur GuerreRP
-- 🌐 Boutique officielle : https://ducratif.tebex.io
-- 💻 GitHub : https://github.com/Ducratif
-- 🎮 Discord serveur RP : https://discord.gg/BBcaqTcQuH
-- 🛒 Discord boutique : https://discord.gg/kpD8pQBBWm

local closestPlayer, closestDistance

RegisterCommand('facture', function()
    local input = lib.inputDialog('Créer une facture', {
        {type = 'number', label = 'Montant', icon = 'dollar-sign', required = true, min = 1}
    })

    if not input then return end

    local amount = input[1]

    local coords = GetEntityCoords(PlayerPedId())
    closestPlayer, closestDistance = lib.getClosestPlayer(coords, 3.0)

    if not closestPlayer then
        lib.notify({description = "Aucun joueur à proximité", type = 'error'})
        return
    end

    TriggerServerEvent('facture:sendInvoice', GetPlayerServerId(closestPlayer), amount)
end, false)

RegisterKeyMapping('facture', 'Ouvrir le menu de facture', 'keyboard', ',')

RegisterNetEvent('facture:receiveInvoice', function(amount, sourceId)
    local accept = lib.alertDialog({
        header = 'Nouvelle facture',
        content = 'Vous avez reçu une facture de $'..amount..'. Voulez-vous l\'accepter ?',
        centered = true,
        cancel = true,
        labels = {
            confirm = 'Oui',
            cancel = 'Non'
        }
    })

    if accept == 'confirm' then
        local payMethod = lib.inputDialog('Choisir un moyen de paiement', {
            {type = 'select', label = 'Paiement', options = {
                {value = 'money', label = 'Espèces'},
                {value = 'bank', label = 'Banque'}
            }, required = true}
        })

        if payMethod then
            TriggerServerEvent('facture:acceptInvoice', sourceId, amount, payMethod[1])
        end
    else
        TriggerServerEvent('facture:refuseInvoice', sourceId)
    end
end)
