local storage = require("openmw.storage")
local core = require("openmw.core")

require("scripts.MeritsOfService.utils.consts")
require("scripts.MeritsOfService.utils.random")
require("scripts.MeritsOfService.statHandlers")

local sectionRewards = storage.playerSection("SettingsMeritsOfService_rewards")

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

function GrantStats(player, factionName, completedQuests)
    if completedQuests % sectionRewards:get("questsPerReward") ~= 0 then return end

    -- pick reward type
    local rewardType = WeightedRandom({
        [SKILL_REWARD] = sectionRewards:get("skillRewardWeight"),
        [ATTRIBUTE_REWARD] = sectionRewards:get("attributeRewardWeight")
    })

    -- determine reward amount
    local rewardMin, rewardMax
    if rewardType == SKILL_REWARD then
        rewardMin = sectionRewards:get("minSkillReward")
        rewardMax = sectionRewards:get("maxSkillReward")
    else
        rewardMin = sectionRewards:get("minAttributeReward")
        rewardMax = sectionRewards:get("maxAttributeReward")
    end
    local rewardAmount = math.random(rewardMin, rewardMax)

    -- pick specific stats to reward
    local rewards = {}
    local statList = Factions[factionName][rewardType]
    for _ = 1, rewardAmount do
        local stat = RandomChoice(statList)
        if not rewards[stat] then
            rewards[stat] = 0
        end
        rewards[stat] = rewards[stat] + 1
    end

    IncreaseStat(player, rewardType, rewards)
end
