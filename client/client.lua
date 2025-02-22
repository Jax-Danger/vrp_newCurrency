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

local newCurrency = class("newCurrency", vRP.Extension)     -- Class Name, Can be changed to anything (match with server class name to make things easier
local cfg = module("vrp_newCurrency", "cfg/cfg")

function newCurrency:__construct()   --Change newCurrency to match Class Name
  vRP.Extension.__construct(self)

  CreateThread(function()
    while true do
      Wait(500)

      local wallet = self.remote.getWallet()
      --print('wallet',wallet)
      SendNUIMessage({
        type   = 'updateWallet',
        wallet = wallet,
        currencySymbol = cfg.currencySymbol,
        useCommas = cfg.useCommas
      })

    end
  end)
end


vRP:registerExtension(newCurrency)
