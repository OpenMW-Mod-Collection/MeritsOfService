local core = require("openmw.core")

require("scripts.MeritsOfService.utils.consts")
require("scripts.MeritsOfService.utils.random")
require("scripts.MeritsOfService.statHandlers")

function QuestFinished(questId, player)
    return player.type.quests(player)[questId].finished
end

function GetFactionName(questId)
    local questName = string.lower(core.dialogue.journal.records[questId].questName)
    for factionName, _ in pairs(Factions) do
        if string.find(questName, "^" .. factionName) then
            return factionName
        end
    end
    return nil
end

function AddCompletedQuest(completedQuests, factionName, questId)
    if not completedQuests[factionName] then
        completedQuests[factionName] = {
            count = 0,
            quests = {}
        }
    end
    completedQuests[factionName].quests[questId] = true
    completedQuests[factionName].count =
        completedQuests[factionName].count + 1
end
