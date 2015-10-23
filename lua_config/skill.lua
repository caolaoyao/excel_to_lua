local Skill = {}

local ConfigData = {
	[1] = {'dec': 'abc', 'id': 1},
	[2] = {'dec': 'adg', 'id': 2}
}

function Skill.GetConfig(id)
	return ConfigData[id]
end

function Skill.GetAllConfig()
	return ConfigData.value
end

return Skill