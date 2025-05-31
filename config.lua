Config = {}

Config.Debug = false  -- Debug mode (useful for testing; shows extra info if set to true)

Config.Stashes = { -- Regular stashes that anyone can access (no job restrictions)
    {
        coords = vec3(-1062.7104, -1471.2377, -1.1062),  -- Coordinates where the stash is located
        label = "Open Fridge",                           -- Label shown when interacting (e.g. "Open Table")
        stashId = "fridge",                              -- Unique identifier for the stash (used internally)
        slots = 60,                                      -- How many item slots the stash has
        weight = 150000                                  -- Maximum weight the stash can hold (in grams, e.g. 150kg)
    }
}

Config.JobStashes = { -- Job-restricted stashes (only accessible by players with specific job and grade)
    {
        coords = vector3(-1067.7281, -1444.0941, -1.4201), -- Coordinates for the job stash
        stashId = "police_fridge",                         -- Unique ID for the stash (e.g. fridge)
        label = "Open Fridge",                             -- Label shown when interacting (e.g. "Open Fridge")
        job = "police",                                    -- Job name required to access this stash (e.g. "police")
        grade = 0,                                         -- Minimum job grade required (0 = all employees)
        slots = 40,                                        -- Number of item slots
        weight = 80000                                     -- Max weight capacity (80kg)
    }
}
