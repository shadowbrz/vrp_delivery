
dependency "vrp"

client_scripts{ 
  "lib/Proxy.lua",
  "lib/Tunnel.lua",
  "cl_delivery.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "sv_delivery.lua"
}