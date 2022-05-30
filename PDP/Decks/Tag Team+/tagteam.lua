
local origTagFunc = PlayerAction.TagTeam.Function
function PlayerAction.TagTeam:Function(target, owner)
  if TagTeamP:GetEnabled() then
  TagTeamP.isTagging=true
  end
origTagFunc(self, target, owner)

end

local origTaggedFunc = PlayerAction.TagTeamTagged.Function
function PlayerAction.TagTeamTagged:Function(target, owner)
  if TagTeamP:GetEnabled() then
  TagTeamP.isTagged=true
  end
  origTaggedFunc(self, target, owner)
end

--Stuff to add to tag team:

-- Another extra 20% health. Kingpin gets 80%, and leech gets 100%, so tag team should at least get more than half that

-- when you tag a teammate, you get 2x the reload speed, and they get 1.5x the reload speed. If both players tag each other, this stacks to create 2.5x for both of them

-- anyone who is tagged (either you tagged someone, or that person being tagged) when you/they are below 50% health, the amount of health gained on kill is doubled. 

-- The person you tag gets a 20% increase in armor recovery rate
