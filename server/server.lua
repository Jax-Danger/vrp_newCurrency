local newCurrency = class("newCurrency", vRP.Extension)                    -- Class Name, Can be changed to anything

function newCurrency:__construct()                                  -- Change newCurrency to match Class Name
  vRP.Extension.__construct(self)
end

function newCurrency:getWallet()
  local user    = vRP.users_by_source[source]
  if not user then return 0 end
  local wallet  = user:getWallet()
  return wallet
end

newCurrency.tunnel           = {}
newCurrency.tunnel.getWallet = newCurrency.getWallet


vRP:registerExtension(newCurrency)
