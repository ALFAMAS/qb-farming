Config = {}

Config.Delays = {
	CornProcessing = 1000 * 3
}

Config.PrimaryColor = {r = 51, g = 136, b = 255, a = 255} -- Use RGB color picker
Config.SecondaryColor = {r = 33, g = 244, b = 218, a = 255} -- Use RGB color picker	

Config.CornPlant = 'prop_plant_01a'
Config.CornOutput = math.random(2,4)

Config.MowProp = 'prop_air_lights_02b'

Config.SellLocation =  {x = -505.36, y = -695.75, z = 20.03}

Config.Tractor = 'tractor3'
Config.TractorCoords = vector3(2206.66, 5608.2, 53.76)
Config.TractorSpawn = {	x = 2206.69, y = 5597.9, z = 53.69, h = 169.52}
Config.TractorSpawnHeading = 349
Config.TractorRent = 500

Config.CowProp = 'a_c_cow'
Config.MilkOutput = math.random(2,4)

Config.Blips = {
	{title="Cow Milk Farm",		colour=16, id=141, x = 2478.392, y = 4728.831, z = 34.303},
	{title="Corn Farm Supply",  colour=16, id=140, x = 2041.529, y = 4854.562, z = 43.097},
	{title="Braddock Farm", 	colour=16, id=140, x = 2195.433, y = 5602.635, z = 53.584},
	{title="Orange Farm", 		colour=16, id=103, x = 346.6234, y = 6522.944, z = 28.830},
}

Config.CircleZones = {
	FarmCoords 	   = {coords = vector3(2030.734, 4901.222, 42.721), name = 'blip_weedfield', color = 25, sprite = 496, radius = 100.0},
	Water 		   = {coords = vector3(2041.529, 4854.562, 43.097), name = 'blip_weedfield', color = 25, sprite = 496, radius = 100.0},
	CowFarm 	   = {coords = vector3(2478.392, 4728.831, 34.303), name = 'blip_weedprocessing', color = 0, sprite = 6, radius = 10.0},

	OrangePack     = {coords = vector3(2197.182, 5603.331, 53.513), name = 'blip_weedprocessing', color = 0, sprite = 6, radius = 10.0},
	MilkPack 	   = {coords = vector3(2198.852, 5609.221, 53.442), name = 'blip_weedprocessing', color = 0, sprite = 6, radius = 10.0},
	CornProcessing = {coords = vector3(2196.020, 5594.475, 53.773), name = 'blip_weedprocessing', color = 0, sprite = 6, radius = 10.0},
}

Config.OrangeFarm = {
	vector3(354.250, 6530.591, 28.372),
	vector3(338.965, 6530.528, 28.569),
	vector3(330.093, 6531.027, 28.569),
	vector3(321.656, 6530.707, 29.177),
	vector3(329.928, 6518.202, 28.958),
	vector3(347.375, 6518.130, 28.804),
	vector3(347.491, 6504.641, 28.815)
}

Config.ItemList = {
    ["orange"] = math.random(10, 20),
    ["milk"] = math.random(15, 25),
	["corn_kernel"] = math.random(15, 20),
    ["corn_packet"] = math.random(150, 200),
    ["milk_pack"] = math.random(100, 300),
	["fruit_pack"] = math.random(150, 350),
}
