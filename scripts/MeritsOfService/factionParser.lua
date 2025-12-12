local vfs = require("openmw.vfs")
local markup = require('openmw.markup')

local factions = {}

local function validateFile(faction)
    -- TODO
    return true
end

local function parseFactions()
    for fileName in vfs.pathsWithPrefix("MoS_Factions") do
        print(fileName)
        local file = vfs.open(fileName)
        local faction = markup.decodeYaml(file:read("*all"))
        file:close()

        if validateFile(faction) then
            factions[faction.name] = {
                attributes = faction.attributes,
                skills = faction.skills
            }
        else
            error("Can't parse the " .. fileName .. ". Please verify the formatting.")
        end
    end
end

parseFactions()
return factions
