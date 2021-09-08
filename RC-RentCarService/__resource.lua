resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

game 'gta5'

description 'RC-RentCarService |vRP Framework'

server_scripts {
    '@vrp/lib/utils.lua',
	'server/main.lua',
	'config.lua'
}

client_scripts {
    "lib/Tunnel.lua",
    "lib/Proxy.lua",
	'client/main.lua',
	'client/nui.lua',
	'config.lua'
}

ui_page "html/index.html"

files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/Img/logo.png',
    'html/Img/check.png',
    'html/Img/close.png',
    'html/Img/motorcycle.png',
    'html/Img/sportcar.png'
}