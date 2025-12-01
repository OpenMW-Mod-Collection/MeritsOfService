local vfs = require("openmw.vfs")
local markup = require('openmw.markup')

local factions = {}

local function parseFactions()
    for fileName in vfs.pathsWithPrefix("MoS_Factions") do
        print(fileName)

        local file = vfs.open(fileName)
        local faction = markup.decodeYaml(file:read("*all"))
        file:close()

        factions[faction.name] = {
            attributes = faction.attributes,
            skills = faction.skills
        }
    end
end

parseFactions()
return factions
