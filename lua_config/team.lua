local team = {}

local ConfigData = {
	[1]={id=1,dec="abc"},
	[2]={id=2,dec="adg"}
}

function team.GetConfig(id)
	return ConfigData[id]
end

function team.GetAllConfig()
	return ConfigData.value
end

return team