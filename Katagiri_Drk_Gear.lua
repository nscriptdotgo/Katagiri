function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','AtkCapped','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DT')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
	state.Weapons:options('Apocalypse','Montante','KajaChopper','LoxoticMace','None')
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

    autows = 'Cross Reaper'
    autowstp = 1750

    gear.da_jse_back = { name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
    gear.wsd_vit_jse_back = { name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}
    gear.wsd_str_jse_back = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    gear.fc_jse_back = { name="Ankou's Mantle", augments={'"Fast Cast"+10',}}

	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
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
        head="Sakpata's Helm",
        neck="Voltsurge Torque",
        body=gear.odyssean_fc_body,
        ear1="Malignance Earring",
        ear2="Loquacious Earring",
        hands="Leyline Gloves",
        -- ring1="Kishar Ring",
        -- ring2="Weatherspoon Ring", -- 10 macc
        legs=gear.odyssean_fc_legs,
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
        waist="Sailfi Belt +1",
        legs="Carmine Cuisses +1",
        -- ring2="Weatherspoon Ring", -- 10 macc
        feet="Carmine Greaves"
    }
                   
	-- Specific spells
 
	sets.midcast['Dark Magic'] = {
        --ammo="Pemphredo Tathlum", 
        head="Ratri Sallet", -- 45 macc
        neck="Deceiver's Torque", -- 10 dark + 17 macc
        ear1="Mani Earring",
        ear2="Malignance Earring", -- 3
        body="Flamma Korazin +2",
        hands="Fallen's Finger Gauntlets +1",
        waist="Eschan Stone", -- 5
        ring1="Evanescence Ring", -- 10
        ring2="Archon Ring", 
        back="Niht Mantle", -- 10
        legs="Heathen's Flanchard +1",  -- 18 + 39macc
        feet="Ratri Sollerets" -- macc 33
    }
           
	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Dark Magic'], {
        -- ammo="Pemphredo Tathlum", 
        -- head="Befouled Crown",
        neck="Erra Pendant", -- 10 + 17 macc
        body="Ignominy Cuirass +2",
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
        head="Ratri Sallet",
        ear1="Tuisto Earring",
        ear2="Odnowa Earring +1",
        body="Heathen's Cuirass +1",
        --body="Ratri Breastplate +1",
        hands="Ratri Gadlings",
        -- back="Trepidity Mantle",
        ring1="Moonbeam Ring", -- matk 4
        ring2="Gelatinous Ring +1", -- matk 4
        waist="Oneiros Belt",
        legs="Ratri Cuisses",
        feet="Amm Greaves"
    })
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {
        head="Flamma Zucchetto +2", -- 17
        neck="Erra Pendant",
        hands="Pavor Gauntlets",
        back="Chuparrosa Mantle",
        ring1="Evanescence Ring", -- 10
        ring2="Archon Ring"
    })
           
	sets.midcast.Stun = {
        -- ammo="Pemphredo Tathlum",
		-- head="Carmine Mask +1",
        neck="Erra Pendant",
        -- ear1="Digni. Earring",
        ear2="Malignance Earring",
		body="Flamma Korazin +2",
        hands="Flam. Manopolas +2",
        -- ring1="Stikini Ring +1",
        -- ring2="Stikini Ring +1",
        back=gear.fc_jse_back,
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
        body="Ignominy Cuirass +2",
		hands=gear.odyssean_wsd_head,
        ring1="Titan Ring",
        ring2="Karieyh Ring",
        back=gear.wsd_vit_jse_back,
        waist="Light Belt",
        legs=gear.odyssean_wsd_legs,
        feet="Sulevia's Leggings +2"
    }

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
    sets.precast.WS.AtkCapped = set_combine(sets.precast.WS, {
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings"})
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {
        -- main="Apocalypse",
        -- sub="Utu Grip",
        ammo="Knobkierrie",
        head="Ratri Sallet",
        neck="Abyssal Bead Necklace +1",
        ear1="Lugra Earring +1",
        ear2="Thrud Earring",
        body="Ignominy Cuirass +2",
        hands="Ratri Gadlings",
        ring1="Karieyh Ring",
        ring2="Niqmaddu Ring",
        back=gear.wsd_str_jse_back,
        waist="Shadow Belt",
        legs="Ratri Cuisses",
        feet="Ratri Sollerets"
    })

    sets.precast.WS['Catastrophe'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Catastrophe'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Catastrophe'].Fodder = set_combine(sets.precast.WS.Fodder, {})
    sets.precast.WS['Catastrophe'].AtkCapped = set_combine(sets.precast.WS, {head="Sakpata's Helm",body="Sakpata's Plate",hands="Sakpata's Gauntlets",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"})

    sets.precast.WS['Cross Reaper'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Ratri Sallet",
        neck="Caro Necklace",
        body="Ignominy Cuirass +2",
        hands="Ratri Gadlings",
        ring1="Rajas Ring",
        ring2="Niqmaddu Ring",
        back=gear.wsd_str_jse_back,
        waist="Grunfeld Rope",
        legs="Ratri Cuisses",
        feet="Ratri Sollerets"
    })

    sets.precast.WS['Cross Reaper'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Cross Reaper'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Cross Reaper'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Cross Reaper'].Fodder = set_combine(sets.precast.WS.Fodder, {})
    sets.precast.WS['Cross Reaper'].AtkCapped = set_combine(sets.precast.WS, {head="Sakpata's Helm",body="Sakpata's Plate",hands="Sakpata's Gauntlets",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"})
	
	sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {
        head=gear.odyssean_wsd_head,
        hands=gear.odyssean_wsd_hands,
        ring2="Niqmaddu Ring",
        neck="Light Gorget",
        waist="Light Belt",
        back=gear.wsd_vit_jse_back
    })

	sets.precast.WS['Torcleaver'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {
        head="Fallen's Burgeonet +3",
        neck="Abyssal Bead Necklace +1",
    })
    sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS.Acc, {body="Fallen's Cuirass +3",legs=gear.odyssean_wsd_legs})
    sets.precast.WS['Torcleaver'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Torcleaver'].Fodder = set_combine(sets.precast.WS.Fodder, {})
    sets.precast.WS['Torcleaver'].AtkCapped = set_combine(sets.precast.WS, {head="Sakpata's Helm",body="Sakpata's Plate",hands="Sakpata's Gauntlets",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"})
    sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {ring1="Rufescent Ring",neck="Shadow Belt"})
    sets.precast.WS['Entropy'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Entropy'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Entropy'].Fodder = set_combine(sets.precast.WS.Fodder, {})
    sets.precast.WS['Entropy'].AtkCapped = set_combine(sets.precast.WS, {head="Sakpata's Helm",body="Sakpata's Plate",hands="Sakpata's Gauntlets",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"})

    sets.precast.WS['Quietus'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Ratri Sallet",
        neck="Caro Necklace",
        body="Ignominy Cuirass +2",
        hands="Ratri Gadlings",
        ring1="Rajas Ring",
        ring2="Niqmaddu Ring",
        back=gear.wsd_str_jse_back,
        waist="Grunfeld Rope",
        legs="Ratri Cuisses",
        feet="Ratri Sollerets"
    })
    sets.precast.WS['Quietus'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Quietus'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Quietus'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Quietus'].Fodder = set_combine(sets.precast.WS.Fodder, {})
     
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {
        -- neck="Breeze Gorget",
        body="Valorous Mail",
        hands="Sakpata's Gauntlets",
        waist="Soil Belt",
        -- legs="Fallen's Flanchard +3",
        feet="Sulevia's Leggings +2"
    })
    sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {
        ammo="Seething Bomblet +1",
        legs="Fallen's Flanchard",
        legs="Sakpata's Cuisses",
    })
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS.Fodder, {})
    sets.precast.WS['Resolution'].AtkCapped = set_combine(sets.precast.WS, {head="Sakpata's Helm",body="Sakpata's Plate",hands="Sakpata's Gauntlets",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"})

    sets.precast.WS['Judgment'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Ratri Sallet",
        neck="Caro Necklace",
        body="Ignominy Cuirass +2",
        hands="Ratri Gadlings",
        ring1="Rajas Ring",
        ring2="Niqmaddu Ring",
        back=gear.wsd_str_jse_back,
        waist="Grunfeld Rope",
        legs="Ratri Cuisses",
        feet="Ratri Sollerets"
    })

    sets.precast.WS['Judgment'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Judgment'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Judgment'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Judgment'].Fodder = set_combine(sets.precast.WS.Fodder, {})
    sets.precast.WS['Judgment'].AtkCapped = set_combine(sets.precast.WS, {head="Sakpata's Helm",body="Sakpata's Plate",hands="Sakpata's Gauntlets",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"})
           
     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {
        ear1="Lugra Earring +1",
    }
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Brutal Earring",ear2="Moonshade Earring",}
     
    -- Idle sets
           
    sets.idle = {
        ammo="Staunch Tathlum",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck="Lissome Necklace",
        waist="Flume Belt +1",
        left_ear="Odnowa Earring +1",
        right_ear="Infused Earring",
        left_ring="Paguroidea Ring",
        right_ring="Defending Ring",
        back="Shadow Mantle"
    }
		
    sets.idle.PDT = {
        ammo="Staunch Tathlum",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck="Abyssal Bead Necklace +1",
        waist="Flume Belt +1",
        left_ear="Odnowa Earring +1",
        right_ear="Infused Earring",
        left_ring="Paguroidea Ring",
        right_ring="Defending Ring",
        back="Shadow Mantle"
    }

	sets.idle.Weak = set_combine(sets.idle, {
        head="Twilight Helm",
        body="Twilight Mail"
    })
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
           
    -- Defense sets
	sets.defense.PDT = {
        ammo="Seething Bomblet +1", -- 2% haste
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        ear1="Odnowa Earring +1",
        ear2="Cessance Earring",
        ring1="Gelatinous Ring +1",
        ring2="Defending Ring",
        neck="Loricate Torque +1",
        -- back="Grounded Mantle +1", -- 2% haste
        waist="Flume Belt +1", -- 9% haste
        feet="Volte Sollerets" -- 3% haste
    }
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = set_combine(sets.defense.PDT, {
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck="Loricate Torque +1",
        ear1="Etiolation Earring",
    })
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {
        ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",
        neck="Warder's Charm",
        -- ear1="Genmei Earring",
        ear2="Ethereal Earring",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        ring1="Moonbeam Ring",
        ring2="Defending Ring",
		back="Moonlight Cape",
        waist="Flume Belt +1",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
    }
     
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.passive.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff['Dark Seal'] = {head="Fallen's Burgeonet +1"} --head="Fallen's Burgeonet +3"
     
	-- Engaged sets
	sets.engaged = {
        ammo="Coiste Bodhar",
		head="Flamma Zucchetto +2",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
		feet="Flamma Gambieras +2",
		neck="Lissome Necklace",
		waist="Ioskeha Belt",
		ear1="Cessance Earring",
		ear2="Telos Earring",
		ring1="Petrov Ring",
		ring2="Niqmaddu Ring",
		back=gear.da_jse_back
    }
    sets.engaged.SomeAcc = set_combine(sets.engaged, {
        ear2="Telos Earring",
        ammo="Seething Bomblet +1",
    })
	sets.engaged.Acc = set_combine(sets.engaged.SomeAcc, {
        body="Flamma Korazin +2",
    })
    sets.engaged.FullAcc = {
        ammo="Seething Bomblet +1",
		head="Flam. Zucchetto +2",
        neck="Abyssal Bead Necklace +1",
        ear1="Cessance Earring",
        ear2="Telos Earring",
		body="Flamma Korazin +2",
        hands="Flamma Manopolas +2",
        ring1="Flamma Ring",
        -- ring2="Ramuh Ring +1",
		back=gear.da_jse_back,
        waist="Ioskeha Belt",
        legs="Sakpata's Cuisses",
        feet="Flam. Gambieras +2"
    }
    sets.engaged.Fodder = {
        ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
        neck="Asperity Necklace",
        ear1="Brutal Earring",
        ear2="Cessance Earring",
		body=gear.valorous_wsd_body,
        hands=gear.valorous_acc_hands,
        ring1="Petrov Ring",
        ring2="Niqmaddu Ring",
		back=gear.da_jse_back,
        waist="Ioskeha Belt",
        legs="Sulev. Cuisses +2",
        feet="Flam. Gambieras +2"
    }
    sets.engaged.DT = {
        ammo="Coiste Bodhar",
        head="Sakpata's Helm",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        ear1="Brutal Earring",
        ear2="Cessance Earring",
        ring1="Niqmaddu Ring",
        neck="Abyssal Beads +1",
        ring2="Defending Ring",
        back=gear.da_jse_back,
        waist="Ioskeha Belt"
    }
    -- sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {
        -- main="Caladbolg",
        -- sub="Utu Grip",
        ammo="Coiste Bodhar",
        head="Sakpata's Helm",
        neck="Loricate Torque +1",
        ear1="Brutal Earring",
        ear2="Cessance Earring",
        body="Sakpata's Plate",
        hands="Sakpata's Gauntlets",
        ring1="Moonbeam Ring",
        ring2="Defending Ring",
        back=gear.da_jse_back,
        waist="Ioskeha Belt",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
    }
	sets.engaged.Acc.PDT = {}
	sets.engaged.FullAcc.PDT = {}
	sets.engaged.Fodder.PDT = {}

	--Extra Special Sets
	
	sets.buff.Souleater = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Montante = {main="Montante +1",sub="Utu Grip"}
    sets.weapons.KajaChopper = {main="Kaja Chopper",sub="Utu Grip"}
	sets.weapons.Apocalypse = {main="Apocalypse",sub="Utu Grip"}
    sets.weapons.LoxoticMace = {main="Loxotic Mace +1"}
    sets.weapons.None = {}
	
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