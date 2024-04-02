ESX = exports["es_extended"]:getSharedObject()

-- Here you can add youre webhook!
local DiscordWebhook2 = "https://discord.com/api/webhooks/1203754166040662037/8skpSVsEH0bahWqC9nViGN-qymraCYt31O4B-Jh7IjxQctp7eE0ANew_yP_X9iTOe7hi"

function logPawnshopTransaction(playerId, item, quantity, price, currency)
    local xPlayer = ESX.GetPlayerFromId(playerId)

    -- DONT EDIT UNLESS YOU KNOW WHAT YOU ARE DOING WITH THE CODE !!!!!
    local embed = {
        {
            ["title"] = "Pawnshop Transaction",
            ["color"] = 65280,
            ["fields"] = {
                {["name"] = "Player", ["value"] = GetPlayerName(playerId), ["inline"] = true},
                {["name"] = "Item", ["value"] = item, ["inline"] = true},
                {["name"] = "Quantity", ["value"] = quantity, ["inline"] = true},
                {["name"] = "Price", ["value"] = price, ["inline"] = true},
                {["name"] = "Currency", ["value"] = currency, ["inline"] = true},
            },
            ["footer"] = {
                ["text"] = "Transaction logged at " .. os.date("%Y-%m-%d %H:%M:%S"),
                ["text"] = "HW Scripts | Logs",
            },
        },
    }

    local jsonData = json.encode({embeds = embed})

    -- DONT EDIT UNLESS YOU KNOW WHAT YOU ARE DOING WITH THE CODE !!!!!
    PerformHttpRequest(
        DiscordWebhook2,
        function(statusCode, headers)
            if statusCode == 0 then
                print("^7[^1Webhook error^7] ^4No active webhook found!")
                print("^7[^1Webhook error^7] ^4Script will not work propperly!")
                print("^7[^1Webhook error^7] ^4Please create/place a webhook in ^3config.lua!")
            else
                print("^1[^2INFO^1] ^5A player ^3sold ^5item(s) to the pawnshop!")
                print("^1[^2INFO^1] ^5Succesfully logged action to discord! ^2Status Code: ^3" .. statusCode)
            end
        end,
        "POST",
        jsonData,
        {["Content-Type"] = "application/json"}
    )
end

-- DONT EDIT UNLESS YOU KNOW WHAT YOU ARE DOING WITH THE CODE !!!!!
lib.callback.register('hw_pawnshop:sellItem', function(source, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem = xPlayer.getInventoryItem(data.item)
    if xItem.count < data.quantity then
        return false
    else
        local profit = math.floor(data.price * data.quantity)
        xPlayer.removeInventoryItem(data.item, data.quantity)
        xPlayer.addAccountMoney(data.currency, profit)

        -- Log the transaction to Discord
        logPawnshopTransaction(source, data.item, data.quantity, data.price, data.currency)

        return profit
    end
end)
