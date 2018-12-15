--Output: https://en.wikipedia.org/wiki/User:Robingan7/sandbox
--Task information: https://en.wikipedia.org/wiki/User:RexxS/GCI-Task01
--Task information: https://en.wikipedia.org/wiki/User:RexxS/GCI-Task02
--Task information: https://en.wikipedia.org/wiki/User:RexxS/GCI-Task03
--Task information: https://en.wikipedia.org/wiki/User:RexxS/GCI-Task04
--Task information: https://en.wikipedia.org/wiki/User:RexxS/GCI-Task05
--Task information: https://en.wikipedia.org/wiki/User:RexxS/GCI-Task06
--Robingan7 Google Code-in, Introduction to Lua in Wikipedia
-- Lua Task 2 - Working with modules Google Code-in, Introduction to Lua in Wikipedia
local p = {}-- p stands for package

function p.hello( frame )
    return "Hello, world!"
end

p.Hi = function(frame)
	strName = frame.args.name or "Jimbo"
	return "Hello from Lua to my friend " .. strName .. ".<br>"
end

function p.temperature(frame)
	cel = tonumber(frame.args.celsius) or 0
	fah=cel*9/5+32
	
	msg= cel.. " degrees Celsius is " ..fah.." degrees Fahrenheit"
	if cel>9 then
		msg=msg.." it is hot" 
		else msg=msg.." it is cold" 
	end
	return msg
end	

-- Task 4
p.times = function(frame)
 	local num = tonumber( frame.args.num ) or 2
 	local out = num.." Times table<br>"
 	for i = 1, 12 do
 		out = out..num.." times "..i .." equals ".. i * num .. "<br>"
 	end
 	return out
 end
 
 p.mum = function(frame)
	local family = {"Dad", "Mum", "Uncle Stan", "Aunty Elsie", "Brian","Robin","Gan","Lua"}
	local msg = ""
	for i = 1, #family do
		msg = msg .. "Hello " .. family[i] .. "<br>"
	end	
	return msg
    end

p.sentence = function(frame)
	local str = frame.args.words or ""
	local out1= string.upper(string.sub(str, 1, 1))
	local out2 = string.sub(str, 2)
	return out1..out2
end

p.unpackdate = function(frame)
	local dmydate = frame.args.dmydate or ""
	local day, month, year = string.match(dmydate, "(%d+) (%w+) (%d+)")
	return "Year = " .. year .. "<br>Day = " .. day .. "<br>Month = " .. month
end

p.langnames = function(frame)
 local langlist = mw.language.fetchLanguageNames()
  	local langs = ""
  	local count = 0
  	for k, v in pairs(langlist) do
  		langs = langs .. k .. " - " .. v .. "<br>"
  		count = count + 1
  	end
  	return langs .. "<br>= " .. count .. " languages"
 end
 
 p.fallbacks = function(frame)
 	local langcode = frame.args.langcode
 	local langlist=mw.language.getFallbacksFor( langcode )
 	local langs=""
	local count=0
	for k, v in pairs(langlist) do
  		langs = langs .. k .. " - " .. v .. "<br>"
  		count = count + 1
  	end
  	return langs .. "<br>= " .. count .. " fallbacks"
 end
 
 p.pagename = function( frame )
 	local ttl = frame.args.title
 	local ttlobj = mw.title.new( ttl )
 	local txt = ttlobj.text
 	return txt
 end
 
 p.pageinfo = function( frame )
 	local ttl = frame.args.title or ""
 	local ttlobj = mw.title.new( ttl)
 
 	if ttlobj==nil then return "invaild title"
 		else
 	local txt = ttlobj.text
 	local result=""
 	result=result..txt
 	if ttlobj.exists==true then
 		result=result.." exists and "
 		else result=result.." does not exist and "
 	end
 	
 	if ttlobj.isRedirect==true then
 		result=result.."is a redirect"
 		else result=result.."is not a redirect " 
 		end
 	return result
 end
 end
	
return p
