function start()
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FSOCIETY-WYLD/testttt/main/aa.lua"))()
    local Flags = Library.Flags

    local Window =
        Library:Window(
        {
            Text = "FREAKBURG V0.1 [GAMELEAN.GAMES]"
        }
    )

    local Tab =
        Window:Tab(
        {
            Text = "FREAKBURG (GAMELEAN.GAMES)"
        }
    )

    local fastfood =
        Tab:Section(
        {
            Text = "Fast Food Autofarm"
        }
    )

    local webhooktextt = ""
    local usewebhook = false
    local timegrind = 20 

    fastfood:Input(
        {
            Text = "Discord Webhook",
            Default = "http...",
            Callback = function(enteredValue)
                webhooktextt = enteredValue
                print("Webhook-URL gesetzt:", webhooktextt)
            end
        }
    )
    local function SendMessageEMBED(url, embed)
        local http = game:GetService("HttpService")
        local headers = {
            ["Content-Type"] = "application/json"
        }
        local data = {
            ["embeds"] = {
                {
                    ["title"] = embed.title,
                    ["description"] = embed.description,
                    ["color"] = embed.color
                }
            }
        }
        local body = http:JSONEncode(data)

        local requestFunction = request or syn.request or http_request
        if not requestFunction then
            warn("Dein Exploit unterstützt keine HTTP-Anfragen!")
            return
        end

        local success, response = pcall(function()
            return requestFunction({
                Url = url,
                Method = "POST",
                Headers = headers,
                Body = body
            })
        end)

        if success then
            print("Webhook erfolgreich gesendet!")
        else
            warn("Fehler beim Senden des Webhooks:", response)
        end
    end
    fastfood:Check({
        Text = "Use Webhook",
        Callback = function(Value)
            usewebhook = Value
            print("Webhook aktiviert:", usewebhook)
            if usewebhook then
                spawn(function() 
                    while usewebhook do
                        local success, err = pcall(function()
                            if webhooktextt == "" or not webhooktextt:find("https://") then
                                warn("Ungültige Webhook-URL!")
                                return
                            end

                            local TimeText =
                                game.Players.LocalPlayer.PlayerGui.MainGUI.Bar.CharMenu.WorkFrame.WorkFrame.WorkInfoFrame
                                    .TimeLabel.TextLabel
                            local EarningText =
                                game.Players.LocalPlayer.PlayerGui.MainGUI.Bar.CharMenu.WorkFrame.WorkFrame.WorkInfoFrame
                                    .EarningsLabel.TextLabel

                            if not TimeText or not TimeText.Text or not EarningText or not EarningText.Text then
                                warn("GUI-Elemente nicht gefunden oder Texte fehlen!")
                                return
                            end

                            local embed = {
                                ["title"] = "BLOXBURGER",
                                ["description"] = "Timetext: " .. TimeText.Text .. "\nEarning: " .. EarningText.Text,
                                ["color"] = 16711680
                            }

                            SendMessageEMBED(webhooktextt, embed)
                        end)

                        if not success then
                            warn("Fehler in der Webhook-Schleife:", err)
                        end

                        wait(20) 
                    end
                end)
            end
        end
    })

    fastfood:Slider({
        Text = "Time",
        Minimum = 1,
        Default = 20,
        Maximum = 20,
        Incrementation = 1,
        Postfix = "h",
        Callback = function(value)
            timegrind = value
            print("Timegrind gesetzt auf:", timegrind)
        end
    })

    -- Button für Autofarm
    fastfood:Button({
        Text = "BloxBurger Autofarm",
        Callback = function()
            _G.time = timegrind 

            local success, err = pcall(function()
                loadstring(
                    game:HttpGet(
                        "https://raw.githubusercontent.com/FSOCIETY-WYLD/Freakburg/refs/heads/main/farm.lua",
                        true
                    )
                )()
            end)

            if not success then
                warn("Failed to load autofarm script: " .. tostring(err))
            end
        end
    })


    Tab:Select()
end




print("Test")
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui

local Frame = Instance.new("Frame")
Frame.BackgroundColor3 = Color3.fromRGB(243, 73, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.371357977, 0, 0.403508782, 0)
Frame.Size = UDim2.new(0.256405354, 0, 0.19298245, 0)
Frame.Parent = gui

local Frame_2 = Instance.new("Frame")
Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.0157618225, 0, 0.0440438017, 0)
Frame_2.Size = UDim2.new(0.963854551, 0, 0.912326157, 0)


local TextBox = Instance.new("TextBox")
TextBox.Parent = Frame_2
TextBox.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.0552517176, 0, 0.235214263, 0)
TextBox.Size = UDim2.new(0.889027059, 0, 0.259728521, 0)
TextBox.Font = Enum.Font.SourceSansBold
TextBox.Text = "Free Pin here: https://gamelean.games"
TextBox.TextColor3 = Color3.fromRGB(255, 0, 242)
TextBox.TextSize = 17.000



local TextButton = Instance.new("TextButton")
TextButton.Parent = Frame_2
TextButton.BackgroundColor3 = Color3.fromRGB(0, 34, 255)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.0552516654, 0, 0.579573631, 0)
TextButton.Size = UDim2.new(0.405177891, 0, 0.189799786, 0)
TextButton.Font = Enum.Font.SourceSansBold
TextButton.Text = "Get Key"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 21.000
TextButton.TextStrokeTransparency = 0.000

local TextButton_2 = Instance.new("TextButton")
TextButton_2.Parent = Frame_2
TextButton_2.BackgroundColor3 = Color3.fromRGB(0, 255, 30)
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(0.537167728, 0, 0.579573631, 0)
TextButton_2.Size = UDim2.new(0.407110631, 0, 0.189799786, 0)
TextButton_2.Font = Enum.Font.SourceSansBold
TextButton_2.Text = "Check"
TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.TextSize = 21.000
TextButton_2.TextStrokeTransparency = 0.000

local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0862222016, 0, 0.0766749978, 0)
TextLabel.Size = UDim2.new(0.481916577, 0, 0.113513902, 0)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Enter Pin:"
TextLabel.TextColor3 = Color3.fromRGB(247, 3, 255)
TextLabel.TextSize = 21.000
TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

local TextLabel_2 = Instance.new("TextLabel")
TextLabel_2.Parent = Frame_2
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.0552518182, 0, 0.821062744, 0)
TextLabel_2.Size = UDim2.new(0.889026999, 0, 0.125815272, 0)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "Keys are for free on https://gamelean.games"
TextLabel_2.TextColor3 = Color3.fromRGB(192, 3, 255)
TextLabel_2.TextSize = 18.000
TextLabel_2.TextWrapped = true



local function checkKey()
    local HttpService = game:GetService("HttpService")

    local function handleError(err)
        print("An error occurred: " .. tostring(err))
        local INPUT_KEY = tonumber(TextBox.Text)
        _G.keyinput = INPUT_KEY
        gui:Destroy()
        start()  
    end
    
    local function main()
        local INPUT_KEY = tonumber(TextBox.Text)
        
        local loadSuccess, jsonCode = pcall(function()
            return game:HttpGet("http://gamelean.games/freakburgdecrypted.json")
        end)
    
        if loadSuccess then
            local parseSuccess, KEY_LIST = pcall(function()
                return HttpService:JSONDecode(jsonCode)
            end)
    
            if parseSuccess then
                if KEY_LIST and type(KEY_LIST) == "table" and KEY_LIST["keys"] then
                    local keyFoundddd = false
                    for _, key in ipairs(KEY_LIST["keys"]) do
                        if key == INPUT_KEY then
                            keyFoundddd = true
                            local INPUT_KEY = tonumber(TextBox.Text)
                            _G.keyinput = INPUT_KEY
                            break
                        end
                    end
    
                    if keyFoundddd then
                        print("Authentication successful")
                        gui:Destroy()
                        start()
                    else
                        print("Invalid key entered:", INPUT_KEY)
                    end
                else
                    print("Invalid JSON format or no 'keys' array found.")
                end
            else
                error("Failed to parse JSON data: " .. tostring(KEY_LIST))
            end
        else
            error("Failed to load JSON data: " .. tostring(jsonCode))
        end
    end
    
    local success, err = pcall(main)
    if not success then
        handleError(err)
    end
    
end


TextButton.MouseButton1Click:Connect(function()
    print("gamelean.games")
end)

TextButton_2.MouseButton1Click:Connect(function()
    checkKey()
end)




