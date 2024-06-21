fx_version 'cerulean'
games { 'gta5' }

author 'Luxcoding'
version '1.0.3'

lua54 'yes'

shared_script {
    'config.lua',
    -- uncomment this if you want to use OX Stuff
    '@ox_lib/init.lua',
    'shared/common.lua',
    'shared/math.lua',
    'shared/table.lua',
    'shared/playerdata.lua',
}

client_scripts {
    'client/callbacks.lua',
    'client/input.lua',
    'client/progressbar.lua',
    'client/notify.lua',
    'client/usersettings.lua',
    'client/infobar.lua',
    'client/raycast.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/callbacks.lua',
    'server/notify.lua',
    'server/playerdata.lua',
    'server/usersettings.lua',
}

ui_page "html/index.html"

files {
    'html/index.html',
    'html/js/*',
    'html/json/*',
    'html/css/*',
    'html/webfonts/*'
}

