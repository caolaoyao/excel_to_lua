local Map = {}

local ConfigData = {
	[1] = {'dec': 'abc', 'id': 1},
	[2] = {'dec': 'adg', 'id': 2},
	[3] = {'dec': 'adg', 'id': 3},
	[4] = {'dec': 'adg', 'id': 4},
	[5] = {'dec': 'adg', 'id': 5},
	[6] = {'dec': 'adg', 'id': 6},
	[7] = {'dec': 'adg', 'id': 7},
	[8] = {'dec': 'adg', 'id': 8},
	[9] = {'dec': 'adg', 'id': 9},
	[10] = {'dec': 'adg', 'id': 10},
	[11] = {'dec': 'adg', 'id': 11},
	[12] = {'dec': 'adg', 'id': 12},
	[13] = {'dec': 'adg', 'id': 13},
	[14] = {'dec': 'adg', 'id': 14},
	[15] = {'dec': 'adg', 'id': 15},
	[16] = {'dec': 'adg', 'id': 16},
	[17] = {'dec': 'adg', 'id': 17},
	[18] = {'dec': 'adg', 'id': 18},
	[19] = {'dec': 'adg', 'id': 19},
	[20] = {'dec': 'adg', 'id': 20},
	[21] = {'dec': 'adg', 'id': 21}
}

function Map.GetConfig(id)
	return ConfigData[id]
end

function Map.GetAllConfig()
	return ConfigData.value
end

return Map