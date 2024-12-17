-- This updates the player's position and heading every 500ms
CreateThread(function()
  while true do
    Wait(100)

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

-- CreateThread(function()
--   while true do
--     Wait(1000)
--     SendNUIMessage({    type ='ping',  })
--   end
-- end)


--
-- Nui Callbacks
--

-- RegisterNUICallback('pong', function(data, cb)
--   print('Got pong, foo value is', data.foo)

--   cb({acceptedPong = true })
-- end)

RegisterNUICallback('releaseFocus', function(data, cb)
  cb({})

  SetNuiFocus(false, false)
end)

RegisterNUICallback('teleport', function(data, cb)
  print('Teleporting to', data.x, data.y, data.z)
  SetEntityCoords(PlayerPedId(), data.x, data.y, data.z)

  cb({})
end)

--
-- Keybinding
--
RegisterCommand("+openteleporter", function()
  --SendNUIMessage({ type = 'openteleporter' })
  SetNuiFocus(true, true)
end, false)

RegisterKeyMapping('+openteleporter', 'Open Teleporter', 'keyboard', 'F2')
