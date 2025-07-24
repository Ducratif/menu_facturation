-- 🔒 Script protégé & signé par Ducratif pour le serveur GuerreRP
-- 🌐 Boutique officielle : https://ducratif.tebex.io
-- 💻 GitHub : https://github.com/Ducratif
-- 🎮 Discord serveur RP : https://discord.gg/BBcaqTcQuH
-- 🛒 Discord boutique : https://discord.gg/kpD8pQBBWm

fx_version 'cerulean'
game 'gta5'

description 'Système de facturation global avec ox_lib'
author 'ChatGPT'
version '1.0.0'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua' -- https://github.com/Ducratif/ox_lib
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

dependencies {
    'ox_lib'    -- https://github.com/Ducratif/ox_lib
}
