-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA TOTALMENTE DESENVOLVIDO POR: ZEZÃO -> discord.gg/ccZ6HH2
-- SYSTEM FULLY DEVELOPED BY: ZEZÃO -> discord.gg/ccZ6HH2
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
vRPrd = {}
Tunnel.bindInterface("radares",vRPrd)

RegisterServerEvent('Multa:Pagar')
AddEventHandler('Multa:Pagar', function()
    local user_id = vRP.getUserId(source)
    local multas = vRP.getUData(user_id,"multas")
    if multas == "" then 
        multas = 0 
    else 
        multas = tonumber(multas) 
    end
    vRP.insertPoliceRecord(user_id, "Excesso de Velocidade")
    vRP.setUData(user_id,"multas",multas+100)
end)

function vRPrd.permissao()
    local source = source
    local user_id = vRP.getUserId(source)
    return vRP.hasPermission(user_id, "passar.radar")
end