local vfs = require("openmw.vfs")
local markup = require('openmw.markup')

local factions = {}

local function validateFile(faction)
    -- TODO
end

local function parseFactions()
    for fileName in vfs.pathsWithPrefix("MoS_Factions") do
        local file = vfs.open(fileName)
        local faction = markup.decodeYaml(file:read("*all"))
        file:close()

        if validateFile(faction) then
            factions[faction.name] = {
                attributes = faction.attributes,
                skills = faction.skills
            }
        else
            print("Couldn't parse " .. fileName .. " faction template. It won't be loaded.")
        end
    end
end

parseFactions()
return factions
