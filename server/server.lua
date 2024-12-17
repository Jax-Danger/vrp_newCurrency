local NUILib = class("NUILib", vRP.Extension)                    -- Class Name, Can be changed to anything

function NUILib:__construct()                                  -- Change NUILib to match Class Name
  vRP.Extension.__construct(self)
end

function NUILib:getWallet()
  local user    = vRP.users_by_source[source]
  local wallet  = user:getWallet()
  return wallet
end

NUILib.tunnel           = {}
NUILib.tunnel.getWallet = NUILib.getWallet


vRP:registerExtension(NUILib)
