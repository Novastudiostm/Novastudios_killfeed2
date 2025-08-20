fx_version 'cerulean'
game 'gta5'

description '100k or Die Killfeed Script (NUI)'
version '1.0.2'

shared_script 'config.lua'

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/stratum2.ttf'  -- Ensure this font file is included or use a fallback
}
