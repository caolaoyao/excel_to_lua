local map = {}

local ConfigData = {
	[1]={id=1,dec="abc"},
	[2]={id=2,dec="adg"},
	[3]={id=3,dec="adg"},
	[4]={id=4,dec="adg"},
	[5]={id=5,dec="adg"},
	[6]={id=6,dec="adg"},
	[7]={id=7,dec="adg"},
	[8]={id=8,dec="adg"},
	[9]={id=9,dec="adg"},
	[10]={id=10,dec="adg"},
	[11]={id=11,dec="adg"},
	[12]={id=12,dec="adg"},
	[13]={id=13,dec="adg"},
	[14]={id=14,dec="adg"},
	[15]={id=15,dec="adg"},
	[16]={id=16,dec="adg"},
	[17]={id=17,dec="adg"},
	[18]={id=18,dec="adg"},
	[19]={id=19,dec="adg"},
	[20]={id=20,dec="adg"},
	[21]={id=21,dec="adg"}
}

function map.GetConfig(id)
	return ConfigData[id]
end

function map.GetAllConfig()
	return ConfigData.value
end

return map