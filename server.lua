local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
local webhookloja = ""

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPRAR ROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("race-roupas")
AddEventHandler("race-roupas",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)	
	if user_id then
		 if vRP.tryGetInventoryItem(user_id,"coins",20200) then
			vRP.giveInventoryItem(user_id,"roupas",1) 
			TriggerClientEvent("Notify",source,"sucesso","Você agora tem permissão para trocar roupas!")
			SendWebhookMessage(webhookloja,"```[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COMPROU]: ROUPAS "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		 else 
			TriggerClientEvent("Notify",source,"negado","Você não tem <b>coins</b> suficientes!")
		 end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPRAR 10 ENERGETICOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("race-energetico")
AddEventHandler("race-energetico",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		 if vRP.tryGetInventoryItem(user_id,"coins",10000) then
			vRP.giveInventoryItem(user_id,"energetico",10) 
			TriggerClientEvent("Notify",source,"sucesso","Você comprou <b>10 energeticos</b>!")
			SendWebhookMessage(webhookloja,"```[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COMPROU]: 10 ENERGETICOS "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		 else 
			TriggerClientEvent("Notify",source,"negado","Você não tem <b>coins</b> suficientes!")
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPRAR ACESSO A BENNYS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("race-bennys")
AddEventHandler("race-bennys",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		 if vRP.tryGetInventoryItem(user_id,"coins",40000) then
			vRP.addUserGroup(user_id, "bennys")
			TriggerClientEvent("Notify",source,"sucesso","Você liberou acesso a <b>Bennys</b>!")
			SendWebhookMessage(webhookloja,"```[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COMPROU]: BENNYS "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		 else 
			TriggerClientEvent("Notify",source,"negado","Você não tem <b>coins</b> suficientes!")
		end
	end
end)