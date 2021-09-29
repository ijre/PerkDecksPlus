local origmelee = PlayerDamage.damage_melee
function PlayerDamage:damage_melee(data)
    if not YakuzaP.resoluteC or not self:_chk_can_take_dmg() then
       return origmelee(self, data)
        
    end

    return "countered"

end
