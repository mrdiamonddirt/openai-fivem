RegisterCommand("AI", function(source, args, rawCommand)
    handleOpenAICommand(args)
    -- TriggerClientEvent('openai-fivem:ai', -1)
end)

function handleOpenAICommand(args)
    local prompt = table.concat(args, " ") -- join the arguments into a single prompt string
    local api_key = Config.OpenApiKey -- add your OPEN API KEY here
    -- print('API Key: ' .. api_key)
    print('Prompt: ' .. prompt)
    local url = 'https://api.openai.com/v1/chat/completions'
    local headers = {
        ['Content-Type'] = 'application/json',
        ['Authorization'] = 'Bearer ' .. api_key
    }
    local body = {
        model = "gpt-3.5-turbo",
        messages = {
            {
                role = "assistant",
                content = "You are an AI assistant for a fivem server to help players with gameplay."
            },
            {
                role = "user",
                content = "How do i make money on this server?"
            },
            {
                role = "assistant",
                content = "You can obtain a job at the Job Center or you can sell drugs to other players."
            },
            {
                role = "user",
                content = "What is the Discord for this server?"
            },
            {
                role = "assistant",
                content = "The Discord for this server is " .. Config.DiscordLink
            },
            {
                role = "user",
                content = "What is the Servers Website?"
            },
            {
                role = "assistant",
                content = "The Website for this server is " .. Config.WebsiteLink
            },
            {
                role = "user",
                content = prompt
            }
        },
        temperature = 0.5,
        top_p = 1,
        n = 1,
        stream = false,
        max_tokens = 200,
        presence_penalty = 0,
        frequency_penalty = 0,
        }
    PerformHttpRequest(url, function(err, text, headers)
        if err == 200 then
            local data = json.decode(text)
            -- print('Text: ' .. text)
            print('Response: ' .. data.choices[1].message.content)
            TriggerClientEvent('chat:addMessage', -1, {
                color = { 255, 0, 0},
                multiline = true,
                args = { 'AI Assistant', data.choices[1].message.content }
            })
        elseif err == 401 then
            print('Invalid Authentication Token')
            print('Ensure the OPENAPI KEY is correct in the config.lua file')
        elseif err == 429 then
            print('Rate Limit Exceeded')
            print("You haven't added a payment method to your OpenAI account.")
            print('Or You have either exceeded the rate limit for the OpenAI API')
            print('Or you have exceeded you maximum monthly spend.')
        elseif err == 500 then
            print('Internal Server Error')
        else
            print('Error: ' .. err)
        end
    end, 'POST', json.encode(body), headers)
end
