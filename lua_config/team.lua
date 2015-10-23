local Team = {}

local ConfigData = {
	[1] = {'dec': 'abc', 'id': 1},
	[2] = {'dec': 'adg', 'id': 2}
}

function Team.GetConfig(id)
	return ConfigData[id]
end

function Team.GetAllConfig()
	return ConfigData.value
end

return Team