import config from require "lapis.config"

config "development", ->
  server "nginx"
  code_cache "off"
  num_workers "1"
  postgres ->
      host "db"
      user "moon-shop"
      password "changeit"
      database "moon-shop"
