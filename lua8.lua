local p={}

p.names = function(frame)
	local name = frame.args.name or ""
	
	local formatname = frame.args.formatname or ""
	

	strings = {}
	for stringss in string.gmatch(name, "%C%P%S*") do
    	strings[#strings + 1] = stringss
	end
	
	if(formatname=="zh") then return "Given = "..strings[2].."<br>Family = "..strings[1] end
	if(formatname=="en") then  
		suffix={" Jr"," Sr"," III"," II"," I"}
	judge=false
	for i=1,#strings do 
		for i2=1,#suffix do
			if(strings[i]==suffix[i2]) then judge=true end end end
	given=""
	
	if(judge==true) then 
		for i3=1,#strings-2 do given=given.." "..strings[i3] end
		return  "Given = "..given.."<br>Family = "..strings[#strings-1] 
	else 
		for i4=1,#strings-1 do given=given.." "..strings[i4] end
		return  "Given = "..given.."<br>Family = "..strings[#strings] 
		end
	end
	
	if(formatname=="es") then 
		given=""
		if(#strings>2) then 
		for i=1,#strings-2 do given=given.." "..strings[i] end
			return "Given = "..given.."<br>Family = "..strings[#strings-1].." "..strings[#strings] 
    else 
    	for i=1,#strings-1 do given=given.." "..strings[i] end
			return "Given = "..given.."<br>Family = ".." "..strings[#strings] end end 
	
	if(formatname=="nl") then 
		suffix={" van"," de","van","de"," von"}
		breakpoint=0
	judge=false
	for i=1,#strings do 
		for i2=1,#suffix do
			if(strings[i]==suffix[i2]) then judge=true breakpoint=i end end end
	given=""
	family=""
	
	if(judge==true) then 
		for i3=1,breakpoint-1 do given=given.." "..strings[i3] end
		for i5=breakpoint,#strings do family=family.." "..strings[i5] end
		return  "Given = "..given.."<br>Family = "..family
	else 
		for i4=1,#strings-1 do given=given.." "..strings[i4] end
		return
		"Given = "..given.."<br>Family = "..strings[#strings] 
		
		end
	end
	
	if(formatname=="de") then 
		suffix={" von"}
		breakpoint=0
	judge=false
	for i=1,#strings do 
		for i2=1,#suffix do
			if(strings[i]==suffix[i2]) then judge=true breakpoint=i end end end
	given=""
	family=""
	
	if(judge==true) then 
		for i3=1,breakpoint-1 do given=given.." "..strings[i3] end
		for i5=breakpoint,#strings do family=family.." "..strings[i5] end
		return  "Given = "..given.."<br>Family = "..family
	else 
		for i4=1,#strings-1 do given=given.." "..strings[i4] end
		return
		"Given = "..given.."<br>Family = "..strings[#strings] 
		
		end
	end
	
	if(formatname=="") then 
		if(#strings[1]==3 or strings[1]=="Zheng") then formatname="zh"  end
		 
		suffix={" van"," de","van","de"," von"}
		judge=false
		 for i=1,#strings do 
			for i2=1,#suffix do
				if(strings[i]==suffix[i2]) then judge=true end 
				if(formatname~="zh" or judge==true) then
				if(judge==true) then formatname="nl"  else formatname="en" end end end end end
		
		strings2 = {}
		for i5=1,#strings do 
			
			for stringss2 in string.gmatch(strings[i5], "%A%P+") do
    			strings2[#strings2 + 1] = stringss2
			end	end
		
		judge3=false
		if(#strings2-#strings>=0) then judge3=true end
		
		for i7=1,#strings2 do 
			if(string.sub(strings2[i7],1,1)=="-") then judge3=false end end
				
	
		if(judge3==true and judge==false and formatname~="zh" or #strings>4) then formatname="es"  end	
		
	if(formatname=="zh") then return "Given = "..strings[2].."<br>Family = "..strings[1] end
	if(formatname=="en") then  
		suffix={" Jr"," Sr"," III"," II"," I"}
	judge=false
	for i=1,#strings do 
		for i2=1,#suffix do
			if(strings[i]==suffix[i2]) then judge=true end end end
	given=""
	
	if(judge==true) then 
		for i3=1,#strings-2 do given=given.." "..strings[i3] end
		return  "Given = "..given.."<br>Family = "..strings[#strings-1] 
	else 
		for i4=1,#strings-1 do given=given.." "..strings[i4] end
		return  "Given = "..given.."<br>Family = "..strings[#strings] 
		end
	end
	
	if(formatname=="es") then 
		given=""
		if(#strings>2) then 
		for i=1,#strings-2 do given=given.." "..strings[i] end
			return "Given = "..given.."<br>Family = "..strings[#strings-1].." "..strings[#strings] 
    else 
    	for i=1,#strings-1 do given=given.." "..strings[i] end
			return "Given = "..given.."<br>Family = ".." "..strings[#strings] end end 
	
	if(formatname=="nl") then 
		suffix={" van"," de","van","de"," von"}
		breakpoint=0
	judge=false
	for i=1,#strings do 
		for i2=1,#suffix do
			if(strings[i]==suffix[i2]) then judge=true breakpoint=i end end end
	given=""
	family=""
	
	if(judge==true) then 
		for i3=1,breakpoint-1 do given=given.." "..strings[i3] end
		for i5=breakpoint,#strings do family=family.." "..strings[i5] end
		return  "Given = "..given.."<br>Family = "..family
	else 
		for i4=1,#strings-1 do given=given.." "..strings[i4] end
		return
		"Given = "..given.."<br>Family = "..strings[#strings] 
		
		end
	end    		
end	
return p
