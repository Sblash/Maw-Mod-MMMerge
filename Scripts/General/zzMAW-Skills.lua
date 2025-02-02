local function UncapSkills(char)
	for _,skill in pairs(const.Skills) do
		local value = char.Skills[skill]
		
		if value > 0x100 then
			char.Skills[skill] = value - 0x100 + 0x1000
		elseif value > 0x80 then
			char.Skills[skill] = value - 0x80 + 0x800
		elseif value > 0x40 then
			char.Skills[skill] = value - 0x40 + 0x400
		end
	end
end

function events.LoadMap(wasInGame)
	if not vars.UncappedSkills then
		vars.UncappedSkills = 1
		for i=0,Party.PlayersArray.High do
			UncapSkills(Party.PlayersArray[i])
		end
	end
end

-- weapon base recovery bonuses

oldWeaponBaseRecoveryBonuses =
{ 
	[const.Skills.Bow] = 0,
	[const.Skills.Blaster] = 70,
	[const.Skills.Staff] = 0,
	[const.Skills.Axe] = 0,
	[const.Skills.Sword] = 10,
	[const.Skills.Spear] = 20,
	[const.Skills.Mace] = 20,
	[const.Skills.Dagger] = 40,
}
newWeaponBaseRecoveryBonuses =
{
	[const.Skills.Bow] = 0,
	[const.Skills.Blaster] = 100,
	[const.Skills.Staff] = 0,
	[const.Skills.Axe] = 20,
	[const.Skills.Sword] = 10,
	[const.Skills.Spear] = 10,
	[const.Skills.Mace] = 20,
	[const.Skills.Dagger] = 40,
}

oldWeaponSkillAttackBonuses =
{
	[const.Skills.Staff]	= {1, 1, 1, 1,},
	[const.Skills.Sword]	= {1, 1, 1, 1,},
	[const.Skills.Dagger]	= {1, 1, 1, 1,},
	[const.Skills.Axe]		= {1, 1, 1, 1,},
	[const.Skills.Spear]	= {1, 1, 1, 1,},
	[const.Skills.Bow]		= {1, 1, 1, 1,},
	[const.Skills.Mace]		= {1, 1, 1, 1,},
	[const.Skills.Blaster]	= {1, 2, 3, 5,},
	[const.Skills.Unarmed]	= {1, 1, 2, 2,},
	
}
newWeaponSkillAttackBonuses =
{
	[const.Skills.Staff]	= {1, 2, 2, 2,},
	[const.Skills.Sword]	= {1, 2, 2, 2,},
	[const.Skills.Dagger]	= {1, 2, 2, 2,},
	[const.Skills.Axe]		= {1, 2, 2, 2,},
	[const.Skills.Spear]	= {1, 2, 2, 3,},
	[const.Skills.Bow]		= {3, 3, 3, 3,},
	[const.Skills.Mace]		= {1, 2, 2, 2,},
	[const.Skills.Blaster]	= {5, 10, 15, 20,},
	[const.Skills.Unarmed]	= {2, 2, 3, 3,},
}
-- weapon skill recovery bonuses (by rank)

oldWeaponSkillRecoveryBonuses =
{
	[const.Skills.Staff]	= {0, 0, 0, 0,},
	[const.Skills.Sword]	= {0, 1, 1, 1,},
	[const.Skills.Dagger]	= {0, 0, 0, 0,},
	[const.Skills.Axe]		= {0, 1, 1, 1,},
	[const.Skills.Spear]	= {0, 0, 0, 0,},
	[const.Skills.Bow]		= {0, 1, 1, 1,},
	[const.Skills.Blaster]	= {0, 0, 0, 0,},
	[const.Skills.Mace]		= {0, 0, 0, 0,},
	[const.Skills.Unarmed]	= {0, 0, 0, 0,},
}
newWeaponSkillRecoveryBonuses =
{
	[const.Skills.Staff]	= {0, 0, 0, 0,},
	[const.Skills.Sword]	= {0, 1, 2, 2,},
	[const.Skills.Dagger]	= {0, 0, 0, 1,},
	[const.Skills.Axe]		= {0, 1, 2, 2,},
	[const.Skills.Spear]	= {0, 0, 0, 0,},
	[const.Skills.Bow]		= {1, 2, 2, 3,},
	[const.Skills.Mace]		= {0, 0, 0, 0,},
	[const.Skills.Blaster]	= {0, 0, 0, 0,},
	[const.Skills.Unarmed]	= {0, 1, 1, 2,},
}
-- weapon skill damage bonuses (by rank)
oldWeaponSkillDamageBonuses =
{
	[const.Skills.Staff]	= {0, 0, 0, 1},
	[const.Skills.Sword]	= {0, 0, 0, 0},
	[const.Skills.Dagger]	= {0, 0, 0, 1},
	[const.Skills.Axe]		= {0, 0, 1, 1},
	[const.Skills.Spear]	= {0, 1, 1, 1},
	[const.Skills.Bow]		= {0, 0, 0, 1},
	[const.Skills.Mace]		= {0, 1, 1, 1},
	[const.Skills.Blaster]	= {0, 0, 0, 0},
	[const.Skills.Unarmed]	= {0, 1, 2, 2,},
}
newWeaponSkillDamageBonuses =
{
	[const.Skills.Staff]	= {0, 1, 2, 3,},
	[const.Skills.Sword]	= {1, 1, 2, 2,},
	[const.Skills.Dagger]	= {0, 0, 1, 1,},
	[const.Skills.Axe]		= {1, 2, 3, 4,},
	[const.Skills.Spear]	= {0, 1, 2, 3,},
	[const.Skills.Bow]		= {1, 2, 2, 3,},
	[const.Skills.Mace]		= {1, 2, 3, 4,},
	[const.Skills.Blaster]	= {0, 0, 0, 0,},
	[const.Skills.Unarmed]	= {4, 5, 6, 6,},
}
-- weapon skill AC bonuses (by rank)

oldWeaponSkillACBonuses =
{
	[const.Skills.Staff]	= {0, 1, 1, 1,},
	[const.Skills.Sword]	= {0, 0, 0, 1,},
	[const.Skills.Dagger]	= {0, 0, 0, 0,},
	[const.Skills.Axe]		= {0, 0, 0, 0,},
	[const.Skills.Spear]	= {0, 0, 0, 1,},
	[const.Skills.Bow]		= {0, 0, 0, 0,},
	[const.Skills.Mace]		= {0, 0, 0, 0,},
	[const.Skills.Blaster]	= {0, 0, 0, 0,},
	[const.Skills.Unarmed]	= {0, 0, 0, 0,},
	
}
newWeaponSkillACBonuses =
{
	[const.Skills.Staff]	= {1, 1, 2, 2,},
	[const.Skills.Sword]	= {0, 0, 0, 1,},
	[const.Skills.Dagger]	= {0, 0, 0, 0,},
	[const.Skills.Axe]		= {0, 0, 0, 0,},
	[const.Skills.Spear]	= {1, 2, 2, 3,},
	[const.Skills.Bow]		= {0, 0, 0, 0,},
	[const.Skills.Mace]		= {0, 0, 0, 0,},
	[const.Skills.Blaster]	= {0, 0, 0, 0,},
	[const.Skills.Unarmed]	= {0, 0, 0, 0,},
}
newWeaponSkillResistanceBonuses =
{
	[const.Skills.Staff]	= {0, 1, 2, 2},
	[const.Skills.Sword]	= {0, 0, 0, 0},
	[const.Skills.Dagger]	= {0, 0, 0, 0},
	[const.Skills.Axe]		= {0, 0, 0, 0},
	[const.Skills.Spear]	= {0, 0, 0, 0},
	[const.Skills.Bow]		= {0, 0, 0, 0},
	[const.Skills.Mace]		= {0, 0, 0, 0},
	[const.Skills.Blaster]	= {0, 0, 0, 0},
	[const.Skills.Unarmed]	= {0, 0, 0, 0,},
	
}
-- armor skill AC bonuses (by rank)
oldArmorSkillACBonuses =
{
	[const.Skills.Shield]	= {1, 1, 2, 2,}, 
	[const.Skills.Leather]	= {1, 1, 2, 2,},
	[const.Skills.Chain]	= {1, 1, 1, 1,},
	[const.Skills.Plate]	= {1, 1, 1, 1,},
	[const.Skills.Dodging]	= {1, 2, 3, 3,},
}
newArmorSkillACBonuses =
{
	[const.Skills.Shield]	= {1, 2, 2, 3,},
	[const.Skills.Leather]	= {1, 1, 2, 2,},
	[const.Skills.Chain]	= {1, 2, 3, 3,},
	[const.Skills.Plate]	= {2, 2, 3, 4,},
	[const.Skills.Dodging]	= {2, 3, 4, 4,},
}
-- armor skill resistance bonuses (by rank)

newArmorSkillResistanceBonuses =
{
	[const.Skills.Leather]	= {1, 2, 3, 4,},
	[const.Skills.Chain]	= {1, 2, 2, 3,},
	[const.Skills.Plate]	= {1, 1, 2, 2,},
	[const.Skills.Shield]	= {1, 2, 3, 4,},
	[const.Skills.Dodging]	= {0, 0, 0, 0,},
}

twoHandedWeaponDamageBonusByMastery = {
	[const.Novice] = 1, 
	[const.Expert] = 2, 
	[const.Master] = 3, 
	[const.GM] = 3 }

classMeleeWeaponSkillDamageBonus ={}
classRangedWeaponSkillAttackBonusMultiplier ={}
classRangedWeaponSkillDamageBonus ={}

-- collects relevant player weapon data

local function getPlayerEquipmentData(player)

	local equipmentData =
	{
		twoHanded = false,
		dualWield = false,
		bow =
		{
			equipped = false,
			item = nil,
			equipStat = nil,
			weapon = false,
			skill = nil,
			rank = nil,
			level = nil,
		},
		main =
		{
			equipped = false,
			item = nil,
			equipStat = nil,
			weapon = false,
			skill = nil,
			rank = nil,
			level = nil,
		},
		extra =
		{
			equipped = false,
			item = nil,
			equipStat = nil,
			weapon = false,
			skill = nil,
			rank = nil,
			level = nil,
		},
		shield =
		{
			equipped = false,
			item = nil,
			skill = nil,
			rank = nil,
			level = nil,
		},
		armor =
		{
			equipped = false,
			item = nil,
			skill = nil,
			rank = nil,
			level = nil,
		},
	}
	
	-- get ranged weapon data
	
	if player.ItemBow ~= 0 then
		
		equipmentData.bow.equipped = true
		
		equipmentData.bow.item = player.Items[player.ItemBow]
		local itemBowTxt = Game.ItemsTxt[equipmentData.bow.item.Number]
		equipmentData.bow.equipStat = itemBowTxt.EquipStat + 1
		equipmentData.bow.skill = itemBowTxt.Skill 
		
		if equipmentData.bow.skill >= 0 then
			equipmentData.bow.level, equipmentData.bow.rank = SplitSkill(player.Skills[equipmentData.bow.skill])
		end
		
		if equipmentData.bow.skill >= 0 and equipmentData.bow.skill <= 7 then
			equipmentData.bow.weapon = true
		end
		
	end
	
	-- get main hand weapon data
			
	if player.ItemMainHand ~= 0 then
		
		equipmentData.main.equipped = true
		
		equipmentData.main.item = player.Items[player.ItemMainHand]
		equipmentData.main.itemTxt = Game.ItemsTxt[equipmentData.main.item.Number]
		equipmentData.main.equipStat = equipmentData.main.itemTxt.EquipStat + 1
		equipmentData.main.skill = equipmentData.main.itemTxt.Skill 
		
		if equipmentData.main.skill >= 0 and equipmentData.main.skill <= 38 then
			equipmentData.main.level, equipmentData.main.rank = SplitSkill(player:GetSkill(equipmentData.main.skill))
		end
		
		if equipmentData.main.skill >= 0 and equipmentData.main.skill <= 7 then
			equipmentData.main.weapon = true
		end
		
	end
	
	-- get extra hand weapon data only if not holding blaster in main hand
			
	if (player.ItemMainHand == 0 or equipmentData.main.skill ~= const.Skills.Blaster) and player.ItemExtraHand ~= 0 then
		
		equipmentData.extra.equipped = true
		
		equipmentData.extra.item = player.Items[player.ItemExtraHand]
		equipmentData.extra.itemTxt = Game.ItemsTxt[equipmentData.extra.item.Number]
		equipmentData.extra.equipStat = equipmentData.extra.itemTxt.EquipStat + 1
		equipmentData.extra.skill = equipmentData.extra.itemTxt.Skill 
		
		if equipmentData.extra.skill >= 0 and equipmentData.extra.skill <= 7 then --for some reason 8 crash
			equipmentData.extra.level, equipmentData.extra.rank = SplitSkill(player:GetSkill(equipmentData.extra.skill))
		end
		
		if equipmentData.extra.skill >= 0 and equipmentData.extra.skill <= 7 then
			equipmentData.extra.weapon = true
		end
		
	end
	
	-- populate other info
	
	if equipmentData.main.weapon and equipmentData.main.equipStat == const.ItemType.Weapon2H then
		equipmentData.twoHanded = true
	elseif equipmentData.main.skill == const.Skills.Spear and not equipmentData.extra.equipped then
		equipmentData.twoHanded = true
	elseif equipmentData.main.weapon and equipmentData.extra.weapon then
		equipmentData.dualWield = true
	end
	
	-- get shield data
	
	if player.ItemExtraHand ~= 0 then
		
		equipmentData.extra.item = player.Items[player.ItemExtraHand]
		local itemExtraHandTxt = Game.ItemsTxt[equipmentData.extra.item.Number]
		equipmentData.extra.equipStat = itemExtraHandTxt.EquipStat + 1
		equipmentData.extra.skill = itemExtraHandTxt.Skill 
		
		if equipmentData.extra.skill == const.Skills.Shield then
			equipmentData.shield.equipped = true
			equipmentData.shield.skill = equipmentData.extra.skill
			equipmentData.shield.level, equipmentData.shield.rank = SplitSkill(player.Skills[equipmentData.shield.skill])
		end
		
	end
	
	-- get armor data
	
	if player.ItemArmor ~= 0 then
		
		equipmentData.armor.equipped = true
		
		equipmentData.armor.item = player.Items[player.ItemArmor]
		local itemArmorTxt = Game.ItemsTxt[equipmentData.armor.item.Number]
		equipmentData.armor.skill = itemArmorTxt.Skill 
		equipmentData.armor.level, equipmentData.armor.rank = SplitSkill(player:GetSkill(equipmentData.armor.skill))
		
	end
	
	
	return equipmentData
	
end




-- calculate stat bonus by skill

function events.CalcStatBonusBySkills(t)

	local equipmentData = getPlayerEquipmentData(t.Player)
	
	-- calculate ranged attack bonus by skill
	
	if t.Stat == const.Stats.RangedAttack then
	
		local bow = equipmentData.bow
	
		if bow.weapon then
			
			local s=SplitSkill(t.Player:GetSkill(const.Skills.Bow))
			-- calculate old bonus
			
			local oldBonus = (oldWeaponSkillAttackBonuses[bow.skill][bow.rank] * s)
			
			-- calculate new bonus
			
			local newBonus = (newWeaponSkillAttackBonuses[bow.skill][bow.rank] * s)
			
			if bow.skill == const.Skills.Bow then
				local rangedWeaponSkillAttackBonusMultiplier = classRangedWeaponSkillAttackBonusMultiplier[t.Player.Class]
				if rangedWeaponSkillAttackBonusMultiplier ~= nil then
					newBonus = newBonus * rangedWeaponSkillAttackBonusMultiplier
				end
			end
			
			-- recalculate bonus
			t.Result = t.Result - oldBonus + newBonus
			
		end
		
	-- calculate ranged damage bonus by skill
	
	elseif t.Stat == const.Stats.RangedDamageBase then
	
		local bow = equipmentData.bow
	
		if bow.weapon then
			local s=SplitSkill(t.Player:GetSkill(const.Skills.Bow))
			-- calculate old bonus
			
			local oldBonus = oldWeaponSkillDamageBonuses[bow.skill][bow.rank] * s
			
			-- calculate new bonus
			local might=t.Player:GetMight()
			if might<=21 then
				mightBonus=(might-1)/2-6
			else
				mightBonus=math.floor(might/5)
			end
			
			local newBonus = newWeaponSkillDamageBonuses[bow.skill][bow.rank] * s + mightBonus
			
			-- recalculate bonus
			
			t.Result = t.Result - oldBonus + newBonus
			
		end
		
	-- calculate melee attack bonus by skill
	
	elseif t.Stat == const.Stats.MeleeAttack then
	
		local main = equipmentData.main
		local extra = equipmentData.extra
		
		if main.weapon then
			
			-- single wield
			if not equipmentData.dualWield then
				
				-- calculate old bonus
				
				local oldBonus = (oldWeaponSkillAttackBonuses[main.skill][main.rank] * main.level)
				
				-- calculate new bonus
				
				local newBonus = (newWeaponSkillAttackBonuses[main.skill][main.rank] * main.level)
				
				-- class bonus
			
				if main.skill == const.Skills.Blaster and blastersUseClassMultipliers then
					local rangedWeaponSkillAttackBonusMultiplier = classRangedWeaponSkillAttackBonusMultiplier[t.Player.Class]
					if rangedWeaponSkillAttackBonusMultiplier ~= nil then
						newBonus = newBonus * rangedWeaponSkillAttackBonusMultiplier
					end
				end
				
				-- recalculate bonus
				
				t.Result = t.Result - oldBonus + newBonus
				
			-- dual wield
			else
						
				-- calculate effective skill levels
				
				local mainEffectiveSkillLevel
				local extraEffectiveSkillLevel
				
				if main.skill == extra.skill then
					mainEffectiveSkillLevel = main.level
					extraEffectiveSkillLevel = extra.level
				else
					-- effective skill level is not divided by sqrt(2) anymore
					mainEffectiveSkillLevel = main.level
					extraEffectiveSkillLevel = extra.level
				end
			
				-- calculate old bonus
				
				local oldBonus = (oldWeaponSkillAttackBonuses[extra.skill][extra.rank] * main.level)
				
				-- calculate new bonus
				
				local newBonus = ((newWeaponSkillAttackBonuses[main.skill][main.rank] * mainEffectiveSkillLevel) + (newWeaponSkillAttackBonuses[extra.skill][extra.rank] * extraEffectiveSkillLevel))
			
				-- recalculate bonus
				
				t.Result = t.Result - oldBonus + newBonus
					
			end
		end
		
		local staff=t.Player:GetSkill(const.Skills.Staff)
		local s,m = SplitSkill(staff)
		if (m>0 and not main.weapon and not extra.weapon) or (main.skill==const.Skills.Staff and m==4) then
			local punch=t.Player:GetSkill(const.Skills.Unarmed)
			local s,m = SplitSkill(punch)
			if s>0 then
				t.Result=t.Result-oldWeaponSkillAttackBonuses[const.Skills.Unarmed][m]*s
				t.Result=t.Result+newWeaponSkillAttackBonuses[const.Skills.Unarmed][m]*s
			end
		end
		
	-- calculate melee damage bonus by skill
	
	elseif t.Stat == const.Stats.MeleeDamageBase then
	
		local main = equipmentData.main
		local extra = equipmentData.extra
		local shield = equipmentData.shield
		if main.weapon then
			if shield.equipped then
				if classMeleeWeaponSkillDamageBonus[t.Player.Class] ~= nil then
					t.Result = t.Result + (classMeleeWeaponSkillDamageBonus[t.Player.Class] * shield.level)
				end
			end
			-- single wield
			
			if not equipmentData.dualWield then
				
				-- subtract old bonus
				
				if
					(main.skill == const.Skills.Axe and main.rank >= const.Master)
					or
					(main.skill == const.Skills.Spear and main.rank >= const.Master)
					or
					(main.skill == const.Skills.Mace and main.rank >= const.Expert)
				then
					t.Result = t.Result - main.level
				end
				
				-- add new bonus for main weapon
				
				t.Result = t.Result + newWeaponSkillDamageBonuses[main.skill][main.rank] * main.level
				if main.skill == const.Skills.Staff then
					local staff=t.Player:GetSkill(const.Skills.Staff)
					local s,m = SplitSkill(staff)
					if m==4 then
						local punch=t.Player:GetSkill(const.Skills.Unarmed)
						local s,m = SplitSkill(punch)
						if m>0 then
							t.Result=t.Result-oldWeaponSkillDamageBonuses[const.Skills.Unarmed][m]*s
							t.Result=t.Result+newWeaponSkillDamageBonuses[const.Skills.Unarmed][m]*s
						end
					end
				end
				-- add class bonus for main hand weapon
				
				if classMeleeWeaponSkillDamageBonus[t.Player.Class] ~= nil then
					t.Result = t.Result + (classMeleeWeaponSkillDamageBonus[t.Player.Class] * main.level)
				end
				
				-- add bonus for two handed weapon
				
				if equipmentData.twoHanded and equipmentData.main.skill ~= const.Skills.Staff then
					t.Result = t.Result + twoHandedWeaponDamageBonusByMastery[main.rank] * main.level
				end
				
			-- dual wield
			
			else
				-- calculate effective skill levels
				
				local mainEffectiveSkillLevel
				local extraEffectiveSkillLevel
				
				if main.skill == extra.skill then
					mainEffectiveSkillLevel = main.level
					extraEffectiveSkillLevel = extra.level
				else
					-- effective skill level is not divided by sqrt(2) anymore
					mainEffectiveSkillLevel = main.level
					extraEffectiveSkillLevel = extra.level
				end
			
				-- subtract old bonus
				
				if
					(main.skill == const.Skills.Axe and main.rank >= const.Master)
					or
					(main.skill == const.Skills.Spear and main.rank >= const.Master)
					or
					(main.skill == const.Skills.Mace and main.rank >= const.Expert)
				then
					t.Result = t.Result - main.level
				end
				local classMeleeDamageBonus = classMeleeWeaponSkillDamageBonus[t.Player.Class] or 0
				
				-- add new bonus for main weapon
				-- removing the class bonus from main hand if main hand sword or dagger
				if main.skill == const.Skills.Sword then
					t.Result = t.Result + (newWeaponSkillDamageBonuses[main.skill][main.rank] * mainEffectiveSkillLevel)-(classMeleeDamageBonus*mainEffectiveSkillLevel)
				elseif main.skill == const.Skills.Dagger then
					t.Result = t.Result + (newWeaponSkillDamageBonuses[main.skill][main.rank] * mainEffectiveSkillLevel)-(classMeleeDamageBonus*mainEffectiveSkillLevel)
				else
					t.Result = t.Result + (newWeaponSkillDamageBonuses[main.skill][main.rank] * mainEffectiveSkillLevel)
				end
				
				-- add new bonus for extra weapon if any
				
				if extra.weapon then
					t.Result = t.Result + math.round((newWeaponSkillDamageBonuses[extra.skill][extra.rank]+classMeleeDamageBonus) * (extraEffectiveSkillLevel))
				end
				
				-- add class bonus for main hand weapon
				
				if classMeleeWeaponSkillDamageBonus[t.Player.Class] ~= nil then
					t.Result = t.Result + (classMeleeDamageBonus * mainEffectiveSkillLevel)
				end
			
			end
		elseif not main.weapon and not extra.weapon then
			local punch=t.Player:GetSkill(const.Skills.Unarmed)
			local s,m = SplitSkill(punch)
			if m>0 then
				t.Result=t.Result-oldWeaponSkillDamageBonuses[const.Skills.Unarmed][m]*s
				t.Result=t.Result+newWeaponSkillDamageBonuses[const.Skills.Unarmed][m]*s		
			end
		end
		
	-- calculate AC bonus by skill
	
	elseif t.Stat == const.Stats.ArmorClass then
	
		-- AC bonus from weapon skill
		
		main = equipmentData.main
		
		if main.weapon then
		
			if main.skill == const.Skills.Staff then
			
				-- subtract old bonus
				
				if main.skill == const.Skills.Staff and main.rank >= const.Expert then
					t.Result = t.Result - main.level
				end
				
				-- add new bonus
				
				t.Result = t.Result + (newWeaponSkillACBonuses[const.Skills.Staff][main.rank] * main.level)
				
			-- spear grant AC again
			
			elseif main.skill == const.Skills.Spear then
			
				-- subtract old bonus
				
				if main.skill == const.Skills.Spear and main.rank >= const.Expert then
					t.Result = t.Result - main.level
				end
				
			
				
				-- add new bonus
				t.Result = t.Result + (newWeaponSkillACBonuses[const.Skills.Spear][main.rank] * main.level)
				--]]
				
			end
			
		end
		
		-- AC bonus from shield skill
		
		local shield = equipmentData.shield
		
		if shield.equipped then
		
			-- subtract old bonus
			local reduction=oldArmorSkillACBonuses[const.Skills.Shield][shield.rank] * shield.level
			t.Result = t.Result - reduction
			
			-- add new bonus
			
			t.Result = t.Result + (newArmorSkillACBonuses[shield.skill][shield.rank] * shield.level )
			
		end
		
		-- AC bonus from armor skill
		
		local armor = equipmentData.armor
		local dodge=t.Player:GetSkill(const.Skills.Dodging)
		if armor.equipped then
		
			-- subtract old bonus
			
			t.Result = t.Result - oldArmorSkillACBonuses[armor.skill][armor.rank]*armor.level
			
			-- add new bonus
			
			t.Result = t.Result + (newArmorSkillACBonuses[armor.skill][armor.rank] * armor.level)
			
			--check for dodge
			if armor.skill==const.Skills.Leather then
				if dodge>256 then
					s,m=SplitSkill(dodge)
					t.Result = t.Result - oldArmorSkillACBonuses[const.Skills.Dodging][m] * s
					t.Result = t.Result + newArmorSkillACBonuses[const.Skills.Dodging][m] * s
				end		
			end
		else
			s,m=SplitSkill(dodge)
			--calculate dodge
			if m>0 then
				t.Result = t.Result - oldArmorSkillACBonuses[const.Skills.Dodging][m] * s
				t.Result = t.Result + newArmorSkillACBonuses[const.Skills.Dodging][m] * s
			end
		end
		
	end
	
end


function events.CalcStatBonusByItems(t)

	local equipmentData = getPlayerEquipmentData(t.Player)
	
	local main = equipmentData.main
	local extra = equipmentData.extra
	local armor = equipmentData.armor
	local shield = equipmentData.shield
	
	-- calculate resistance
	
	if
		t.Stat == const.Stats.FireResistance
		or
		t.Stat == const.Stats.AirResistance
		or
		t.Stat == const.Stats.WaterResistance
		or
		t.Stat == const.Stats.EarthResistance
		or
		t.Stat == const.Stats.MindResistance
		or
		t.Stat == const.Stats.BodyResistance
	then
	
		-- resistance bonus from weapon
		if main.equipped and main.weapon then
			t.Result = t.Result + (newWeaponSkillResistanceBonuses[main.skill][main.rank] * main.level)
		end
		
		if extra.equipped and extra.weapon then
			t.Result = t.Result + (newWeaponSkillResistanceBonuses[extra.skill][extra.rank] * extra.level)
		end

		-- resistance bonus from armor
								
		if armor.equipped then
			t.Result = t.Result + (newArmorSkillResistanceBonuses[armor.skill][armor.rank] * armor.level)
		end	
		if shield.equipped then
			t.Result = t.Result + (newArmorSkillResistanceBonuses[shield.skill][shield.rank] * shield.level)
		end
	end
	
end

-- calculate new and old recovery difference
local function getWeaponRecoveryCorrection(equipmentData1, equipmentData2, player)

	local correction = 0
	
	-- single wield
	if equipmentData2 == nil then
	
		-- calculate old and new recovery bonuses
	
		local oldRecoveryBonus = 0
		local newRecoveryBonus = 0
	
		-- base bonuses
		
		oldRecoveryBonus = oldRecoveryBonus + oldWeaponBaseRecoveryBonuses[equipmentData1.skill]
		newRecoveryBonus = newRecoveryBonus + newWeaponBaseRecoveryBonuses[equipmentData1.skill]
		
		-- skill bonuses
		
		if equipmentData1.rank >= const.Expert then
			oldRecoveryBonus = oldRecoveryBonus + (oldWeaponSkillRecoveryBonuses[equipmentData1.skill][equipmentData1.rank] * equipmentData1.level)
		end
		newRecoveryBonus = newRecoveryBonus + (newWeaponSkillRecoveryBonuses[equipmentData1.skill][equipmentData1.rank] * equipmentData1.level)
		--add unarmed bonus
		if equipmentData1.skill==const.Skills.Staff and equipmentData1.rank==4 then
			local unarmed=player:GetSkill(const.Skills.Unarmed)
			s,m=SplitSkill(unarmed)	
			if s>1 then
				newRecoveryBonus = newRecoveryBonus + newWeaponSkillRecoveryBonuses[const.Skills.Unarmed][m]*s
			end
		end
		-- replace old with new bonus

		correction = correction 
			+ oldRecoveryBonus
			- newRecoveryBonus
		
	-- dual wield
	else
	
		-- calculate effective skill levels
		
		local meleeWeapon1EffectiveSkillLevel
		local meleeWeapon2EffectiveSkillLevel
		
		if equipmentData1.skill == equipmentData2.skill then
			meleeWeapon1EffectiveSkillLevel = equipmentData1.level
			meleeWeapon2EffectiveSkillLevel = equipmentData2.level
		else
			-- effective skill level is not divided by sqrt(2) anymore
			meleeWeapon1EffectiveSkillLevel = equipmentData1.level
			meleeWeapon2EffectiveSkillLevel = equipmentData2.level
		end
	
		-- calculate old and new recovery bonuses
	
		local oldRecoveryBonus1 = 0
		local newRecoveryBonus1 = 0
		local newRecoveryBonus2 = 0
	
		-- weapon 1
		
		-- base bonuses
		
		oldRecoveryBonus1 = oldRecoveryBonus1 + oldWeaponBaseRecoveryBonuses[equipmentData1.skill]
		newRecoveryBonus1 = newRecoveryBonus1 + newWeaponBaseRecoveryBonuses[equipmentData1.skill]
		newRecoveryBonus2 = newRecoveryBonus2 + newWeaponBaseRecoveryBonuses[equipmentData2.skill]
		
		-- swiftness
		
		if equipmentData1.item.Bonus2 == 59 then
			oldRecoveryBonus1 = oldRecoveryBonus1 + 20
			newRecoveryBonus1 = newRecoveryBonus1 + 20
		end
		if equipmentData2.item.Bonus2 == 59 then
			newRecoveryBonus2 = newRecoveryBonus2 + 20
		end
		
		-- skill bonuses
		
		if equipmentData1.rank >= const.Expert then
			oldRecoveryBonus1 = oldRecoveryBonus1 + (oldWeaponSkillRecoveryBonuses[equipmentData1.skill][equipmentData1.rank] * equipmentData1.level)
		end
		newRecoveryBonus1 = (newRecoveryBonus1 + (newWeaponSkillRecoveryBonuses[equipmentData1.skill][equipmentData1.rank] * meleeWeapon1EffectiveSkillLevel))
		newRecoveryBonus2 = (newRecoveryBonus2 + (newWeaponSkillRecoveryBonuses[equipmentData2.skill][equipmentData2.rank] * meleeWeapon2EffectiveSkillLevel))
		
		-- replace old with new bonus
		
		correction = correction
			+ oldRecoveryBonus1
			- (newRecoveryBonus1 + newRecoveryBonus2)
		
	end
	
	return correction
	
end






meleeRecoveryCap=30


-- corrects attack delay

function events.GetAttackDelay(t)

	local equipmentData = getPlayerEquipmentData(t.Player)
	
	-- weapon
	
	if t.Ranged then
	
		local bow = equipmentData.bow
	
		if bow.weapon then
		
			t.Result = t.Result + getWeaponRecoveryCorrection(bow, nil, t.Player)
			
		end
		
	else
	
		local main = equipmentData.main
		local extra = equipmentData.extra
		
		if main.weapon then
			
			-- single wield
			if not equipmentData.dualWield then
				
				t.Result = t.Result + getWeaponRecoveryCorrection(main, nil, t.Player)
				
			-- dual wield
			else
			
				-- no axe and no sword in main hand and sword in extra hand = extra hand skill defines recovery
				if main.skill ~= const.Skills.Axe and main.skill ~= const.Skills.Sword and extra.skill == const.Skills.Sword then
					t.Result = t.Result + getWeaponRecoveryCorrection(extra, main, t.Player)
				-- everything else = main hand skill defines recovery
				else
					t.Result = t.Result + getWeaponRecoveryCorrection(main, extra, t.Player)
				end
				
			end
		else
			local unarmed=t.Player:GetSkill(const.Skills.Unarmed)
			s,m=SplitSkill(unarmed)	
			if s>1 then
				t.Result = t.Result - newWeaponSkillRecoveryBonuses[const.Skills.Unarmed][m]*s
			end		
		end
		
	end
	
	-- turn recovery time into a multiplier rather than divisor-
	
	speed=t.Player:GetSpeed()
	if speed>=21 then
		bonus=math.floor(speed/5)
	else
		bonus=(speed-13)/2
	end
	
	recoveryBonus = 100 - t.Result + bonus
	correctedRecoveryTime = math.floor(100 / (1 + recoveryBonus / 100))
	
	t.Result = correctedRecoveryTime
	-- cap melee recovery
	
	if not t.Ranged then
		t.Result = math.max(meleeRecoveryCap, t.Result)
	end
	
end

function calculateAngle(vector1, vector2)
    local dotProduct = vector1.x * vector2.x + vector1.y * vector2.y + vector1.z * vector2.z
    local magnitude1 = math.sqrt(vector1.x^2 + vector1.y^2 + vector1.z^2)
    local magnitude2 = math.sqrt(vector2.x^2 + vector2.y^2 + vector2.z^2)
    
    local cosineTheta = dotProduct / (magnitude1 * magnitude2)
    local angleRadians = math.acos(cosineTheta)
    local angleDegrees = math.deg(angleRadians)
    
    return angleDegrees
end

homingDegree=0.5
local function navigateMissile(object)

	-- exclude some special non targeting spells
	if
		-- Meteor Shower
		object.SpellType == 9
		or
		-- Sparks
		object.SpellType == 15
		or
		-- Starburst
		object.SpellType == 22
		or
		-- Poison Spray
		object.SpellType == 24
		or
		-- Ice Blast
		object.SpellType == 32
		or
		-- Shrapmetal
		object.SpellType == 93
	then
		return
	end
	-- object parameters
	local ownerKind = bit.band(object.Owner, 7)
	local targetKind = bit.band(object.Target, 7)
	local targetIndex = bit.rshift(object.Target, 3)
	
	if targetIndex > Map.Monsters.high then
		return
	end
	
	-- current position
	local currentPosition = {["X"] = object.X, ["Y"] = object.Y, ["Z"] = object.Z, }
	
	-- process only missiles between party and monster
	-- target position
	local targetPosition
	if ownerKind == const.ObjectRefKind.Party and targetKind == const.ObjectRefKind.Monster then
		local mapMonster = Map.Monsters[targetIndex]
		-- target only alive monster
		if mapMonster.HitPoints > 0 then
			targetPosition = {["X"] = mapMonster.X, ["Y"] = mapMonster.Y, ["Z"] = mapMonster.Z + mapMonster.BodyHeight * 0.75, }
		else
			return
		end
	-- assume all objects not owned by party and without target are targetting party
	-- this creates issues with cosmetic projectiles like CI Obelisk Arena Paralyze and Gharik/Baa lava fireballs
	elseif ownerKind == const.ObjectRefKind.Monster or ownerKind == 2 then
		local delta_x = Party.X - object.X
		local delta_y = Party.Y - object.Y
		local delta_z = Party.Z - object.Z
		angleDegrees = calculateAngle({ x = delta_x, y = delta_y, z = 0 }, { x = object.VelocityX, y = object.VelocityY, z = 0 })
		if angleDegrees<homingDegree then
			targetPosition = {["X"] = Party.X, ["Y"] = Party.Y, ["Z"] = Party.Z + 120, }
		else
			return
		end
	else
		-- ignore other missiles targetting
		return
	end
	
	-- speed
	local speed = math.sqrt(object.VelocityX * object.VelocityX + object.VelocityY * object.VelocityY + object.VelocityZ * object.VelocityZ)
	
	-- process only objects with non zero speed
	if speed == 0 then
		return
	end
	
	-- direction
	local direction = {["X"] = targetPosition.X - currentPosition.X, ["Y"] = targetPosition.Y - currentPosition.Y, ["Z"] = targetPosition.Z - currentPosition.Z, }
	-- directionLength
	local directionLength = math.sqrt(direction.X * direction.X + direction.Y * direction.Y + direction.Z * direction.Z)
	
	-- normalization koefficient
	local koefficient = speed / directionLength
	
	-- new velocity
	local newVelocity = {["X"] = koefficient * direction.X, ["Y"] = koefficient * direction.Y, ["Z"] = koefficient * direction.Z, }
	
	-- set new velocity
	object.VelocityX = newVelocity.X
	object.VelocityY = newVelocity.Y
	object.VelocityZ = newVelocity.Z
	
end

-- game tick related functionality
local homingProjectiles = true
function events.Tick()

	-- navigateMissiles
	if homingProjectiles then
		for objectIndex = 0,Map.Objects.high do
			local object =  Map.Objects[objectIndex]
			navigateMissile(object)
		end
	end
end

--BOW DAMAGE SKILL BONUS
function events.ModifyItemDamage(t)
    local s, m = SplitSkill(t.Player:GetSkill(const.Skills.Bow))
    if t.Item:T().EquipStat == const.ItemType.Missile - 1 then
		local dmgBonus=newWeaponSkillDamageBonuses[const.Skills.Bow][m] - oldWeaponSkillDamageBonuses[const.Skills.Bow][m]
		local might=t.Player:GetMight()
		if might<=21 then
			mightBonus=(might-1)/2-6
		else
			mightBonus=math.floor(might/5)
		end
        t.Result = t.Result + mightBonus +s * dmgBonus
    end
end
----------------------
--ARMSMASTER CODE, so far it's 2 damage at master and 4 at GM
----------------------
function events.CalcStatBonusBySkills(t)
	if t.Stat == const.Stats.MeleeDamageBase then
		if t.Player:GetActiveItem(1) then
			local s, m = SplitSkill(t.Player:GetSkill(const.Skills.Armsmaster))
			if m == 3 then
				t.Result=t.Result+s
			elseif m ==4 then
				t.Result=t.Result+s*2
			end
		end
	end
end


------------------------
--AUTO GENERATING TOOLTIPS
------------------------
function events.GameInitialized2()
	for i=0,33 do
		if i<=7 or i==33 then
			attack=false
			recovery=false
			damage=false
			ac=false
			res=false
			baseString=string.format("%s\n------------------------------------------------------------\n         ",Game.SkillDescriptions[i])
			for v=1,4 do
				if newWeaponSkillAttackBonuses[i][v]~=0 then
					attack=true
				end
				if newWeaponSkillRecoveryBonuses[i][v]~=0 then
					recovery=true
				end
				if newWeaponSkillDamageBonuses[i][v]~=0 then
					damage=true
				end
				if newWeaponSkillACBonuses[i][v]~=0 then
					ac=true
				end
				if newWeaponSkillResistanceBonuses[i][v]~=0 then
					res=true
				end
			end
			
			--Novice
			normal=""
			if attack then
				baseString=string.format("%s Attack|",baseString)
				normal=string.format("%s      %s|",normal,newWeaponSkillAttackBonuses[i][1])
			end
			if recovery then
				normal=string.format("%s      %s|",normal,newWeaponSkillRecoveryBonuses[i][1])
				baseString=string.format("%s Speed|",baseString)
			end
			if damage then
				normal=string.format("%s     %s|",normal,newWeaponSkillDamageBonuses[i][1])
				baseString=string.format("%s Dmg|",baseString)
			end
			if ac then
				normal=string.format("%s  %s|",normal,newWeaponSkillACBonuses[i][1])
				baseString=string.format("%s AC|",baseString)
			end
			if res then
				normal=string.format("%s    %s",normal,newWeaponSkillResistanceBonuses[i][1])
				baseString=string.format("%s Res",baseString)
			end
			Game.SkillDesNormal[i]=normal
			
			--Expert
			expert=""
			if attack then
				expert=string.format("%s      %s|",expert,newWeaponSkillAttackBonuses[i][2])
			end
			if recovery then
				expert=string.format("%s      %s|",expert,newWeaponSkillRecoveryBonuses[i][2])
			end
			if damage then
				expert=string.format("%s     %s|",expert,newWeaponSkillDamageBonuses[i][2])
			end
			if ac then
				expert=string.format("%s  %s|",expert,newWeaponSkillACBonuses[i][2])
			end
			if res then
				expert=string.format("%s    %s",expert,newWeaponSkillResistanceBonuses[i][2])
			end
			Game.SkillDesExpert[i]=expert
			--Master
			master=""
			if attack then
				master=string.format("%s      %s|",master,newWeaponSkillAttackBonuses[i][3])
			end
			if recovery then
				master=string.format("%s      %s|",master,newWeaponSkillRecoveryBonuses[i][3])
			end
			if damage then
				master=string.format("%s     %s|",master,newWeaponSkillDamageBonuses[i][3])
			end
			if ac then
				master=string.format("%s  %s|",master,newWeaponSkillACBonuses[i][3])
			end
			if res then
				master=string.format("%s    %s",master,newWeaponSkillResistanceBonuses[i][3])
			end
			Game.SkillDesMaster[i]=master
			--GrandMaster
			gm=""
			if attack then
				gm=string.format("%s      %s|",gm,newWeaponSkillAttackBonuses[i][4])
			end
			if recovery then
				gm=string.format("%s      %s|",gm,newWeaponSkillRecoveryBonuses[i][4])
			end
			if damage then
				gm=string.format("%s     %s|",gm,newWeaponSkillDamageBonuses[i][4])
			end
			if ac then
				gm=string.format("%s  %s|",gm,newWeaponSkillACBonuses[i][4])
			end
			if res then
				gm=string.format("%s    %s",gm,newWeaponSkillResistanceBonuses[i][4])
			end
			Game.SkillDesGM[i]=gm
			Game.SkillDescriptions[i]=string.format("%s",baseString)
		end
	end
	

--now do same for armors
	for i=8,32 do
		if i<12 or i==32 then
			recoveryPen=false
			ac=false
			res=false
			baseString=string.format("%s\n------------------------------------------------------------\n         ",Game.SkillDescriptions[i])
			for v=1,4 do
				if newArmorSkillACBonuses[i][v]~=0 then
					ac=true
				end
				if newArmorSkillResistanceBonuses[i][v]~=0 then
					res=true
				end
			end
			
			--Novice
			normal=""
			if ac then
				normal=string.format("%s  %s|",normal,newArmorSkillACBonuses[i][1])
				baseString=string.format("%s AC|",baseString)
			end
			if res then
				normal=string.format("%s    %s",normal,newArmorSkillResistanceBonuses[i][1])
				baseString=string.format("%s Res",baseString)
			end
			Game.SkillDesNormal[i]=normal
			
			--Expert
			expert=""
			if ac then
				expert=string.format("%s  %s|",expert,newArmorSkillACBonuses[i][2])
			end
			if res then
				expert=string.format("%s    %s",expert,newArmorSkillResistanceBonuses[i][2])
			end
			Game.SkillDesExpert[i]=expert
			--Master
			master=""
			if ac then
				master=string.format("%s  %s|",master,newArmorSkillACBonuses[i][3])
			end
			if res then
				master=string.format("%s    %s",master,newArmorSkillResistanceBonuses[i][3])
			end
			Game.SkillDesMaster[i]=master
			--GrandMaster
			gm=""
			if ac then
				gm=string.format("%s  %s|",gm,newArmorSkillACBonuses[i][4])
			end
			if res then
				gm=string.format("%s    %s",gm,newArmorSkillResistanceBonuses[i][4])
			end
			Game.SkillDesGM[i]=gm
			Game.SkillDescriptions[i]=string.format("%s",baseString)
		end
	end
	
	--adjust tooltips with special effects
	Game.SkillDesGM[const.Skills.Axe]=string.format("%s 1%% to halve AC",Game.SkillDesGM[const.Skills.Axe])
	Game.SkillDesMaster[const.Skills.Bow]=string.format("%s 2 arrows",Game.SkillDesMaster[const.Skills.Bow])
	Game.SkillDesExpert[const.Skills.Dagger]=string.format("%s can dual wield",Game.SkillDesExpert[const.Skills.Dagger])
	Game.SkillDesMaster[const.Skills.Dagger]=string.format("%s 2.5+0.5 crit%%/skill",Game.SkillDesMaster[const.Skills.Dagger])
	Game.SkillDesMaster[const.Skills.Mace]=string.format("%s 1%% to stun",Game.SkillDesMaster[const.Skills.Mace])
	Game.SkillDesGM[const.Skills.Mace]=string.format("%s 1%% to paralyze",Game.SkillDesGM[const.Skills.Mace])
	Game.SkillDesMaster[const.Skills.Spear]=string.format("%s can hold with 1 hand",Game.SkillDesMaster[const.Skills.Spear])
	Game.SkillDesMaster[const.Skills.Staff]=string.format("%s and 1%% to stun",Game.SkillDesMaster[const.Skills.Staff])
	Game.SkillDesGM[const.Skills.Staff]=string.format("%s usable with Unarm.",Game.SkillDesGM[const.Skills.Staff])
	Game.SkillDesMaster[const.Skills.Sword]=string.format("%s can dual wield",Game.SkillDesMaster[const.Skills.Sword])
	Game.SkillDesExpert[const.Skills.Leather]=string.format("%s recovery penalty eliminated",Game.SkillDesExpert[const.Skills.Leather])
	Game.SkillDesExpert[const.Skills.Chain]=string.format("%s recovery penalty halved",Game.SkillDesExpert[const.Skills.Chain])
	Game.SkillDesMaster[const.Skills.Chain]=string.format("%s recovery penalty eliminated",Game.SkillDesMaster[const.Skills.Chain])
	Game.SkillDesExpert[const.Skills.Plate]=string.format("%s rec. pen. halved, 5%% cover",Game.SkillDesExpert[const.Skills.Plate])
	Game.SkillDesMaster[const.Skills.Plate]=string.format("%s 10%% cover",Game.SkillDesMaster[const.Skills.Plate])
	Game.SkillDesGM[const.Skills.Plate]=string.format("%s rec. pen. elim., 15%% cover",Game.SkillDesGM[const.Skills.Plate])
	Game.SkillDesExpert[const.Skills.Shield]=string.format("%s recovery penalty eliminated",Game.SkillDesExpert[const.Skills.Shield])
	Game.SkillDesGM[const.Skills.Shield]=string.format("%s halve dmg from phys projectiles\nGrants 15%% magic cover",Game.SkillDesGM[const.Skills.Shield])
	Game.SkillDesMaster[const.Skills.Armsmaster]=string.format("Skills adds 2 damage to all melee weapons")
	Game.SkillDesGM[const.Skills.Dodging]=string.format("%s usable with Leather Armor",Game.SkillDesGM[const.Skills.Dodging])
	Game.SkillDesGM[const.Skills.Unarmed]=string.format("%s 5+0.5%% dodge chance",Game.SkillDesGM[const.Skills.Unarmed])
end

--REMOVE PLATE/MAIL physical damage reduction

function events.CalcDamageToPlayer(t)
	if t.DamageKind==const.Damage.Phys then
		if Party[0]:GetActiveItem(3) then
			local n=Party[0]:GetActiveItem(3).Number
			if Game.ItemsTxt[n].Skill==const.Skills.Plate then
				s,m=SplitSkill(t.Player.Skills[const.Skills.Plate])
				if m>=3 then
					t.Result=t.Result*2
				end
			elseif Game.ItemsTxt[n].Skill==const.Skills.Chain then
				s,m=SplitSkill(t.Player.Skills[const.Skills.Chain])
				if m>=4 then
					t.Result=t.Result/0.65
				end		
			end
		end
	end
end

---------------------------------------
-- MMMERGE ONLINE SOLO PLAYER SKILLS --
---------------------------------------

--get distance function
function getDistance(x,y,z)
	distance=((Party.X-x)^2+(Party.Y-y)^2+(Party.Z-z)^2)^0.5
	return distance
end
-------------------------------------------------
--charge skill (usable only in single player)
-------------------------------------------------
function events.KeyDown(t)
	if Party.High~=0 then return end --only in single player
	if Game.CurrentScreen==21 then return end
	if t.Key == chargeKey then
		local class=Party[0].Class
		if class>=16 and class<=19 then
			if vars.chargeCooldown==0 then
				if Mouse:GetTarget().Kind==3 then
					index=Mouse:GetTarget().Index
					local mon=Map.Monsters[index]
					local chargeX=mon.X
					local chargeY=mon.Y
					local chargeZ=mon.Z
					local dist=getDistance(chargeX,chargeY,chargeZ)
					if dist<3000 and dist>500 then
						charge=true
						ticks=20
						--get distance to cover
						distanceX=Party.X-chargeX
						distanceY=Party.Y-chargeY
						distanceZ=Party.Z-chargeZ
						vars.chargeCooldown=25
						evt.FaceExpression{Player = "All", Frame = 46}
						Game.ShowStatusText(string.format("%s casts Charge stunning the enemy",Party[0].Name))
						mon.SpellBuffs[6].Skill=4
						if class==16 then
							duration=const.Minute*1.5
							mon.SpellBuffs[6].ExpireTime=Game.Time+duration
						elseif class==17 then
							duration=const.Minute*2
							mon.SpellBuffs[6].ExpireTime=Game.Time+duration
						else
							duration=const.Minute*2.5
							mon.SpellBuffs[6].ExpireTime=Game.Time+duration
						end
						local vel=mon.Velocity
						mon.Velocity=0
						mon.Active = false
						Sleep(duration)
						mon.Velocity=vel
					else
						Game.ShowStatusText("Out of range")
					end
				end
			else
				Game.ShowStatusText(string.format("Charge has %s seconds of cooldown",vars.chargeCooldown))
			end
		end
	end
end

--
function events.LoadMap(wasInGame)
	checkCharge=180
	vars.chargeCooldown=vars.chargeCooldown or 25
	lastCharge=vars.chargeCooldown
	charge=false
	Timer(chargeTimer, const.Minute/2) 
end
function chargeTimer() 
		if vars.chargeCooldown>0 then
			vars.chargeCooldown=vars.chargeCooldown-1
		end
	end
--movement
function events.Tick()
	if Multiplayer and Multiplayer.client_monsters()[0] and checkCharge and checkCharge>=0 then
		--check for charge working
		checkCharge=checkCharge-1
	end
	if checkCharge==0 and lastCharge==vars.chargeCooldown then
		Timer(chargeTimer, const.Minute/2) 
	end
	if charge~=true then return end --return if charge event is off
	--get closer to Monster
	Party.X=Party.X-distanceX/22
	Party.Y=Party.Y-distanceY/22
	Party.Z=Party.Z-distanceZ/22
	ticks=ticks-1
	if ticks==0 then
		charge=false
	end
end

--------------------------------------
--HEALTH potion drink hotkey only in SOLO
--------------------------------------
function events.KeyDown(t)
	if Party.High~=0 then return end --only in single player
	if Game.CurrentScreen==21 then return end
	if t.Key == healthPotionKey then
		if vars.healthPotionCooldown==0 then
			local heal=false
			local bonus=0
			for i=1, Party[0].Items.High do
				if Party[0].Items[i].Number==222 and Party[0].Items[i].Bonus>=bonus then
					heal=true
					index=i
					bonus=Party[0].Items[i].Bonus
				end
			end
			if heal then
				Party[0].Items[index].Number=0
				local healAmount=math.round(bonus^1.4)+10
				evt.Add("HP",healAmount)
				vars.healthPotionCooldown=15
				Game.ShowStatusText(string.format("Health Potion heals for %s hit points",healAmount))
			end
		else
			Game.ShowStatusText(string.format("Health Potion has %s seconds of cooldown remaining",vars.healthPotionCooldown))
		end
	end
end

function events.LoadMap(wasInGame)
	vars.healthPotionCooldown=vars.healthPotionCooldown or 15
	charge=false
	local function chargeTimer() 
		if vars.healthPotionCooldown>0 then
			vars.healthPotionCooldown=vars.healthPotionCooldown-1
		end
	end
	Timer(chargeTimer, const.Minute/2) 
end


--------------------------------------
--MANA potion drink hotkey only in SOLO
--------------------------------------
function events.KeyDown(t)
	if Party.High~=0 then return end --only in single player
	if Game.CurrentScreen==21 then return end
	if t.Key == manaPotionKey then
		if vars.manaPotionCooldown==0 then
			local heal=false
			local bonus=0
			for i=1, Party[0].Items.High do
				if Party[0].Items[i].Number==223 and Party[0].Items[i].Bonus>=bonus then
					heal=true
					index=i
					bonus=Party[0].Items[i].Bonus
				end
			end
			if heal then
				Party[0].Items[index].Number=0
				local spAmount=math.round(bonus^1.4*2/3)+10
				evt.Add("SP",20+bonus*2)
				vars.manaPotionCooldown=15
				Game.ShowStatusText(string.format("Mana Potion restores %s mana",spAmount))
			end
		else
			Game.ShowStatusText(string.format("Mana Potion has %s seconds of cooldown remaining",vars.manaPotionCooldown))
		end
	end
end

function events.LoadMap(wasInGame)
	vars.manaPotionCooldown=vars.manaPotionCooldown or 15
	charge=false
	local function chargeTimer() 
		if vars.manaPotionCooldown>0 then
			vars.manaPotionCooldown=vars.manaPotionCooldown-1
		end
	end
	Timer(chargeTimer, const.Minute/2) 
end


--function that checks for enchant that increases skill 
function checkbonus(enchantNumber, playerIndex)
	local skillBonus=0
	for it in Party[playerIndex]:EnumActiveItems() do
		if it.Bonus==enchantNumber and it.BonusStrength>skillBonus then
			skillBonus=it.BonusStrength
		end
	end
	return skillBonus
end

function events.Action(t)
	if t.Action==121 then
		if t.Param>=12 and t.Param<=22 then
			t.Handled=false
			pl=Party[Game.CurrentPlayer]
			local currentCost=SplitSkill(pl.Skills[t.Param])+1
			if currentCost>60 then
				return
			end
			--calculate actual cost
			local n=1
			for i=1,11 do
				local s,m=SplitSkill(Party[Game.CurrentPlayer].Skills[11+i])
				if s>=currentCost then
					n=n+1
				end
			end
			local actualCost=math.ceil(currentCost/n)
			if pl.SkillPoints>=actualCost then
				pl.SkillPoints=pl.SkillPoints+currentCost-actualCost
			end
		end
		if table.find(partySharedSkills,t.Param) then
			maxS=0
			maxM=0
			increased=-1
			for i=0,Party.High do
				skill=partySharedSkills[table.find(partySharedSkills,t.Param)]
				s,m=SplitSkill(Party[i].Skills[skill])
				if Game.CurrentPlayer==i then
					if Party[i].SkillPoints>s then
						s=s+1
						increased=i
					end
				end
				if s>maxS then
					maxS=s
				end
				if m>maxM then
					maxM=m
				end
			end
			for i=0,Party.High do
				if increased==i then
					Party[i].Skills[skill]=JoinSkill(maxS-1,maxM)
				else
					Party[i].Skills[skill]=JoinSkill(maxS,maxM)
				end
			end
			if maxS>=10 and maxM==4 then
				t.Handled=true
				Game.ShowStatusText("This skill is already as good as it will ever get")
			end
		end
	end
end
partySharedSkills={24,25,26,31,34}
--plate&shield cover
--change target
function events.PlayerAttacked(t)
	if t.Attacker and t.Attacker.Monster then
		if (t.Attacker.MonsterAction==0 or t.Attacker.MonsterAction==1) and t.Attacker.Monster["Attack" .. t.Attacker.MonsterAction+1].Type==4 then
	
			--PLATE COVER
			--check for armor
			local it=Party[t.PlayerSlot]:GetActiveItem(3)
			if it and Game.ItemsTxt[it.Number].Skill~=11 then
				coverChance={}
				local coverIndex=1
				--iterate for players to build cover dictionary
				for i=0,Party.High do
					if Party[i].Dead==0 and Party[i].Paralyzed==0 and Party[i].Unconscious==0 and Party[i].Stoned==0 and Party[i].Eradicated==0 then
						local it=Party[i]:GetActiveItem(3)
						if it and Game.ItemsTxt[it.Number].Skill==11 then 
							local plate=Party[i].Skills[const.Skills.Plate]
							local s,m=SplitSkill(plate)
							m=math.min(m,3)
							coverChance[coverIndex]={p=0.05*m,index=i}
							coverIndex=coverIndex+1
						end
					end
				end
				--roll once per player with player and pick the one with max hp
				coverPlayerIndex=-1
				if coverChance[1] then
					lastMaxHp=0
					cover=false
					for i=1,#coverChance do
						if Party[coverChance[i].index].HP>lastMaxHp then
							local index=coverChance[i].index
							local p=coverChance[i].p
							roll=math.random()
							if roll<p then
								lastMaxHp=Party[index].HP
								coverPlayer=index
								cover=true
							end
						end
					end
					if cover then
						Party[t.PlayerSlot]:ShowFaceAnimation(6)
						Party[coverPlayer]:ShowFaceAnimation(14)
						Game.ShowStatusText(Party[coverPlayer].Name .. " cover " .. Party[t.PlayerSlot].Name)
						t.PlayerSlot=coverPlayer
					end
				end
			end	
		else
			local it=t.Player:GetActiveItem(0)
			local shield=t.Player.Skills[const.Skills.Shield]
			local s,m=SplitSkill(shield)
			if it and (Game.ItemsTxt[it.Number].Skill~=8 or m<4) then
				magicCoverChance={}
				local coverIndex=1
				--iterate for players to build cover dictionary
				for i=0,Party.High do
					if Party[i].Dead==0 and Party[i].Paralyzed==0 and Party[i].Unconscious==0 and Party[i].Stoned==0 and Party[i].Eradicated==0 then
						local it=Party[i]:GetActiveItem(0)
						if it and Game.ItemsTxt[it.Number].Skill==8 then 
							local shield=Party[i].Skills[const.Skills.Shield]
							local s,m=SplitSkill(shield)
							if m==4 then
								magicCoverChance[coverIndex]={p=0.15,index=i}
								coverIndex=coverIndex+1
							end
						end
					end
				end
				--roll once per player with player and pick the one with max hp
				coverPlayerIndex=-1
				if magicCoverChance[1] then
					lastMaxHp=0
					cover=false
					for i=1,#magicCoverChance do
						if Party[magicCoverChance[i].index].HP>lastMaxHp then
							local index=magicCoverChance[i].index
							local p=magicCoverChance[i].p
							if math.random()<p then
								lastMaxHp=Party[index].HP
								coverPlayerIndex=index
								cover=true
							end
						end
					end
					if cover then
						Party[t.PlayerSlot]:ShowFaceAnimation(6)
						Party[coverPlayerIndex]:ShowFaceAnimation(14)
						Game.ShowStatusText(Party[coverPlayerIndex].Name .. " cover " .. Party[t.PlayerSlot].Name)
						t.PlayerSlot=coverPlayerIndex
					end
				end
			end
		end
	end
end

--AUTOREPAIR
function events.Regeneration(t)
	repair=0
	for i=0,Party.High do
		v=Party[i]
		ko = v.Eradicated or v.Dead or v.Stoned or v.Paralyzed or v.Unconscious or v.Asleep
		r,m = SplitSkill(v.Skills[const.Skills.Repair])
		if r*m>repair and (ko == 0) then
			repair=r*m
		end
	end
	v=t.Player.Items
	for k=1, v.High do
		if v[k].Broken == true then
			if v[k]:T().IdRepSt<=repair then
				v[k].Broken = false
				Game.ShowStatusText("Repaired")
			end
		end
	end
end

--MAW REGEN, once every 0.1 seconds
regenHP={0,0,0,0,[0]=0}
regenSP={0,0,0,0,[0]=0}
function MawRegen()
	--HP
	for i=0,Party.High do
		local Cond = Party[i]:GetMainCondition()
		if Cond == 18 or Cond == 17 or Cond < 14 then
			--regeneration skill
			local RegS, RegM = SplitSkill(Party[i]:GetSkill(const.Skills.Regeneration))
			if RegM==4 then
				RegM=5
			end
			FHP	= Party[i]:GetFullHP()
			regenHP[i] = regenHP[i] + FHP^0.5*RegS^1.5*((RegM+1)/2500)
			--regeneration spell
			Buff=Party[i].SpellBuffs[const.PlayerBuff.Regeneration]
			if Buff.ExpireTime > Game.Time and Buff.Caster >= 0 and Buff.Caster <= Party.High then
				Buff.Power=0
				RegS, RegM = SplitSkill(Party[Buff.Caster]:GetSkill(const.Skills.Body))
				regenHP[i] = regenHP[i] + FHP^0.5*RegS^1.3*((RegM+1)/10000) -- around 1/4 of regen compared to skill, considering that of body enchants give around skill*2
			end
			
			Party[i].HP = math.min(FHP, Party[i].HP + regenHP[i])
			if Party[i].HP>0 then
				Party[i].Unconscious=0
			end
			regenHP[i]=regenHP[i]%1
		end
	end
	--SP
	for i=0,Party.High do
		local Cond = Party[i]:GetMainCondition()
		if Cond == 18 or Cond == 17 or Cond < 14 then
			local RegS, RegM = SplitSkill(Party[i]:GetSkill(const.Skills.Meditation))
			if RegM > 0 then
				if RegM==4 then
					RegM=5
				end
				FSP	= Party[i]:GetFullSP()
				regenSP[i] = regenSP[i] + FSP^0.35*RegS^1.4*((RegM+5)/5000)
				Party[i].SP = math.min(FSP, Party[i].SP + regenSP[i])
				regenSP[i]=regenSP[i]%1
			end
		end
	end
end

function events.LoadMap(wasInGame)
	Timer(MawRegen, const.Minute/20) 
end

--learning capped at 60 +9%
function events.GetLearningTotalSkill(t)
	t.Result=math.min(t.Result,69)
end


--DINAMIC SKILL TOOLTIP
function events.GameInitialized2()
	baseRegStr=Game.SkillDescriptions[30]
	baseMedStr=Game.SkillDescriptions[28]
end
function events.Tick()
	if Game.CurrentCharScreen==101 and Game.CurrentScreen==7 then
		--regeneration tooltip
		pl=Party[Game.CurrentPlayer]
		local FHP=pl:GetFullHP()
		local s,m = SplitSkill(pl:GetSkill(30))
		if m==4 then
			m=5
		end
		local hpRegen = math.round(FHP^0.5*s^1.5*((m+1)/25))/10
		local hpRegen2 = math.round(FHP^0.5*(s+1)^1.5*((m+1)/25))/10
		Game.SkillDescriptions[30] = string.format("%s\n\nCurrent HP Regeneration: %s\nNext Level Bonus: %s HP Regen",baseRegStr,StrColor(0,255,0,hpRegen),StrColor(0,255,0,"+" .. hpRegen2-hpRegen))
		--meditation tooltip
		local FSP=pl:GetFullSP()
		local s,m = SplitSkill(pl:GetSkill(28))
		if m==4 then
			m=5
		end
		local spRegen = (FSP^0.35*s^1.4*((m+5)/50)+2)/10
		local spRegen2 = (FSP^0.35*(s+1)^1.4*((m+5)/50)+2)/10
		local spRegen2 = math.round((spRegen2-spRegen)*100)/100
		if spRegen>10 then
			spRegen = math.round((spRegen)*10)/10
		else
			spRegen = math.round((spRegen)*100)/100
		end
		Game.SkillDescriptions[28] = string.format("%s\n\nCurrent SP Regeneration: %s\nNext Level Bonus: %s SP Regen",baseMedStr,StrColor(30,30,255,spRegen),StrColor(30,30,255,"+" .. spRegen2))
	end
end

function events.LoadMap()
	if vars.hirelingFix then
		vars.hirelingFix=false
		for i=0,Party.PlayersArray.High do
			pl=Party.PlayersArray[i]
			for v=0,38 do 
				if pl.Skills[v]>4864 then --2^12+2^8*3 no idea why
					pl.Skills[v]=pl.Skills[v]-3840 --1024*3+2^8*3 no idea why
					
				end	
			end
			extraSkillPoints=0
			for j=1,5 do
				s=SplitSkill(pl.Skills[partySharedSkills[j]])
				if s>1 then
					extraSkillPoints=extraSkillPoints+(s*(s+1)/2-1)
					pl.Skills[partySharedSkills[j]]=1
				end
			end	
			pl.SkillPoints=pl.SkillPoints+extraSkillPoints
		end
	end
end


--open time at 5 instead of 6
function events.GameInitialized2()
	for i =0,Game.Houses.High do
		if Game.Houses[i].OpenHour==6 then
			Game.Houses[i].OpenHour=5
		end
	end
end

--training centers bolster

function events.CalcTrainingTime(t)
	if Game.CurrentPlayer==0 then
		vars.trainings=vars.trainings or {0,0,0}
		currentWorld=TownPortalControls.MapOfContinent(Map.MapStatsIndex) 
		vars.trainings[currentWorld]=vars.trainings[currentWorld]+1
	end	
	--reduced training time
	s,m=SplitSkill(Party[Game.CurrentPlayer]:GetSkill(const.Skills.Learning))
	t.Time=const.Day*(5-m)
end
local trainingCenters={
	[1]={1,2,3,4,5,6},
	[2]={7,8,9,10,11,12,13,14,15,16},
	[3]={20,21,22,23,24,25,26,27,28,29}
}
function events.GameInitialized2()
	baseTrainers={}
	for i=1,29 do
		baseTrainers[i]=Game.HouseRules.Training[i].Quality
	end
end
	
function events.LoadMap()
	local currentWorld=TownPortalControls.MapOfContinent(Map.MapStatsIndex)
	local bolster=0
	vars.trainings=vars.trainings or {vars.MM8LVL,vars.MM7LVL,vars.MM6LVL}
	for i=1,3 do 
		if i~=currentWorld then
			bolster=bolster+vars.trainings[i]
		end
	end
	for i=1,#trainingCenters[currentWorld] do
		Game.HouseRules.Training[trainingCenters[currentWorld][i]].Quality=math.min(baseTrainers[trainingCenters[currentWorld][i]]+bolster,65535)
	end
end
