fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'HenkW'
description 'ESX Advanced pawnshop script for selling certain items'
version '1.2.9'

client_scripts {
  'client/**.lua'
}

server_scripts {
  'server/**.lua'
}

shared_scripts {
  '@ox_lib/init.lua',
  'config.lua'
}

dependencies {
  'es_extended',
  'qtarget',
  'ox_lib'
}

