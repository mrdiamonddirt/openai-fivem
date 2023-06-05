RegisterCommand("AI", function(source, args, rawCommand)
    print('AI Command Registered')
    handleOpenAICommand(args)
    TriggerClientEvent('openai-fivem:ai', -1)
end)

function handleOpenAICommand(args)
    local prompt = table.concat(args, " ") -- join the arguments into a single prompt string
    local api_key = Config.OPENAI_API_KEY
    -- print('API Key: ' .. api_key)
    print('Prompt: ' .. prompt)
    local url = 'https://api.openai.com/v1/completions'
    local headers = {
        ['Content-Type'] = 'application/json',
        ['Authorization'] = 'Bearer ' .. api_key
    }
    local body = {
        model = "text-davinci-003",
        prompt = Config.defaultPrompt .. prompt,
        temperature = 0.5,
        max_tokens = 50
        }
    PerformHttpRequest(url, function(err, text, headers)
        if err == 200 then
            local data = json.decode(text)
            print('Text: ' .. text)
            print('Response: ' .. data.choices[1].text)
            TriggerClientEvent('chat:addMessage', -1, {
                color = { 255, 0, 0},
                multiline = true,
                args = { 'AI', data.choices[1].text }
            })
        else
            print('Error: ' .. err)
        end
    end, 'POST', json.encode(body), headers)
end
