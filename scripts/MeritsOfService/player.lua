local self = require("openmw.self")

require("scripts.MeritsOfService.utils.consts")
require("scripts.MeritsOfService.mofLogic")

local function onQuestUpdate(questId, stage)
    local factionName = GetFactionName(questId)

    if not QuestFinished(questId, self)
        or not factionName
        or CompletedQuests[questId]
    then
        return
    end

    AddCompletedQuest(CompletedQuests, factionName, questId)
    GrantStats(self, factionName, CompletedQuests[factionName].count)
end

local function onSave()
    return CompletedQuests
end

local function onLoad(saveData)
    CompletedQuests = saveData
end

local function retroactiveUpdate()
    -- TODO: test it
    for questId, _ in ipairs(self.type.quests(self)) do
        onQuestUpdate(questId, nil)
    end
end

return {
    engineHandlers = {
        onQuestUpdate = onQuestUpdate,
        onSave = onSave,
        onLoad = onLoad,
    },
    interfaceName = "MeritsOfService",
    interface = {
        version = 1,
        RetroactiveUpdate = retroactiveUpdate,
    },
}
