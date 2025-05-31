fx_version 'cerulean'
game 'gta5'

author 'u_think'
version '1.0'
lua54 'yes'


shared_scripts {
    'config.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}


dependencies {
    'ox_target',
    'qs-inventory',
    'es_extended'
}