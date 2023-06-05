fx_version 'cerulean'
game 'gta5'

name 'OpenAI Chat Resource'
description 'A FiveM chat resource that queries OpenAI for chat responses'
author 'Your Name Here'

version '1.0.0'

lua54 'yes'

shared_script {
    'config.lua'
}

server_script {
    'server/server.lua'
}

dependencies {'chat'}
