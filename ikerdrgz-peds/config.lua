ZConfig = {
    enable_thread = true, -- Enable thread if close to ped and press a key, do a event?
    thread_ms = 1000, -- If ZConfig.enable_thread set the thread wait to this value.
    interact_dist = 1.5, -- If enable_thread, the distance between player ped and the created ped needed to interact.

    peds = {
        --[[ [0] = {
            model = 'ped_model', -- The ped model (https://docs.fivem.net/docs/game-references/ped-models/)
            coords = vec4(), -- The coordinates in which the ped will be
            weapon = '', -- The weapon that the ped will have in the equipped, if you don't want a weapon, set 'WEAPON_UNARMED' (https://wiki.rage.mp/index.php?title=Weapons)
            event = 'ikerdrgz-redzone:open', -- The event that will be triggered when you press E.
            
            text = 'Text' -- The text to be displayed on the ped.
        }, ]]
        [1] = {
            model = 'cs_jimmydisanto',
            coords = vec4(-420.5552, 1119.1331, 325.8589, 345.8885),
            weapon = 'WEAPON_CARBINERIFLE_MK2',
            event = 'ikerdrgz-redzone:open',
            text = 'Redzone'
        },

        [2] = {
            model = 'csb_ramp_marine',
            coords = vec4(-432.1169, 1122.2983, 325.8602, 342.4458),
            weapon = 'weapon_combatpdw',
            event = 'ikerdrgz-match:open',
            text = 'Match'
        },
    },
}