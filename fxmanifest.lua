fx_version 'cerulean'
game 'gta5'

-- Client
client_scripts {
  "@vrp/lib/utils.lua",
  'client/client.lua',
}

-- Server
server_script {
  "@vrp/lib/utils.lua",
  "server/vrp.lua"
}

-- NUI
ui_page 'nui/nui.html'

files{
  "cfg/cfg.lua",
  'nui/nui.html',
  'nui/script.js',
  'nui/style.css',
  'nui/fonts/*',
}
