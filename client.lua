-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA TOTALMENTE DESENVOLVIDO POR: ZEZÃO -> discord.gg/ccZ6HH2
-- SYSTEM FULLY DEVELOPED BY: ZEZÃO -> discord.gg/ccZ6HH2
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
RDserver = Tunnel.getInterface("radares")
	
local motorista = GetPedInVehicleSeat(vehicle, -1)
local meucarro = GetVehiclePedIsUsing(GetPlayerPed(-1))
local jogador = GetPlayerPed(-1)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RADAR 40KM/H
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local RadarQuarenta = {
	[1]  = { ["X"] = 380.63, ["Y"] = -1042.62, ["Z"] = 34.60},
	[2]  = { ["X"] = 195.64, ["Y"] = -593.70, ["Z"] = 29.42},
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for i = 1, #RadarQuarenta do
			local Coordenadas = GetEntityCoords( GetPlayerPed(-1) )
			local Distancia = GetDistanceBetweenCoords(Coordenadas.x, Coordenadas.y, Coordenadas.z, RadarQuarenta[i]["X"], RadarQuarenta[i]["Y"], RadarQuarenta[i]["Z"], true)
			if Distancia < 30.0 then
				Opacidade = math.floor(255 - (Distancia * 7))
				Texto3D(RadarQuarenta[i]["X"], RadarQuarenta[i]["Y"], RadarQuarenta[i]["Z"], "SEMÁFORO INTELIGENTE ~r~(40 KM/H)", Opacidade)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for i = 1, #RadarQuarenta do
			local Coordenadas = GetEntityCoords( GetPlayerPed(-1) )
			local Distancia = GetDistanceBetweenCoords(Coordenadas.x, Coordenadas.y, Coordenadas.z, RadarQuarenta[i]["X"], RadarQuarenta[i]["Y"], RadarQuarenta[i]["Z"], true)
			if Distancia < 10.0 and not RDserver.permissao() then
				VelocidadeQuarenta()
			end
		end
	end
end)

function VelocidadeQuarenta()
	local velocidade = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
	local ValorQuarenta = 100

	if velocidade > 40 and NaoMostrarMensagemPassageiro(GetPlayerPed(-1)) == -1 then
		Citizen.Wait(3000)
		TriggerEvent("radar:texto", "Você foi multado em ~r~" .. ValorQuarenta .. "~w~, você estava a ~r~" .. math.ceil(velocidade) .. " ~w~KM/H", 5000)
		TriggerServerEvent("Multa:Pagar", source)
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RADAR 60KM/H
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local RadarSessenta = {
	[1]  = { ["X"] = 392.03, ["Y"] = -846.50, ["Z"] = 36.34},
	[2]  = { ["X"] = 193.45, ["Y"] = -598.97, ["Z"] = 29.45},
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for i = 1, #RadarSessenta do
			local Coordenadas = GetEntityCoords( GetPlayerPed(-1) )
			local Distancia = GetDistanceBetweenCoords(Coordenadas.x, Coordenadas.y, Coordenadas.z, RadarSessenta[i]["X"], RadarSessenta[i]["Y"], RadarSessenta[i]["Z"], true)
			if Distancia < 30.0 then
				Opacidade = math.floor(255 - (Distancia * 7))
				Texto3D(RadarSessenta[i]["X"], RadarSessenta[i]["Y"], RadarSessenta[i]["Z"], "SEMÁFORO INTELIGENTE ~r~(60 KM/H)", Opacidade)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for i = 1, #RadarSessenta do
			local Coordenadas = GetEntityCoords( GetPlayerPed(-1) )
			local Distancia = GetDistanceBetweenCoords(Coordenadas.x, Coordenadas.y, Coordenadas.z, RadarSessenta[i]["X"], RadarSessenta[i]["Y"], RadarSessenta[i]["Z"], true)
			if Distancia < 10.0 and not RDserver.permissao() then
				VelocidadeRadarSessenta()
			end
		end
	end
end)

function VelocidadeRadarSessenta()
	local velocidade = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
	local ValorRadarSessenta = 100

	if velocidade > 60 and NaoMostrarMensagemPassageiro(GetPlayerPed(-1)) == -1 then
		Citizen.Wait(3000)
		TriggerEvent("radar:texto", "Você foi multado em ~r~" .. ValorRadarSessenta .. "~w~, você estava a ~r~" .. math.ceil(velocidade) .. " ~w~KM/H", 5000)
		TriggerServerEvent("Multa:Pagar", source)
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RADAR 80KM/H
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local RadarOitenta = {
	[1]  = { ["X"] = -57.52, ["Y"] = -493.75, ["Z"] = 40.38},
	[2]  = { ["X"] = -52.07, ["Y"] = -495.46, ["Z"] = 40.46},
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for i = 1, #RadarOitenta do
			local Coordenadas = GetEntityCoords( GetPlayerPed(-1) )
			local Distancia = GetDistanceBetweenCoords(Coordenadas.x, Coordenadas.y, Coordenadas.z, RadarOitenta[i]["X"], RadarOitenta[i]["Y"], RadarOitenta[i]["Z"], true)
			if Distancia < 30.0 then
				Opacidade = math.floor(255 - (Distancia * 7))
				Texto3D(RadarOitenta[i]["X"], RadarOitenta[i]["Y"], RadarOitenta[i]["Z"], "SEMÁFORO INTELIGENTE ~r~(80 KM/H)", Opacidade)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for i = 1, #RadarOitenta do
			local Coordenadas = GetEntityCoords( GetPlayerPed(-1) )
			local Distancia = GetDistanceBetweenCoords(Coordenadas.x, Coordenadas.y, Coordenadas.z, RadarOitenta[i]["X"], RadarOitenta[i]["Y"], RadarOitenta[i]["Z"], true)
			if Distancia < 10.0 and not RDserver.permissao() then
				VelocidadeRadarOitenta()
			end
		end
	end
end)

function VelocidadeRadarOitenta()
	local velocidade = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
	local ValorRadarOitenta = 100

	if velocidade > 80 and NaoMostrarMensagemPassageiro(GetPlayerPed(-1)) == -1 then
		Citizen.Wait(3000)
		TriggerEvent("radar:texto", "Você foi multado em ~r~" .. ValorRadarOitenta .. "~w~, você estava a ~r~" .. math.ceil(velocidade) .. " ~w~KM/H", 5000)
		TriggerServerEvent("Multa:Pagar", source)
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RADAR 100KM/H
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local RadarCem = {
	[1]  = { ["X"] = -46.02, ["Y"] = -497.51, ["Z"] = 40.46},
	[2]  = { ["X"] = -41.62, ["Y"] = -498.86, ["Z"] = 40.46},
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for i = 1, #RadarCem do
			local Coordenadas = GetEntityCoords( GetPlayerPed(-1) )
			local Distancia = GetDistanceBetweenCoords(Coordenadas.x, Coordenadas.y, Coordenadas.z, RadarCem[i]["X"], RadarCem[i]["Y"], RadarCem[i]["Z"], true)
			if Distancia < 30.0 then
				Opacidade = math.floor(255 - (Distancia * 7))
				Texto3D(RadarCem[i]["X"], RadarCem[i]["Y"], RadarCem[i]["Z"], "SEMÁFORO INTELIGENTE ~r~(100 KM/H)", Opacidade)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for i = 1, #RadarCem do
			local Coordenadas = GetEntityCoords( GetPlayerPed(-1) )
			local Distancia = GetDistanceBetweenCoords(Coordenadas.x, Coordenadas.y, Coordenadas.z, RadarCem[i]["X"], RadarCem[i]["Y"], RadarCem[i]["Z"], true)
			if Distancia < 10.0 and not RDserver.permissao() then
				VelocidadeRadarCem()
			end
		end
	end
end)

function VelocidadeRadarCem()
	local velocidade = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
	local ValorRadarCem = 100

	if velocidade > 100 and NaoMostrarMensagemPassageiro(GetPlayerPed(-1)) == -1 then
		Citizen.Wait(3000)
		TriggerEvent("radar:texto", "Você foi multado em ~r~" .. ValorRadarCem .. "~w~, você estava a ~r~" .. math.ceil(velocidade) .. " ~w~KM/H", 5000)
		TriggerServerEvent("Multa:Pagar", source)
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TEXTO 3D
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Texto3D(x,y,z, text, Opacidade)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())    
    if onScreen then
        SetTextScale(0.5, 0.5)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, Opacidade)
        SetTextDropshadow(0, 0, 0, 0, Opacidade)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NÃO MULTA O PASSAGEIRO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function NaoMostrarMensagemPassageiro(Jogador)
    local MeuCarro = GetVehiclePedIsIn(Jogador, false)
    for i = -2, GetVehicleMaxNumberOfPassengers(MeuCarro) do
        if(GetPedInVehicleSeat(MeuCarro, i) == Jogador) then return i end
    end
    return - 2
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TEXTO NA TELA
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("radar:texto")
AddEventHandler("radar:texto", function(text, time)
	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(text)
	DrawSubtitleTimed(time, 1)
end)