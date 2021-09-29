local origondmg = CopDamage.damage_melee
function CopDamage:damage_melee(damageinfo)
    if not damageinfo.is_synced and (damageinfo.name_id == "fists" or damageinfo.name_id == "fight")
        then 
            if damageinfo.damage <= 10.0 then
            damageinfo.damage = 10.0
            end

    end

    origondmg(self, damageinfo)
    
    
end