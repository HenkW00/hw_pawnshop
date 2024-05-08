fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'HenkW'
description 'ESX Advanced pawnshop script for selling certain items'
version '1.3.8'

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
  'ox_lib',
  'hw_utils'
}

escrow_ignore {
  'config.lua',
  'fxmanifest.lua',
  'README.MD'
}