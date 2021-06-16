function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DTLite')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
	state.Weapons:options('Montante','Cronus')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}
	state.DrainSwapWeaponMode = M{'Always','Never','300','1000'}

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
    send_command('bind @e input /ms "Endark II" <me>')
	send_command('bind @d input /ma "Dread Spikes" <me>')
    send_command('bind @[ input /ja "Dark Seal" <me>')
    send_command('bind @] input /ja "Nether Void" <me>')
    send_command('bind @q input /ma "Stun" <t>')
	send_command('bind @` gs c cycle SkillchainMode')

    autows = 'Torcleaver'
    autowstp = 1000

    gear.da_jse_back = { name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
    gear.wsd_vit_jse_back = { name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}
    gear.wsd_str_jse_back = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    gear.fc_jse_back = { name="Ankou's Mantle", augments={'"Fast Cast"+10',}}

	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

	--- Ankou ---
	Ankou = {}
    Ankou.FC  = { name="Ankou's Mantle", augments={'"Fast Cast"+10',}}
    Ankou.STP = { name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}

	--- Odyssean ---
	Odyssean = {}
    Odyssean.Legs = {}
    Odyssean.Hands = {}
    Odyssean.Head = {}
    Odyssean.Legs.TP = { name="Odyssean Cuisses", augments={'"Dbl.Atk."+5','DEX+8','Accuracy+2',}}
    Odyssean.Legs.WS = { name="Odyssean Cuisses", augments={'Accuracy+8 Attack+8','Weapon skill damage +4%','STR+7','Accuracy+7',}}
    Odyssean.Legs.FC = {name="Odyssean Cuisses",augments={'"Fast Cast"+5','Magic Accuracy+21',}}
    Odyssean.Hands.WSD = { name="Odyssean Gauntlets", augments={'Weapon skill damage +4%','Accuracy+9 Attack+9','Haste+2','Mag. Acc.+6 "Mag.Atk.Bns."+6',}}
    Odyssean.Head.WSD = { name="Odyssean Helm", augments={'Accuracy+14','Weapon skill damage +5%','Attack+1',}}



    
    Odyssean.Feet = {}
    Odyssean.Body = {}
    Odyssean.Feet.FC = { name="Odyssean Greaves", augments={'Attack+20','"Fast Cast"+4','Accuracy+15',}}
    Odyssean.Body.FC = { name="Odyssean Chestplate", augments={'MND+11','"Fast Cast"+3','Accuracy+14',}}

	--- Valorous ---
	Valorous = {}
    Valorous.Feet = {}
    Valorous.Body = {}
    
   
    Valorous.Feet.TH = { name="Valorous Greaves", augments={'CHR+13','INT+1','"Treasure Hunter"+2','Accuracy+12 Attack+12','Mag. Acc.+1 "Mag.Atk.Bns."+1',}}
    Valorous.Feet.TP = { name="Valorous Greaves", augments={'Accuracy+27','"Store TP"+6','INT+1',}}
    
    --Valorous.Body.STP = { name="Valorous Mail", augments={'Accuracy+30','"Store TP"+6','DEX+3','Attack+14',}}
	Valorous.Body.STP = { name="Valorous Mail", augments={'Accuracy+4','"Store TP"+6','Attack+10',}}
    Valorous.Body.WSD = { name="Valorous Mail", augments={'Accuracy+28','Weapon Skill Damage + 2%','Attack+12','VIT+9',}}
    Valorous.Body.DA = { name="Valorous Mail", augments={'Accuracy+20 Attack+20','"Dbl.Atk."+4','VIT+4','Attack+6',}}
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	-- Precast sets to enhance JAs
    sets.precast.JA['Diabolic Eye'] = {hands="Fallen's Finger Gauntlets +1"}
	sets.precast.JA['Arcane Circle'] = {}
    sets.precast.JA['Souleater']    = {head="Ignominy burgeonet +1"}
    sets.precast.JA['Weapon Bash']   = {hands="Ignominy Gauntlets +1"}
	sets.precast.JA['Nether Void'] = {legs="Heathen's Flanchard +1"}
    sets.precast.JA['Blood Weapon'] = {body="Fallen's Cuirass +1"}
    sets.precast.JA['Dark Seal']    = {head="Fallen's burgeonet +1"}
	sets.precast.JA['Last Resort'] = {back=gear.wsd_str_jse_back}
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {
        -- ammo="Impatiens",
        head="Fallen's Burgonet +1",
        neck="Voltsurge Torque",
        body=Odyssean.Body.FC,
        ear1="Malignance Earring",
        ear2="Loquacious Earring",
        hands="Leyline Gloves",
        -- ring1="Kishar Ring",
        -- ring2="Weatherspoon Ring", -- 10 macc
        legs=Odyssean.Legs.FC,
        back=gear.fc_jse_back,
        waist="Flume Belt +1",
        feet="Carmine Greaves"
    }
    -- sets.precast.FC = {ammo="Impatiens",
	-- 	head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
	-- 	body="Odyss. Chestplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
	-- 	back="Moonlight Cape",waist="Flume Belt +1",legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
		
	-- Midcast Sets
	sets.midcast.FastRecast = {
        -- ammo="Impatiens",
        head="Fallen's Burgeonet +1",
        -- back="Grounded Mantle +1",
        -- waist="Sailfi Belt +1",
        legs="Carmine Cuisses +1",
        -- ring2="Weatherspoon Ring", -- 10 macc
        feet="Carmine Greaves"
    }
                   
	-- Specific spells
 
	sets.midcast['Dark Magic'] = {
        --ammo="Pemphredo Tathlum", 
        --head="Ratri Sallet +1", -- 45 macc
        head="Pixie Hairpin +1", -- 19
        neck="Deceiver's Torque", -- 10 dark + 17 macc
        --ear1="Malignance Earring",
        ear1="Mani Earring",
        ear2="Dark Earring", -- 3
        body="Flamma Korazin +2",
        hands="Fallen's Finger Gauntlets +1",
        waist="Eschan Stone", -- 5
        ring1="Evanescence Ring", -- 10
        ring2="Archon Ring", 
        back="Niht Mantle", -- 10
        legs="Heathen's Flanchard +1",  -- 18 + 39macc
        feet="Ratri Sollerets" -- macc 33
        -- feet="Flamma Gambieras +2" -- macc 33
    }
           
	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Dark Magic'], {
        -- ammo="Pemphredo Tathlum", 
        -- head="Befouled Crown",
        -- neck="Erra Pendant", -- 10 + 17 macc
        -- body="Ignominy Cuirass +3",
        hands="Flamma Manopolas +2",
        -- ring1="Kishar Ring",
        -- ring2="Regal Ring", -- 10 macc
        waist="Eschan Stone",
        legs="Fallen's Flanchard +1",  -- 18 + 39macc
        -- back="Aput Mantle",
        feet="Flamma Gambieras +2"
    })
		   
	sets.midcast['Dread Spikes'] = set_combine(sets.midcast['Dark Magic'], {
        ammo="Egoist's Tathlum",
        neck="Sanctity Necklace",
        -- head="Ratri Sallet +1",
        ear1="Tuisto Earring",
        ear2="Odnowa Earring +1",
        body="Heathen's Cuirass +1",
        --body="Ratri Breastplate +1",
        -- hands="Ratri Gadlings +1",
        -- back="Trepidity Mantle",
        ring1="Moonbeam Ring", -- matk 4
        ring2="Gelatinous Ring +1", -- matk 4
        waist="Oneiros Belt",
        -- legs="Ratri Cuisses +1",
        feet="Amm Greaves"
    })
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {
        head="Flamma Zucchetto +2", -- 17
        neck="Sanctity Necklace",
        hands="Pavor Gauntlets",
        back="Chuparrosa Mantle",
        ring1="Evanescence Ring", -- 10
        ring2="Archon Ring"
    })
           
	sets.midcast.Stun = {
        -- ammo="Pemphredo Tathlum",
		-- head="Carmine Mask +1",
        -- neck="Erra Pendant",
        -- ear1="Digni. Earring",
        -- ear2="Malignance Earring",
		body="Flamma Korazin +2",
        hands="Flam. Manopolas +2",
        -- ring1="Stikini Ring +1",
        -- ring2="Stikini Ring +1",
		-- back="Toro Cape",
        waist="Eschan Stone",
        -- legs="Eschite Cuisses",
        feet="Flam. Gambieras +2"
    }
                   
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        ring1="Evanescence Ring",
        ring2="Archon Ring",
        back="Niht Mantle"
    })
	
	sets.DrainWeapon = {main="Misanthropy",sub="Alber Strap"}
                   
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {head=empty,body="Twilight Cloak"})
	
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {
        -- neck="Phalaina Locket",
        hands="Buremte Gloves",
        ring2="Kunaji Ring",
        waist="Gishdubar Sash"
    }
	sets.Cure_Received = {
        -- neck="Phalaina Locket",
        hands="Buremte Gloves",
        ring2="Kunaji Ring",
        waist="Gishdubar Sash"
    }
	sets.Self_Refresh = {waist="Gishdubar Sash"}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo="Knobkierrie",
        head="Flamma Zucchetto +2",
        neck="Light Gorget",
        ear1="Thrud Earring",
        ear2="Moonshade Earring",
        body=Valorous.Body.WSD,
		hands=Odyssean.Hands.WSD,
        ring1="Titan Ring",
        ring2="Karieyh Ring",
        back=gear.wsd_vit_jse_back,
        waist="Light Belt",
        legs=Odyssean.Legs.WS,
        feet="Sulevia's Leggings +2"
    }

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Catastrophe'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Catastrophe'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Catastrophe'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Cross Reaper'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head=Odyssean.Head.WSD,
        ring1="Niqmaddu Ring",
        ring2="Rufescent Ring",
        neck="Caro Necklace",
        waist="Grunfeld Rope",
        legs="Sulevia Cuisses +1",
        feet="Ratri Sollerets"
    })
	
	sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {
        head=Odyssean.Head.WSD,
        hands=gear.odyssean_wsd_hands,
        ring1="Niqmaddu Ring",
        neck="Light Gorget",
        waist="Light Belt",
        back=gear.wsd_vit_jse_back
    })

	sets.precast.WS['Torcleaver'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {
        head="Fallen's Burgeonet +3",
        neck="Abyssal Bead Necklace +2",
    })
    sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS.Acc, {
        body="Fallen's Cuirass +3",
        legs=Odyssean.Legs.WS
    })
    sets.precast.WS['Torcleaver'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Torcleaver'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {
        ring1="Rufescent Ring",
        neck="Shadow Belt"
    })
    sets.precast.WS['Entropy'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Entropy'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Entropy'].Fodder = set_combine(sets.precast.WS.Fodder, {})
     
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {
        -- neck="Breeze Gorget",
        body="Valorous Mail",
        hands="Sulevia's Gauntlets +2",
        waist="Soil Belt",
        -- legs="Fallen's Flanchard +3",
        feet="Sulevia's Leggings +2"
    })
    sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {
        ammo="Seething Bomblet +1",
        legs="Fallen's Flanchard",
        feet="Sulevia's Leggings +2"
    })
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS.Fodder, {})     
           
     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {
        -- ear1="Lugra Earring +1",
        ear1="Lugra Earring",
    }
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Brutal Earring",ear2="Moonshade Earring",}
     
    -- Idle sets
           
    sets.idle = {
        ammo="Staunch Tathlum",
        head="Sulevia's Mask +1",
        body="Sulevia's Plate. +1",
        hands="Sulev. Gauntlets +2",
        legs="Sulevi. Cuisses +1",
        feet="Sulev. Leggings +2",
        neck="Sanctity Necklace",
        waist="Flume Belt +1",
        left_ear="Odnowa Earring +1",
        right_ear="Ethereal Earring",
        left_ring="Paguroidea Ring",
        right_ring="Defending Ring",
        back="Shadow Mantle",
    }
		
    sets.idle.PDT = {ammo="Staunch Tathlum +1",
		head="Jumalik Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Jumalik Mail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Amm Greaves"}

	sets.idle.Weak = set_combine(sets.idle, {
        head="Twilight Helm",
        body="Twilight Mail"
    })
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
           
    -- Defense sets
	sets.defense.PDT = {
        ammo="Seething Bomblet +1", -- 2% haste
        -- head="Hjarrandi Helm", -- no haste
        neck="Twilight Torque",
        --body="Tartarus Platemail", -- 3% haste
        body="Sulevia's Platemail +1", -- 1% haste
        hands="Sulevia's Gauntlets +1",
        ear1="Odnowa Earring +1",
        ear2="Cessance Earring",
        ring1="Gelatinous Ring +1",
        ring2="Defending Ring",
        -- back="Grounded Mantle +1", -- 2% haste
        --waist="Sailfi Belt +1", -- 9% haste
        --legs="Sulevia's Flanchard +3", -- 5% haste
        feet="Volte Sollerets" -- 3% haste
    }
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = set_combine(sets.defense.PDT, {
        --head="Hjarrandi Helm", -- no haste
        neck="Twilight Torque",
        -- body="Tartarus Platemail",
        ear1="Etiolation Earring",
        --back="Impassive Mantle",
    })
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonbeam Ring",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
     
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.passive.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff['Dark Seal'] = {head="Fallen's Burgeonet +1"} --head="Fallen's Burgeonet +3"
     
	-- Engaged sets
	sets.engaged = {
        ammo="Ginsen",
		head="Flamma Zucchetto +2",
		body=Valorous.Body.WSD,
		hands="Flamma Manopolas +2",
		legs=Odyssean.Legs.TP,
		feet="Flamma Gambieras +2",
		neck="Lissome Necklace",
		waist="Ioskeha Belt",
		ear1="Cessance Earring",
		ear2="Telos Earring",
		ring1="Niqmaddu Ring",
		ring2="Petrov Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
    }
    sets.engaged.SomeAcc = set_combine(sets.engaged, {
        ear2="Telos Earring",
        -- ring2="Regal Ring",
        body=Valorous.Body.STP
    })
	sets.engaged.Acc = set_combine(sets.engaged.SomeAcc, {
        -- ammo="Hasty Pinion +1",
        ear1="Cessance Earring",
        ear2="Telos Earring",
        body="Flamma Korazin +2",
        back=Ankou.STP,
    })
    sets.engaged.FullAcc = {ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Ramuh Ring +1",
		back="Ankou's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Fodder = {ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back="Ankou's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.DTLite = {
        ammo="Ginsen",
        head="Sulevia's Mask +1",
        neck="Loricate Torque +1",
        ear1="Brutal Earring",
        ear2="Cessance Earring",
        body="Valorous Mail",
        hands="Sulev. Gauntlets +2",
        ring1="Moonbeam Ring",
        ring2="Defending Ring",
        back=gear.da_jse_back,
        waist="Ioskeha Belt",
        legs="Sulev. Cuisses +2",
        feet="Flam. Gambieras +2"
    }
--Example sets:
--[[
    sets.engaged.Adoulin = {}
	sets.engaged.SomeAcc.Adoulin = {}
	sets.engaged.Acc.Adoulin = {}
	sets.engaged.FullAcc.Adoulin = {}
	sets.engaged.Fodder.Adoulin = {}
	
	sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.FullAcc.PDT = {}
	sets.engaged.Fodder.PDT = {}
	
	sets.engaged.PDT.Adoulin = {}
	sets.engaged.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Acc.PDT.Adoulin = {}
	sets.engaged.FullAcc.PDT.Adoulin = {}
	sets.engaged.Fodder.PDT.Adoulin = {}
	
	sets.engaged.MDT = {}
	sets.engaged.SomeAcc.MDT = {}
	sets.engaged.Acc.MDT = {}
	sets.engaged.FullAcc.MDT = {}
	sets.engaged.Fodder.MDT = {}
	
	sets.engaged.MDT.Adoulin = {}
	sets.engaged.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Acc.MDT.Adoulin = {}
	sets.engaged.FullAcc.MDT.Adoulin = {}
	sets.engaged.Fodder.MDT.Adoulin = {}
	
            -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
            -- sets if more refined versions aren't defined.
            -- If you create a set with both offense and defense modes, the offense mode should be first.
            -- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Liberator melee sets
    sets.engaged.Liberator = {}
	sets.engaged.Liberator.SomeAcc = {}
	sets.engaged.Liberator.Acc = {}
	sets.engaged.Liberator.FullAcc = {}
	sets.engaged.Liberator.Fodder = {}
	
    sets.engaged.Liberator.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.Adoulin = {}
	sets.engaged.Liberator.Acc.Adoulin = {}
	sets.engaged.Liberator.FullAcc.Adoulin = {}
	sets.engaged.Liberator.Fodder.Adoulin = {}
	
    sets.engaged.Liberator.AM = {}
	sets.engaged.Liberator.SomeAcc.AM = {}
	sets.engaged.Liberator.Acc.AM = {}
	sets.engaged.Liberator.FullAcc.AM = {}
	sets.engaged.Liberator.Fodder.AM = {}
	
    sets.engaged.Liberator.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.Adoulin.AM = {}

	sets.engaged.Liberator.PDT = {}
	sets.engaged.Liberator.SomeAcc.PDT = {}
	sets.engaged.Liberator.Acc.PDT = {}
	sets.engaged.Liberator.FullAcc.PDT = {}
	sets.engaged.Liberator.Fodder.PDT = {}
	
	sets.engaged.Liberator.PDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Liberator.PDT.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.AM = {}
	sets.engaged.Liberator.Acc.PDT.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.AM = {}
	sets.engaged.Liberator.Fodder.PDT.AM = {}
	
	sets.engaged.Liberator.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Liberator.MDT = {}
	sets.engaged.Liberator.SomeAcc.MDT = {}
	sets.engaged.Liberator.Acc.MDT = {}
	sets.engaged.Liberator.FullAcc.MDT = {}
	sets.engaged.Liberator.Fodder.MDT = {}
	
	sets.engaged.Liberator.MDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Liberator.MDT.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.AM = {}
	sets.engaged.Liberator.Acc.MDT.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.AM = {}
	sets.engaged.Liberator.Fodder.MDT.AM = {}
	
	sets.engaged.Liberator.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin.AM = {}
]]--
	--Extra Special Sets
	
	sets.buff.Souleater = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Montante = {main="Montante +1",sub="Gracile Grip"}
    -- sets.weapons.Zulfiqar = {main="Zulfiqar",sub="Gracile Grip"}
    sets.weapons.Cronus = {main="Cronus",sub="Gracile Grip"}
    sets.weapons.KajaChopper = {main="Kaja Chopper",sub="Gracile Grip"}
	-- sets.weapons.Anguta = {main="Anguta",sub="Utu Grip"}
	
    end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 8)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 8)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 15)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 15)
    else
        set_macro_page(5, 15)
    end
end
buff_spell_lists = {
    Auto = {    
        {Name='Dread Spikes',Buff='Dread Spikes',SpellID=277,Reapply=false},
        {Name='Endark II',Buff='Endark',SpellID=311,Reapply=false},
    },
    
    Default = {
        {Name='Dread Spikes',Buff='Dread Spikes',SpellID=277,Reapply=false},
        {Name='Endark II',Buff='Endark',SpellID=311,Reapply=false},
    },
}
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[911] < spell_latency and not have_trust("Joachim") then
					windower.send_command('input /ma "Joachim" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[898] < spell_latency and not have_trust("Kupipi") then
					windower.send_command('input /ma "Kupipi" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end