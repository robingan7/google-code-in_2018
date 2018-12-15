--Output: https://en.wikipedia.org/wiki/User:Robingan7/Sandbox/Dates
--Task information: https://en.wikipedia.org/wiki/User:RexxS/GCI-Task07
local p = {}


local function leapd(y)
	if y % 1000 == 0 then return 29 end
	if y % 100 == 0 then return 28 end
	if y% 4 == 0 then return 29 end
	return 28
end

local months = { "jan", "feb", "mar", "apr", "may", "jun","jul", "aug", "sep", "oct", "nov", "dec" }
local days_in_month = { 31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }
days_in_month[0] = 0
local month_idx = {}
for i, v in ipairs(months) do
	month_idx[v] = i
end

local function day_try(d, m, y)
	days_in_month[2] = leapd(y)
	if tonumber(d) < 1 or tonumber(d) > days_in_month[m] then
		return "Invalid"
	end
	return "Valid"
end

local function day_or_mon_year(thing)
	if tonumber(thing)>31 then return "year" 
		else if tonumber(thing)==nil then
			 return "month" 
		
	 end	
    end
end

local function iso_month(thing)
	if thing=="01" then return "January" else return thing end
	if thing=="02" then return "February" else return thing end
	if thing=="03" then return "March" else return thing end
	if thing=="04" then return "April" else return thing end
	if thing=="05" then return "May" else return thing end
	if thing=="06" then return "June" else return thing end
	if thing=="07" then return "July" else return thing end
	if thing=="08" then return "August" else return thing end
	if thing=="09" then return "September" else return thing end
	if thing=="10" then return "October" else return thing end
	if thing=="11" then return "November" else return thing end
	if thing=="12" then return "December" else return thing end
end 
local function month_edit(thing)
	local count=1
	local count2=1
	local count3=1
	local count4=1
	local months = { "jan", "feb", "mar", "apr", "may", "jun","jul", "aug", "sep", "oct", "nov", "dec" }
	local month1_idx = {}
    for i, v in ipairs(months) do
		month1_idx[v] = i
	end
	local months2={ "Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec" }
	local month2_idx = {}
	for i, v in ipairs(months2) do
		month2_idx[v] = i
	end
	local month3_idx = {}
	local months3={ "January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December" }
	for i, v in ipairs(months3) do
		month3_idx[v] = i
	end
	
	local month4_idx = {}
	local months4={ "january", "february", "march", "april", "may", "june","july", "august", "september", "october", "november", "december" }
	for i, v in ipairs(months4) do
		month4_idx[v] = i
	end
	for i=1,12 do 
		if thing == months3[i] then count=count+1 end
	end
	
	for i=1,12 do 
		if thing == months2[i] then count3=count3+1 end
	end
	
	for i=1,12 do 
		if thing == months[i] then count2=count2+1 end
	end
	
	for i=1,12 do 
		if thing == months4[i] then count4=count4+1 end
	end
	
	if count==2 then return thing end
	if count==1 then if count2==2 then return months3[month1_idx[thing]] end end
	if count==1 then if count3==2 then return months3[month2_idx[thing]] end end
	if count==1 then if count4==2 then return months3[month4_idx[thing]] end end
end

local function iso_edit(num)
	if tonumber(num)<10 then 
		return "0"..num 
		else return num 
		end
		
end	
	
p.unpackdate = function(frame)
	local dmydate = frame.args.dmydate or ""
	
	local formatdate = frame.args.formatdate or ""
	
	local months = { "jan", "feb", "mar", "apr", "may", "jun","jul", "aug", "sep", "oct", "nov", "dec" }
	local months2={ "Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec" }
	local months4={ "january", "february", "march", "april", "may", "june","july", "august", "september", "october", "november", "december" }
	local months3={ "January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December" }
	local month_idx = {}
	for i, v in ipairs(months3) do
		month_idx[v] = i
	end
	local special_year={"BC","BCE","AD","CE"}
	local around={"around","uncertain"}
	local year=""
	local month=""
	local day=""
	local special=""
	local appro=""
	local num1,num2,num3
	
	numbers = {}
	for num in string.gmatch(dmydate, "%d+") do
    	numbers[#numbers + 1] = num
	end
	
	strings = {}
	for stringss in string.gmatch(dmydate, "%a+") do
    	strings[#strings + 1] = stringss
	end
	
	for i=1,#strings do
		for i2=1,4 do
			if strings[i]==special_year[i2] then special=" "..strings[i].." "  end
			end	
	end
	
	for i=1,#strings do
	 for i2=1,2 do
		if strings[i]==around[i2] then appro="circa".." " end
		end	
	end
	
	for i=1,#strings do
		for i2=1,12 do
			if strings[i]==months[i2] then month=strings[i] end
			end
		for i2=1,12 do
			if strings[i]==months2[i2] then month=strings[i] end
			end	
		for i2=1,12 do
			if strings[i]==months3[i2] then month=strings[i] end
			end	
		for i2=1,12 do
			if strings[i]==months4[i2] then month=strings[i] end
			end		
	end	
	
	if(#numbers==2 ) then if tonumber(numbers[1])>31 then year = numbers[1] day = numbers[2]
		else year = numbers[2] day = numbers[1]
			end end 
	
	if(#numbers==3) then if tonumber(numbers[1])>31 then year = numbers[1].." "..special day = numbers[3] month=numbers[2]
		else if special=="" then year = numbers[3] day = numbers[1] month=numbers[2] 
			else year = numbers[3].." "..special day = numbers[1] month=numbers[2]
			end end end		
	
	if month=="01" then month ="January"  end
	if month=="02" then month ="February" end
	if month=="03" then month ="March" end
	if month=="04" then month= "April" end
	if month=="05" then month ="May" end
	if month=="06" then month ="June" end
	if month=="07" then month= "July" end
	if month=="08" then month ="August" end
	if month=="09" then month= "September" end
	if month=="10" then month= "October" end
	if month=="11" then month= "November" end
	if month=="12" then month ="December" end
		
	if(#numbers==2 and month=="" and #strings==0) then if tonumber(numbers[1])>31 then year = numbers[1].." "..special day = numbers[2]
		else year = numbers[2].." "..special day = numbers[1] return appro..year..special
			end end 	
	
	if(#numbers==2 and month=="" and #strings>0) then return "invalid entry" end
	
	if(#numbers==0) then return "invalid entry" end
	if(#numbers==3 and formatdate=="" )then formatdate="iso" end
	if(formatdate=="" ) then formatdate="dym" end
	if(#numbers==1 and month=="") then return appro..numbers[1].." "..special end
	if(#numbers==1 and #strings==1) then return appro..numbers[1].." "..strings[1]..special end
	
	if(formatdate=="dym") then 
		if month_idx[month_edit(month)]==2 then 
			if day_try(day, month_idx[month_edit(month)], year)=="Invalid" then 
				return "invalid entry" else 
					return appro..day.." "..month_edit(month).." "..year..special end
	else return appro..day.." "..month_edit(month).." "..year..special	end end	
	--appro..day.." "..month_edit(month).." "..year..special
	--appro..day.." "..month_edit(month).." "..year..special
	if(formatdate=="mdy") then 
		if month_idx[month_edit(month)]==2 then 
			if day_try(day, month_idx[month_edit(month)], year)=="Invalid" then 
				return "invalid entry" else 
					return  appro..month_edit(month).." "..day..","..year..special end
	else return appro..month_edit(month).." "..day..","..year..special	end end	
	
	
	if(formatdate=="iso") then 
		if month_idx[month_edit(month)]==2 then 
			if day_try(day, month_idx[month_edit(month)], year)=="Invalid" then 
				return "invalid entry" else 
					return  appro..year..special.."-"..month_idx[month_edit(iso_month(month))].."-"..iso_edit(day)  end
	else return appro..year..special.."-"..month_idx[month_edit(iso_month(month))].."-"..iso_edit(day) end end	
--appro..year..special.."-"..month_idx[month_edit(iso_month(month))].."-"..iso_edit(day) 
	if(formatdate=="year") then 
		if month_idx[month_edit(month)]==2 then 
			if day_try(day, month_idx[month_edit(month)], year)=="Invalid" then 
				return "invalid entry" else 
					return  appro..year..special end
	else return appro..year..special	end end	
	
	if(formatdate=="month and year") then if day_try(day, month_idx[month_edit(month)], year)=="Invalid" then return "invalid entry" else return appro..month_edit(month).." "..year end end
	
end
return p
