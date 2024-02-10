fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'HenkW'
description 'HW Pawnshop'
version '1.2.8'

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

