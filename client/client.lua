--##########    VRP Main    ##########--
--init vRP client context
Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

local cvRP = module("vrp", "client/vRP")
vRP = cvRP()

local pvRP = {}

--load script in vRP context
pvRP.loadScript = module
Proxy.addInterface("vRP", pvRP)

local NUILib = class("NUILib", vRP.Extension)     -- Class Name, Can be changed to anything (match with server class name to make things easier
local cfg = module("vrp_NUILib", "cfg/cfg")

function NUILib:__construct()   --Change NUILib to match Class Name
  vRP.Extension.__construct(self)

  CreateThread(function()
    while true do
      Wait(500)

      local wallet = self.remote.getWallet()
      print('wallet',wallet)
      SendNUIMessage({
        type   = 'updateWallet',
        wallet = wallet,
        currencySymbol = cfg.currencySymbol,
        useCommas = cfg.useCommas
      })

    end
  end)

  -- This updates the player's position and heading every 250ms/ quarter second
  CreateThread(function()
    while true do
      Wait(250)

      local playerId        = PlayerPedId()
      local playerCoords    = GetEntityCoords(playerId)
      local playerheading   = GetEntityHeading(playerId)

      SendNUIMessage({
        type    = 'position',
        x       = playerCoords.x,
        y       = playerCoords.y,
        z       = playerCoords.z,
        heading = playerheading
      })
    end
  end)
end

vRP:registerExtension(NUILib)
