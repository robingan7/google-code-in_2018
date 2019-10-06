--Ouput: https://en.wikipedia.org/wiki/User:Robingan7/Sandbox/Wikidata
--Task Information: https://en.wikipedia.org/wiki/User:RexxS/GCI-Task09
local p={}

p.createtable = function(frame)
	local id = frame.args.id or ""
	local property = frame.args.property or ""

	local id2={}
	local links={}
	local result=""
	local repl=""
	for k, v in pairs(mw.wikibase.getBestStatements( id, property )) do
		id2[k]=v.mainsnak.datavalue.value.id
	end

--mw.wikibase.getBestStatements( id, property )[k]

	for i=1,#id2 do
		sitelink = mw.wikibase.getSitelink(id2[i])
		label = mw.wikibase.getLabel(id2[i])
		if sitelink ~=nil then
			if sitelink==label then
				links[i]="[["..sitelink.."]]"
			else
				if (property=="P735" or property=="P734") then
					strings = {}
					for stringss in string.gmatch(sitelink, "%a+") do
    					strings[#strings + 1] = stringss
					end
					links[i]="[["..sitelink.."|"..strings[1].."]]"
				else
					if property=="P106" then
						strings = {}
						for stringss in string.gmatch(sitelink, "%a+") do
							strings[#strings + 1] = stringss
						end
						links[i]="[["..sitelink.."|"..strings[1].."]]"
					else
						links[i]="[["..sitelink.."]]"
					end
				end
			end 
		else
			links[i]=label
		end
	end

	--return repl[1]
	return table.concat( links, "<br>", 1, #links )
end

return p
