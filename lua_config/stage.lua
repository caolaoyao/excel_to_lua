local stage = {}

local ConfigData = {
	[1]={id=1,dec="abc"},
	[2]={id=2,dec="adg"}
}

function stage.GetConfig(id)
	return ConfigData[id]
end

function stage.GetAllConfig()
	return ConfigData.value
end

return stage