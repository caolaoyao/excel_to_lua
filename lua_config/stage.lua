local Stage = {}

local ConfigData = {
	[1] = {'dec': 'abc', 'id': 1},
	[2] = {'dec': 'adg', 'id': 2}
}

function Stage.GetConfig(id)
	return ConfigData[id]
end

function Stage.GetAllConfig()
	return ConfigData.value
end

return Stage