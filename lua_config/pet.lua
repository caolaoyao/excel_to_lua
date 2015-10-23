local Pet = {}

local ConfigData = {
	[1] = {'dec': 'abc', 'id': 1},
	[2] = {'dec': 'adg', 'id': 2}
}

function Pet.GetConfig(id)
	return ConfigData[id]
end

function Pet.GetAllConfig()
	return ConfigData.value
end

return Pet