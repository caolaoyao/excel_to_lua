local pet = {}

local ConfigData = {
	[1]={id=1,dec="abc"},
	[2]={id=2,dec="adg"}
}

function pet.GetConfig(id)
	return ConfigData[id]
end

function pet.GetAllConfig()
	return ConfigData.value
end

return pet