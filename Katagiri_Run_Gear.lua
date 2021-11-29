function user_job_setup()

	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoTankMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoNukeMode","AutoStunMode","AutoDefenseMode",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","Stance","IdleMode","Passive","RuneElement","PhysicalDefenseMode","MagicalDefenseMode","ResistDefenseMode","CastingMode","TreasureMode",})
	state.OffenseMode:options('Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.HybridMode:options('Normal','DTLite','Tank')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.AutoBuffMode:options('Off','Auto','AutoMelee','AutoAOE')
	state.CastingMode:options('Normal','SIRD')
	state.PhysicalDefenseMode:options('PDT_HP','PDT')
	state.MagicalDefenseMode:options('MDT_HP','BDT_HP','MDT','BDT')
	state.ResistDefenseMode:options('MEVA_HP','MEVA','Death','Charm','DTCharm')
	state.IdleMode:options('Normal','Tank','KiteTank','Sphere')
	state.Weapons:options('None','Epeolatry','Lionheart','Aettir','DualWeapons')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	gear.enmity_jse_back = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Damage taken-5%',}}
	gear.stp_jse_back = { name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.da_jse_back = {name="Ogma's cape",augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10', 'Damage taken-5%',}}
	gear.dex_wsd_jse_back = {name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
	gear.parry_jse_back = { name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Parrying rate+5%',}}


	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^` gs c RuneElement')
	send_command('bind @pause gs c toggle AutoRuneMode')
	send_command('bind !pause gs c cycle AutoBuffMode') --Automatically keeps certain buffs up, job-dependant.
	send_command('bind ^delete input /ma "Foil" <me>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
	send_command('bind ^\\\\ input /ma "Protect IV" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ gs c buffup Full')
	send_command('bind ^backspace input /ja "Lunge" <t>')
	send_command('bind @backspace input /ja "Gambit" <t>')
	send_command('bind !backspace input /ja "Rayke" <t>')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind !r gs c weapons Lionheart;gs c update')

	autows = 'Dimidiation'
	autowstp = 1250
	autofood = 'Grape Daifuku'

	select_default_macro_book()
end

function init_gear_sets()

    sets.Enmity = {
		main="Epeolatry",
		sub="Utu Grip",
        ammo="Aqreaqa Bomblet",
		head="Halitus Helm",
		body="Emet harness +1",
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Moonlight Necklace",
		waist="Warwolf belt",
		ear1="Friomisi Earring",
		ear2="Cryptic Earring",
		ring1="Supershear Ring",
		ring2="Eihwaz Ring",
		back=gear.enmity_jse_back
    }
		 
    sets.Enmity.SIRD = {main="Epeolatry",sub="Utu Grip",ammo="Staunch Tathlum +1",
		head="Agwu's Cap",neck="Moonlight Necklace",ear1="Friomisi Earring",ear2="Cryptic Earring",
		body="Emet Harness +1",hands="Rawhide Gloves",ring1="Supershear Ring",ring2="Eihwaz Ring",
		back=gear.enmity_jse_back,waist="Audumbla Sash",legs="Carmine Cuisses +1",feet=gear.taeon_phalanx_feet}
		
    sets.Enmity.SIRDT = {main="Epeolatry",sub="Utu Grip",ammo="Staunch Tathlum +1",
        head="Agwu's Cap",neck="Moonlight Necklace",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Nyame Mail",hands="Rawhide Gloves",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back=gear.enmity_jse_back,waist="Audumbla Sash",legs="Carmine Cuisses +1",feet=gear.taeon_phalanx_feet}

    sets.Enmity.DT = {
		main="Epeolatry",
		sub="Utu Grip",
        ammo="Staunch Tathlum +1",
		head="Halitus Helm",
		body="Emet Harness +1",
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Futhark Torque +1",
		waist="Warwolf belt",
		ear1="Odnowa Earring +1",
		ear2="Cryptic Earring",
		ring1="Defending Ring",
		ring2="Eihwaz Ring",
		back=gear.enmity_jse_back
    }
		
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
	sets.precast.JA['Vallation'] = set_combine(sets.Enmity, {body="Runeist's Coat +3",legs="Futhark Trousers +2",back=gear.RUN_FC_Cape})    
	sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity, {feet="Runeist Bottes +1"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity, {head="Fu. Bandeau +2"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity, {body="Futhark Coat +3"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons +2"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity, {hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{back="Evasionist's Cape"})
    sets.precast.JA['One for All'] = set_combine(sets.Enmity, {
		ammo="Staunch Tathlum +1",
	    head="Runeist's Bandeau +2", --99
        body="Runeist's Coat +3", --208
        hands="Turms Mittens +1", --74
        legs="Futhark Trousers +2", --87
		feet="Runeist Bottes +1", --64
        neck="Unmoving Collar +1", --6/6
        ear1="Odnowa Earring +1", --100
		ear2="Tuisto Earring",
		ring2="Moonlight Ring", --70
        ring1="Gelatinous Ring +1", --110
        back=gear.enmity_jse_back, --6/6
        waist="Flume Belt +1",
    })
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist's Coat +3", legs="Futhark Trousers +2"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist's Boots +1"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Fu. Bandeau +2"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +3"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist's Mitons +2"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One for All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {
		ammo="Seeth. Bomblet +1",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
        ear1="Hecate's Earring", --6
        ear2="Friomisi Earring", --10
		neck="Sanctity Necklace",
		--ring1="Stikini Ring +1",
		ring2="Acumen Ring",
        --ring2="Fenrir Ring +1",
        back="Evasionist's Cape",
        waist="Eschan Stone",
    }
	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = set_combine(sets.Enmity, {
        head="Erilaz Galea +1",
        legs="Runeist Trousers +1",
        neck="Incanter's Torque",
        --ring1="Stikini Ring +1",
		--ring2="Stikini Ring +1",
        --waist="Bishop's Sash",
        --back="Altruistic Cape",
    })
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonbeam Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {
		ammo="Staunch Tathlum +1",
		head="Rune. Bandeau +2",
		neck="Voltsurge Torque",
		ear1="Etiolation Earring",
		ear2="Loquac. Earring",
		body="Agwu's Robe",
		hands="Agwu's Gages",
		ring1="Gelatinous Ring +1",
		ring2="Moonlight Ring",
        back=gear.enmity_jse_back,
		waist="Audumbla Sash",
		legs="Ayanmo Cosciales +2",
		feet="Carmine Greaves"
	}
			
	sets.precast.FC.DT = {
		ammo="Staunch Tathlum +1",
        head="Rune. Bandeau +2",
		neck="Futhark Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Tuisto Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Gelatinous Ring +1",
		ring2="Moonlight Ring",
        back=gear.enmity_jse_back,
		waist="Audumbla Sash",
		legs="Futhark Trousers +2",
		feet="Carmine Greaves"
	}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +2"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga Beads'})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {
        ammo="Knobkierrie",
        head="Herculean Helm",
        body="Adhemar Jacket +1",
		hands="Meg. Gloves +2",
        legs="Meg. Chausses +2",
		feet=gear.herculean_wsd_feet,
        neck="Caro Necklace",
        ear1="Moonshade Earring",
        ear2="Ishvara Earring",
		ring1="Ilabrat Ring",
		ring2="Niqmaddu Ring",
		back=gear.dex_wsd_jse_back,
        waist="Fotia Belt",
    }
	sets.precast.WS.SomeAcc = {
		-- ammo="Voluspa Tathlum",
        head="Adhemar Bonnet +1",
		neck="Light Gorget",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
        body="Ayanmo Corazza +1",
		hands="Meg. Gloves +2",
		ring1="Ilabrat Ring",
		ring2="Niqmaddu Ring",
        back=gear.da_jse_back,
		waist="Fotia Belt",
		legs="Meg. Chausses +2",
		feet=gear.herculean_ta_feet
	}
	-- sets.precast.WS.Acc = {ammo="C. Palug Stone",
    --         head="Dampening Tam",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
    --         body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
    --         back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	-- sets.precast.WS.HighAcc = {ammo="C. Palug Stone",
    --         head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Telos Earring",ear2="Sherida Earring",
    --         body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
    --         back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}
	-- sets.precast.WS.FullAcc = {ammo="C. Palug Stone",
    --         head="Carmine Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Mache Earring +1",
    --         body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
    --         back=gear.stp_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {
		ammo="Seething Bomblet +1",
		body="Adhemar Jacket +1",
		head="Adhemar Bonnet +1",
		hands="Adhemar Wristbands +1",
		neck="Light Gorget",
		feet="Lustratio Leggings +1",
		waist="Fotia Belt",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		ring1="Epona's Ring",
		ring2="Niqmaddu Ring",
		back=gear.da_jse_back

	})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
        head=gear.herculean_wsd_head,
        --body=gear.herculean_wsd_body,
		back=gear.dex_wsd_jse_back,
		hands="Meg. Gloves +2",
		ring1="Ilabrat Ring",
		ring2="Niqmaddu Ring",
		legs="Lustratio Subligar +1",
		feet="Lustratio Leggings +1"
	})
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{head="Lilitu Headpiece",legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {
        ammo="Staunch Tathlum +1",
		head="Rune. Bandeau +2",
		neck="Voltsurge Torque",
		ear1="Etiolation Earring",
		ear2="Loquac. Earring",
		body="Agwu's Robe",
		hands="Agwu's Gages",
		ring1="Gelatinous Ring +1",
		ring2="Moonlight Ring",
        back=gear.enmity_jse_back,
		waist="Audumbla Sash",
		legs="Ayanmo Cosciales +2",
		feet="Carmine Greaves"
    }

	sets.midcast.FastRecast.DT = {
		ammo="Staunch Tathlum +1",
		head="Rune. Bandeau +2",
		neck="Voltsurge Torque",
		ear1="Etiolation Earring",
		ear2="Loquac. Earring",
		body="Agwu's Robe",
		hands="Agwu's Gages",
		ring1="Gelatinous Ring +1",
		ring2="Moonlight Ring",
        back=gear.enmity_jse_back,
		waist="Audumbla Sash",
		legs="Ayanmo Cosciales +2",
		feet="Carmine Greaves"
	}
		
	sets.midcast.FastRecast.SIRD = {ammo="Staunch Tathlum +1",
		head="Agwu's Cap",neck="Moonlight Necklace",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Emet Harness +1",hands="Rawhide Gloves",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Audumbla Sash",legs="Carmine Cuisses +1",feet=gear.taeon_phalanx_feet}

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{
		head="Erilaz Galea +1",
		neck="Incanter's Torque",
		ear1="Odnowa Earring +1",
		ear2="Mimir Earring",
		body="Nyame Mail",
		hands="Runeist's Mitons +2",
		back="Merciful Cape",
		-- waist="Olympus Sash",
		legs="Futhark Trousers +2"
	})
	sets.midcast['Enhancing Magic'].SIRD = set_combine(sets.midcast.FastRecast.SIRD,{})
	sets.midcast['Enhancing Magic'].DT = set_combine(sets.Enmity.SIRDT,{})
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{main="Deacon Sword",head="Futhark Bandeau +2",body=gear.taeon_phalanx_body,hands=gear.taeon_phalanx_hands,legs=gear.herculean_phalanx_legs,feet=gear.taeon_phalanx_feet})
	sets.midcast['Phalanx'].SIRD = set_combine(sets.midcast['Enhancing Magic'].SIRD,{})
	sets.midcast['Phalanx'].DT = set_combine(sets.Enmity.SIRDT,{})
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head="Rune. Bandeau +2",neck="Sacro Gorget"}) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +1"}) 
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
	sets.midcast.Foil.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Jettatura = set_combine(sets.Enmity, {})
	sets.midcast.Jettatura.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.SIRDT, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {
        ammo="Staunch Tathlum +1",
        --head=gear.Herc_DT_head,
        --body="Vrikodara Jupon", -- 13
        hands="Buremte Gloves", --(13)
        legs="Aya. Cosciales +2",
        --feet="Skaoi Boots", --7
        --neck="Phalaina Locket", -- 4(4)
		neck="Incanter's Torque",
        --ear1="Roundel Earring", -- 5
        --ear2="Mendi. Earring", -- 5
		--ring1="Stikini Ring +1",
        --ring2="Stikini Ring +1",
        --back="Solemnity Cape", -- 7
        waist="Gishdubar Sash", --(10)
    }
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Erilaz Galea +1"})
	sets.Phalanx_Received = {main="Deacon Sword",head="Futhark Bandeau +2",body=gear.taeon_phalanx_body,hands=gear.taeon_phalanx_hands,legs=gear.herculean_phalanx_legs,feet=gear.taeon_phalanx_feet}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {
		main="Epeolatry",
		sub="Utu Grip",
        ammo="Homiliary",
		head="Nyame Helm",
		body="Runeist's Coat +3",
		hands="Turms Mittens +1",
		legs="Nyame Flanchard",
		feet="Turms Leggings +1",
		neck="Futhark Torque +1",
		waist="Flume Belt +1",
		ear1="Odnowa Earring +1",
		ear2="Tuisto Earring",
		ring1="Gelatinous Ring +1",
		ring2="Moonlight Ring",
		back=gear.enmity_jse_back,
    }
		
    sets.idle.Sphere = set_combine(sets.idle,{body="Mekosu. Harness"})
			
	sets.idle.Tank = {
		main="Epeolatry",
		sub="Utu Grip",
		ammo="Staunch Tathlum +1",
        head="Nyame Helm",
		neck="Futhark Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Tuisto Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Gelatinous Ring +1",
		ring2="Moonlight Ring",
        back=gear.enmity_jse_back,
		waist="Engraved Belt",
		legs="Nyame Flanchard",
    	feet="Nyame Sollerets"
	}

	sets.idle.KiteTank = {
		main="Epeolatry",
		sub="Utu Grip",
		ammo="Staunch Tathlum +1",
        head="Nyame Helm",
		neck="Futhark Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Ethereal Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Defending Ring",
		ring2="Moonlight Ring",
        back=gear.enmity_jse_back,
		waist="Engraved Belt",
		legs="Carmine Cuisses +1",
		feet="Nyame Sollerets"
	}

	sets.idle.Weak = {
		main="Epeolatry",
		sub="Utu Grip",
		ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		neck="Futhark Torque +1",
		ear1="Etiolation Earring",
		ear2="Ethereal Earring",
		body="Runeist's Coat +3",
		-- hands=gear.herculean_refresh_hands,
		ring1="Defending Ring",
		ring2="Moonlight Ring",
		back=gear.enmity_jse_back,
		waist="Flume Belt +1",
		legs="Rawhide Trousers",
		-- feet=gear.herculean_refresh_feet
	}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Ethereal Earring",body="Erilaz Surcoat +1",waist="Flume Belt +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Epeolatry = {main="Epeolatry",sub="Utu Grip"}
	sets.weapons.Aettir = {main="Aettir",sub="Utu Grip"}
	sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Firangi",sub="Reikiko"}
	
	-- Defense Sets
	
	sets.defense.PDT = {
		main="Epeolatry",
		sub="Utu Grip",
        ammo="Staunch Tathlum +1", --2/2
		head="Nyame Helm",
        body="Nyame Mail", --9/9
		hands="Turms Mittens +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Futhark Torque +1",
		waist="Flume Belt +1",
		ear1="Etiolation Earring",
		ear2="Ethereal Earring",
		ring1="Defending Ring",
		ring2="Moonlight Ring",
		back=gear.enmity_jse_back
    }
	sets.defense.PDT_HP = {
		main="Epeolatry",
		sub="Utu Grip",
        ammo="Staunch Tathlum +1",
		head="Nyame Helm",
        body="Nyame Mail", --208
        hands="Nyame Gauntlets", --74
        legs="Nyame Flanchard", --87
		feet="Nyame Sollerets",
        neck="Futhark Torque +1", --6/6
        ear1="Odnowa Earring +1", --100
        ear2="Tuisto Earring", --100
		ring1="Gelatinous Ring +1", --110
        ring2="Moonlight Ring", --10/10
        back=gear.enmity_jse_back,
		waist="Flume Belt +1",
    }
	sets.defense.MDT = {
        ammo="Staunch Tathlum +1", --2/2
        head="Warder's Charm +1", --6/0
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
		neck="Futhark Torque +1", --6/6
        ear1="Etiolation Earring", --0/3
        ear2="Odnowa Earring +1", --0/2
        ring1="Defending Ring", --5/5
		ring2="Moonlight Ring", --10/10
		back=gear.enmity_jse_back,        
        waist="Engraved Belt", --4/0
    }
	sets.defense.MDT_HP = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Futhark Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Runeist's Coat +3",hands="Nyame Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	sets.defense.BDT = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Runeist's Coat +3",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.enmity_jse_back,waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	sets.defense.BDT_HP = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Runeist's Coat +3",hands="Nyame Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	sets.defense.MEVA = {
		main="Aettir",
		sub="Utu Grip",
		ammo="Yamarang",
		head="Nyame Helm",
		neck="Futhark Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Etiolation Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Defending Ring",
		ring2="Moonlight Ring",
        back=gear.enmity_jse_back,
		waist="Engraved Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
	}
	sets.defense.MEVA_HP = {
		main="Aettir",
		sub="Utu Grip",
		ammo="Yamarang",
		head="Nyame Helm",
		neck="Futhark Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Tuisto Earring",
        body="Runeist's Coat +3",
		hands="Nyame Gauntlets",
		ring1="Gelatinous Ring +1",
		ring2="Moonlight Ring",
        back=gear.enmity_jse_back,
		waist="Engraved Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
	}
		
	sets.defense.Death = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Futhark Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Runeist's Coat +3",hands="Nyame Gauntlets",ring1="Shadow Ring",ring2="Warden's Ring",
		back=gear.enmity_jse_back,waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.DTCharm = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Runeist's Coat +3",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
		back=gear.enmity_jse_back,waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.defense.Charm = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Runeist's Coat +3",hands="Nyame Gauntlets",ring1="Purity Ring",ring2="Vengeful Ring",
		back=gear.enmity_jse_back,waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Sherida Earring"}
	sets.AccMaxTP = {ear1="Moonshade Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {
		main="Epeolatry",
		sub="Utu Grip",
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Samnuha Tights",
		feet="Carmine Greaves",
		neck="Anu Torque",
		waist="Sailfi Belt +1",
		ear1="Sherida Earring",
		ear2="Telos Earring",
		ring1="Epona's Ring",
		ring2="Niqmaddu Ring",
		back=gear.stp_jse_back
    }
    sets.engaged.SomeAcc = set_combine(sets.engaged, {ammo="Yamarang",head="Ayanmo Zucchetto +2"})
	sets.engaged.Acc = set_combine(sets.engaged, {
		ammo="Yamarang",
		legs="Meghanada Chausses +2", --+29
		waist="Kentarch Belt +1", --+2
    })
	sets.engaged.HighAcc = set_combine(sets.engaged, {
		-- neck="Combatant's Torque", --+10
		ring1="Chirich Ring +1",
		ring2="Moonlight Ring", --+8
    })
	sets.engaged.FullAcc = set_combine(sets.engaged, {
		-- neck="Combatant's Torque", --+10
		ring1="Chirich Ring +1",
		ring2="Moonlight Ring", --+8
    })
    sets.engaged.DTLite = {
		main="Epeolatry",
		sub="Utu Grip",
		ammo="Staunch Tathlum +1", --2
		head="Ayanmo Zucchetto +2", --3
		body="Ayanmo Corazza +2", --6
		hands="Nyame Gauntlets",
		legs="Meg. Chausses +2",
		feet="Nyame Sollerets",
		neck="Anu Torque",
		waist="Sailfi Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Defending Ring", --4
		right_ring="Moonlight Ring", --10
		back=gear.stp_jse_back
	}
    -- sets.engaged.SomeAcc.DTLite = {
	-- 	main="Lionheart",
	-- 	sub="Utu Grip",
	-- 	ammo="C. Palug Stone",
    -- 	head="Aya. Zucchetto +1",
	-- 	neck="Futhark Torque +1",
	-- 	ear1="Cessance Earring",
	-- 	ear2="Sherida Earring",
    -- 	body="Ayanmo Corazza +1",
	-- 	hands="Meg. Gloves +2",
	-- 	ring1="Defending Ring",
	-- 	ring2="Patricius Ring",
    --  back="Moonbeam Cape",
	-- 	waist="Windbuffet Belt +1",
	-- 	legs="Meg. Chausses +2",
	-- 	feet="Ahosi Leggings"
	-- }
	sets.engaged.SomeAcc.DTLite = {
		main="Epeolatry",
		sub="Utu Grip",
		ammo="Seething Bomblet +1",
		head="Rune. Bandeau +2",
		neck="Anu Torque",
		ear1="Telos Earring",
		ear2="Sherida Earring",
		body="Runeist's Coat +3",
		hands="Turms Mittens +1",
		ring1="Ilabrat Ring",
		ring2="Petrov Ring",
		back=gear.stp_jse_back,
		waist="Kentarch Belt +1",
		legs="Aya. Cosciales +2",
		feet="Meg. Jam. +2"
	}
	-- sets.engaged.Acc.DTLite = {main="Lionheart",sub="Utu Grip",ammo="C. Palug Stone",ammo="C. Palug Stone",
    --         head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
    --         body="Ayanmo Corazza +1",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
    --         back="Moonbeam Cape",waist="Grunfeld Rope",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
	-- sets.engaged.HighAcc.DTLite = {main="Lionheart",sub="Utu Grip",ammo="C. Palug Stone",
    --         head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
    --         body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
    --         back="Moonbeam Cape",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
	-- sets.engaged.FullAcc.DTLite = {main="Lionheart",sub="Utu Grip",ammo="C. Palug Stone",
    --         head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Mache Earring +1",
    --         body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
    --         back="Moonbeam Cape",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
    sets.engaged.Tank = {
		main="Epeolatry",
		sub="Refined Grip +1",
        ammo="Staunch Tathlum +1", --2/2
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Turms Mittens +1",
		legs="Nyame Flanchard",
		feet="Turms Leggings +1",
		neck="Futhark Torque +1",
		waist="Engraved Belt",
		ear1="Odnowa Earring +1",
		ear2="Cryptic Earring",
		ring1="Defending Ring",
		ring2="Moonlight Ring",
		back=gear.parry_jse_back
    }
	sets.engaged.Tank_HP = {
		main="Epeolatry",
		sub="Utu Grip",
        ammo="Staunch Tathlum +1",
        head="Runeist's Bandeau +2", --99
        body="Runeist's Coat +3", --208
        hands="Turms Mittens +1", --74
        legs="Futhark Trousers +2", --87
		feet="Runeist Bottes +1", --64
        neck="Futhark Torque +1", --6/6
        ear1="Odnowa Earring +1", --100
        ear2="Tuisto Earring", --100
		ring1="Gelatinous Ring +1", --110
        ring2="Moonlight Ring", --70
		back=gear.enmity_jse_back,
		waist="Flume Belt +1",
    }
    sets.engaged.SomeAcc.Tank = set_combine(sets.engaged.Tank, {
        ammo="Yamarang",
		head="Ayanmo Zucchetto +2",
    })
	sets.engaged.Acc.Tank = set_combine(sets.engaged.Tank, {
		legs="Meghanada Chausses +2", --+29
		waist="Kentarch Belt +1", --+2
    })
	sets.engaged.HighAcc.Tank = set_combine(sets.engaged.Tank, {
		-- neck="Combatant's Torque", --+10
		ring1="Chirich Ring +1",
		ring2="Moonlight Ring", --+8
    })
	sets.engaged.FullAcc.Tank = set_combine(sets.engaged.Tank, {
		-- neck="Combatant's Torque", --+10
		ring1="Chirich Ring +1",
		ring2="Moonlight Ring", --+8
    })
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {
		-- ring1="Eshmun's Ring", 
		-- ring2="Eshmun's Ring", 
		waist="Gishdubar Sash"
	})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Battuta = {hands="Turms Mittens +1",back=gear.parry_jse_back,feet="Futhark Boots +3"}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(1, 6)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 6)
	elseif player.sub_job == 'SCH' then
		set_macro_page(1, 6)
	elseif player.sub_job == 'BLU' then
		set_macro_page(1, 6)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 6)
	elseif player.sub_job == 'SAM' then
		set_macro_page(1, 6)
	elseif player.sub_job == 'DRK' then
		set_macro_page(1, 6)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 6)
	else
		set_macro_page(1, 6)
	end
end

function user_job_lockstyle()
	if state.Weapons.value == 'Lionheart' then
		windower.chat.input('/lockstyleset 001')
	else
		windower.chat.input('/lockstyleset 001')
	end
end

--Job Specific Trust Overwrite
buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	When='Combat'},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	When='Always'},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	When='Always'},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	When='Idle'},
		{Name='Cocoon',		Buff='Defense Boost',	SpellID=547,	When='Idle'},
	},

	AutoMelee = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	When='Always'},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	When='Idle'},
	},

	AutoAOE = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	When='Idle'},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	When='Always'},
		{Name='Cocoon',		Buff='Defense Boost',	SpellID=547,	When='Idle'},
	},

	Default = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
	},
	
	Tank = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Cocoon',		Buff='Defense Boost',	SpellID=547,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
	},
	
	Full = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',		Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Regen IV',	Buff='Regen',			SpellID=477,	Reapply=false},
	},

	Melee = {
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',		Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Regen IV',	Buff='Regen',			SpellID=477,	Reapply=false},
	},
}

autows_list = {
	['Aettir']='Dimidiation',
	['Epeolatry']='Dimidiation',
	['Lionheart']='Resolution'
}
