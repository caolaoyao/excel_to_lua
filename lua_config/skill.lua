local skill = {}

local ConfigData = {
	[1]={id=1,dec="abc"},
	[2]={id=2,dec="adg"}
}

function skill.GetConfig(id)
	return ConfigData[id]
end

function skill.GetAllConfig()
	return ConfigData.value
end

return skill