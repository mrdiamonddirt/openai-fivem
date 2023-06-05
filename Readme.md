# OpenAI FiveM Chat Resource

This is a FiveM chat resource that allows users to query OpenAI's GPT-3 API from within the game. Users can send a command with an argument to the chat, and the script will query the OpenAI API and output the response back to the chat.

![Screenshot](https://img001.prntscr.com/file/img001/JkJ6r48MRPKSZSCFUjd94g.png)

## Requirements

To use this resource, you'll need the following:

- A FiveM server
- A valid OpenAI API key
- A Lua runtime environment (included in FiveM)

## Installation

To install this resource, follow these steps:

1. Clone this repository to your FiveM server's "resources" folder.

2. Edit the `config.lua` file and update the `openai_api_key` variable with your OpenAI API key.

3. (Optional) Edit the other variables in the `config.lua` file to adjust the rate limits, cooldowns, and other settings.

4. Add `start openai-fivem` to your server.cfg file.

5. Start or restart your FiveM server.

## Usage

To use this resource, follow these steps:

1. In-game, type `/ai` followed by your question or prompt.

2. The script will send your query to the OpenAI API and output the response back to the chat.

## Configuration

The `config.lua` file contains the following variables that you can adjust:

- `openai_api_key`: Your OpenAI API key.
- `default_prompt`: The default prompt to use if no prompt is specified.
- `max_tokens`: The maximum number of tokens to generate in the response.
- `temperature`: The "creativity" of the response.
- `top_p`: The "unlikelihood" of the response.
- `frequency`: The rate at which users can send queries (in milliseconds).
- `cooldown`: The amount of time users must wait between queries (in seconds).
- `verbose`: Whether to output detailed information to the console.

## Contributing

If you'd like to contribute to this project, feel free to open a pull request or submit an issue.

## License

This project is licensed under the MIT License. See the LICENSE file for more information.
