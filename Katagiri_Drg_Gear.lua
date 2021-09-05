-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DT')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Weapons:options('Trishula','ShiningOne','None')
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}

    select_default_macro_book()
	
	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind @f7 gs c toggle AutoJumpMode')
	send_command('bind @` gs c cycle SkillchainMode')

	gear.da_jse_back = { name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	gear.wsd_str_jse_back = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}


end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Angon = {ammo="Angon"} --hands="Ptero. Fin. G. +1"
	sets.precast.JA.Jump = {
		-- ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",
		-- neck="Ganesha's Mala",
		ear1="Telos Earring",
		ear2="Sherida Earring",
		body=gear.valorous_wsd_body,
		-- hands=gear.valorous_acc_hands,
		ring1="Petrov Ring",
		ring2="Niqmaddu Ring",
		back=gear.da_jse_back,
		waist="Windbuffet Belt +1",
		legs="Sulev. Cuisses +2",
		feet="Flam. Gambieras +2"
	}
	sets.precast.JA['Ancient Circle'] = {} --legs="Vishap Brais"
	sets.precast.JA['High Jump'] = {
		-- ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",
		-- neck="Ganesha's Mala",
		ear1="Telos Earring",
		ear2="Sherida Earring",
		body=gear.valorous_wsd_body,
		-- hands=gear.valorous_acc_hands,
		ring1="Petrov Ring",
		ring2="Niqmaddu Ring",
		back=gear.da_jse_back,
		waist="Windbuffet Belt +1",
		legs="Sulev. Cuisses +2",
		feet="Flam. Gambieras +2"
	}
	sets.precast.JA['Soul Jump'] = {
		-- ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",
		-- neck="Ganesha's Mala",
		ear1="Telos Earring",
		ear2="Sherida Earring",
		body=gear.valorous_wsd_body,
		-- hands=gear.valorous_acc_hands,
		ring1="Petrov Ring",
		ring2="Niqmaddu Ring",
		back=gear.da_jse_back,
		waist="Windbuffet Belt +1",
		legs="Sulev. Cuisses +2",
		feet="Flam. Gambieras +2"
	}
	sets.precast.JA['Spirit Jump'] = {
		-- ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",
		-- neck="Ganesha's Mala",
		ear1="Telos Earring",
		ear2="Sherida Earring",
		body=gear.valorous_wsd_body,
		-- hands=gear.valorous_acc_hands,
		ring1="Petrov Ring",
		ring2="Niqmaddu Ring",
		back=gear.da_jse_back,
		waist="Windbuffet Belt +1",
		legs="Sulev. Cuisses +2",
		feet="Flam. Gambieras +2"
	}
	sets.precast.JA['Super Jump'] = {}
	sets.precast.JA['Spirit Link'] = {head="Vishap Armet +1"} --head="Vishap Armet",hands="Lnc. Vmbrc. +2"
	sets.precast.JA['Call Wyvern'] = { body="Ptero. Mail +1" } --body="Ptero. Mail +1"
	sets.precast.JA['Deep Breathing'] = { hands="Ptero. Armet +1" } --hands="Ptero. Armet +1"
	sets.precast.JA['Spirit Surge'] = { body="Ptero. Mail +1" } --body="Ptero. Mail +1"
	sets.precast.JA['Steady Wing'] = {}
	
	-- Breath sets
	sets.precast.JA['Restoring Breath'] = {back=gear.da_jse_back}
	sets.precast.JA['Smiting Breath'] = {back=gear.da_jse_back}
	sets.HealingBreath = {back=gear.da_jse_back}
	--sets.SmitingBreath = {back="Brigantia's Mantle"}

	-- Fast cast sets for spells
	
	sets.precast.FC = {ammo="Impatiens",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Taeon Tabard",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Founder's Greaves",feet="Carmine Greaves +1"}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum +1",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Taeon Tabard",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Tempus Fugit",legs="Founder's Greaves",feet="Carmine Greaves +1"}
		
	-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {head="Vishap Armet +1"})
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {
		ammo="Knobkierrie",
		head="Flam. Zucchetto +2",
		neck="Dgn. Collar +1",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		body=gear.valorous_wsd_body,
		hands="Sulev. Gauntlets +2",
		ring1="Rajas Ring",
		ring2="Niqmaddu Ring",
		back=gear.da_jse_back,
		waist="Shadow Belt",
		legs="Sulev. Cuisses +2",
		feet="Flam. Gambieras +2"
	}
		
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {neck="Shulmanu Collar"})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Shulmanu Collar"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {
		back=gear.wsd_str_jse_back
	})
	sets.precast.WS['Stardiver'].SomeAcc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Stardiver'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Drakesbane'].SomeAcc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Drakesbane'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Drakesbane'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {
		body=gear.valorous_wsd_body,
		ring1="Karieyh Ring",
		legs="Sulev. Cuisses +2",
		feet="Sulev. Leggings +2",
		back=gear.wsd_str_jse_back
	})
	sets.precast.WS['Impulse Drive'].SomeAcc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Impulse Drive'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Impulse Drive'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	-- Savage Blade
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		body=gear.valorous_wsd_body,
		ring1="Karieyh Ring",
		legs="Sulev. Cuisses +2",
		feet="Sulev. Leggings +2",
		back=gear.wsd_str_jse_back
	})
	sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS.Fodder, {})


	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {
		ammo="Staunch Tathlum",
        head="Hjarrandi Helm",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Infused Earring",
		body="Sulevia's Plate. +2",
		hands="Sulev. Gauntlets +2",
		ring1="Defending Ring",
		ring2="Paguroidea Ring",
		back="Shadow Mantle",
		waist="Flume Belt +1",
		legs="Carmine Cuisses +1",
		feet="Amm Greaves"
	}
		
	sets.idle.Refresh = {ammo="Staunch Tathlum +1",
		head="Jumalik Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Jumalik Mail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Amm Greaves"}

	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonbeam Ring",ring2="Moonlight Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Arke Cosc. +1",feet="Amm Greaves"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonbeam Ring",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Arke Cosc. +1",feet="Amm Greaves"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonbeam Ring",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Arke Cosc. +1",feet="Amm Greaves"}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = {ear2="Ethereal Earring",waist="Flume Belt +1"}
    sets.passive.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {
		waist="Chaac Belt"
	})
	
	-- Weapons sets
	sets.weapons.Trishula = {main="Trishula",sub="Utu Grip"}
	sets.weapons.ShiningOne = {main="Shining One",sub="Gracile Grip"}
	sets.weapons.None = {
		-- main="Trishula",
		-- sub="Utu Grip"
	}


	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Moonshade Earring",ear2="Sherida Earring",}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged = {
		-- ammo="Aurgelmir Orb +1",
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
		neck="Dgn. Collar +1",
		ear1="Brutal Earring",
		ear2="Sherida Earring",
		-- body=gear.valorous_wsd_body,
		body="Flamma Korazin +2",
		-- hands=gear.valorous_acc_hands,
		ring1="Petrov Ring",
		ring2="Niqmaddu Ring",
		back=gear.da_jse_back,
		waist="Ioskeha Belt",
		legs="Sulev. Cuisses +2",
		feet="Flam. Gambieras +2"
	}
    sets.engaged.SomeAcc = {ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Brutal Earring",ear2="Sherida Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Regal Ring",ring2="Niqmaddu Ring",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.Acc = {ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Digni. Earring",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Ramuh Ring +1",ring2="Niqmaddu Ring",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.FullAcc = {ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Mache Earring +1",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Fodder = {ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Sherida Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.engaged.DT = {
		-- ammo="Aurgelmir Orb +1",
		ammo="Coiste Bodhar",
		head="Hjarrandi Helm",
		body="Sulevia's Plate. +2",
		hands="Sulev. Gauntlets +2",
		legs="Sulev. Cuisses +2",
		feet="Sulev. Leggings +2",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring",
		left_ring="Defending Ring",
		right_ring="Niqmaddu Ring",
		back=gear.da_jse_back
	}
    sets.engaged.AM = {}
    sets.engaged.AM.SomeAcc = {}
	sets.engaged.AM.Acc = {}
    sets.engaged.AM.FullAcc = {}
    sets.engaged.AM.Fodder = {}
	
    sets.engaged.PDT = {}
    sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
    sets.engaged.FullAcc.PDT = {}
    sets.engaged.Fodder.PDT = {}
	
    sets.engaged.AM.PDT = {}
    sets.engaged.AM.SomeAcc.PDT = {}
	sets.engaged.AM.Acc.PDT = {}
    sets.engaged.AM.FullAcc.PDT = {}
    sets.engaged.AM.Fodder.PDT = {}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(5, 13)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 10)
    elseif player.sub_job == 'BLU' then
        set_macro_page(2, 13)
    else
        set_macro_page(5, 13)
    end
end