local ambient = require("openmw.ambient")
local I = require("openmw.interfaces")
local storage = require("openmw.storage")

require("scripts.MeritsOfService.utils.consts")
require("scripts.MeritsOfService.utils.string")

local sectionRewards = storage.playerSection("SettingsMeritsOfService_rewards")

local function increaseSkillsInterface(player, stats)
    local src = I.SkillProgression.SKILL_INCREASE_SOURCES.Usage
    for skillId, count in pairs(stats) do
        local skill = SkillNameToHandler[skillId](player)
        local skillXp = skill.progress

        -- increase skill
        for _ = 1, count do
            I.SkillProgression.skillLevelUp(skillId, src)
        end

        -- carry xp if needed
        if sectionRewards:get("carrySkillXp") then
            skill.progress = skillXp
        end
    end
end

local function increaseSkillsBrute(player, stats)
    local msg = ""
    for skillId, count in pairs(stats) do
        local skill = SkillNameToHandler[skillId](player)

        -- increase skill
        for _ = 1, count do
            skill.base = skill.base + 1
        end

        -- reset xp if needed
        if not sectionRewards:get("carrySkillXp") then
            skill.progress = 0
        end

        -- update message
        msg = msg .. "Your " .. Capitalize(skillId) .. " increased to " .. tostring(skill.base) .. ".\n"
    end
    msg = msg:sub(1, -2) -- remove last newline
    player:sendEvent("ShowMessage", { message = msg })
    ambient.playSound("skillraise")
end

local function increaseAttrs(player, stats)
    local msg = ""
    for attrId, count in pairs(stats) do
        local attr = AttrNameToHandler[attrId](player)

        -- increase attribute
        for _ = 1, count do
            attr.base = attr.base + 1
        end

        -- update message
        msg = msg .. "Your " .. Capitalize(attrId) .. " increased to " .. tostring(attr.base) .. ".\n"
    end
    msg = msg:sub(1, -2) -- remove last newline
    player:sendEvent("ShowMessage", { message = msg })
    ambient.playSound("skillraise")
end

local function increaseStat(player, statType, stats)
    if statType == SKILL_REWARD then
        if sectionRewards:get("triggerSkillupHandlers") then
            increaseSkillsInterface(player, stats)
        else
            increaseSkillsBrute(player, stats)
        end
    elseif statType == ATTRIBUTE_REWARD then
        increaseAttrs(player, stats)
    end
end

function GrantStats(player, factionName, completedQuests)
    if completedQuests % sectionRewards:get("questsPerReward") ~= 0 then return end

    -- pick reward type
    local rewardType = WeightedRandom({
        [SKILL_REWARD]     = sectionRewards:get("skillRewardWeight"),
        [ATTRIBUTE_REWARD] = sectionRewards:get("attributeRewardWeight")
    })

    -- determine reward amount
    local rewardRange = {
        [SKILL_REWARD] = {
            sectionRewards:get("minSkillReward"),
            sectionRewards:get("maxSkillReward")
        },
        [ATTRIBUTE_REWARD] = {
            sectionRewards:get("minAttributeReward"),
            sectionRewards:get("maxAttributeReward")
        }
    }
    local rewardAmount = math.random(
        table.unpack(rewardRange[rewardType]))

    -- init data for stat picking
    local rewards = {}
    local statList = {}
    for t, name in pairs(Factions[factionName][rewardType]) do
        statList[t] = name
    end
    local caps = {
        [SKILL_REWARD]     = sectionRewards:get("capSkills"),
        [ATTRIBUTE_REWARD] = sectionRewards:get("capAttr"),
    }

    -- pick specific stats to reward
    for _ = 1, rewardAmount do
        -- prune capped stats
        for stat in pairs(statList) do
            local currStat = RewardTypeToHandler[rewardType][stat](player)
            local currReward = rewards[stat] or 0

            if currStat + currReward >= caps[rewardType] then
                statList[stat] = nil
            end
        end

        if next(statList) == nil then break end

        local stat = RandomChoice(statList)
        rewards[stat] = (rewards[stat] or 0) + 1
    end

    increaseStat(player, rewardType, rewards)
end
