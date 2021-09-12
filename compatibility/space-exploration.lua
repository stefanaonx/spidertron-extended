-- Checking for mod
if not mods["space-exploration"] then
    return
end

-- Prevent Space Exploration from breaking our tech changes
table.insert(se_prodecural_tech_exclusions, "spidertron")
data.raw["technology"]["spidertron"].unit = {
    count = 1000,
    ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"se-rocket-science-pack", 1},
        {"se-biological-science-pack-1", 1},
        {"se-material-science-pack-1", 1}
    },
    time = 30
}

-- Bump up spidertron equipment grid
data.raw["equipment-grid"]["spidertron-equipment-grid"].width = 10
data.raw["equipment-grid"]["spidertron-equipment-grid"].height = 8


if not settings.startup["disable-spidertronmk2"].value then
    -- Recipe changes
    data.raw["recipe"]["spidertronmk2"].ingredients = {
        {"spidertron", 1},
        {"low-density-structure", 150},
        {"se-rtg-equipment-2", 4},
        {"rocket-control-unit", 20},
        {"se-heavy-composite", 20},
        {"se-experimental-specimen", 1}
    }

    -- Tech changes
    data.raw["technology"]["spidertronmk2-tech"].prerequisites = {
        "spidertron",
        "se-biological-science-pack-3",
        "se-heavy-composite",
        "se-rtg-equipment-2"
    }
    data.raw["technology"]["spidertronmk2-tech"].unit = {
        count = 2500,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"military-science-pack", 1},
            {"chemical-science-pack", 1},
            {"utility-science-pack", 1},
            {"se-rocket-science-pack", 1},
            {"se-biological-science-pack-3", 1},
            {"se-material-science-pack-3", 1},
            {"se-energy-science-pack-1", 1}
        },
        time = 30
    }
end

if not settings.startup["disable-spidertron-builder"].value then
    -- Recipe changes
    data.raw["recipe"]["spidertron-builder"].ingredients = {
        {"spidertronmk2", 1},
        {"low-density-structure", 150},
        {"se-rtg-equipment-2", 4},
        {"rocket-control-unit", 20},
        {"se-aeroframe-bulkhead", 20},
        {"se-cargo-rocket-cargo-pod", 10}
    }

    -- Tech changes
    data.raw["technology"]["spidertron-builder-tech"].prerequisites = {
        "spidertronmk2-tech",
        "se-aeroframe-bulkhead"
    }
    data.raw["technology"]["spidertron-builder-tech"].unit = {
        count = 3000,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"military-science-pack", 1},
            {"chemical-science-pack", 1},
            {"utility-science-pack", 1},
            {"se-rocket-science-pack", 1},
            {"se-biological-science-pack-3", 1},
            {"se-material-science-pack-3", 1},
            {"se-astronomic-science-pack-3", 1},
            {"se-energy-science-pack-1", 1}
        },
        time = 30
    }
end

if not settings.startup["disable-immolator"].value then
    -- Recipe changes
    data.raw["recipe"]["immolator"].ingredients = {
        {"spidertronmk2", 1},
        {"low-density-structure", 150},
        {"se-rtg-equipment-2", 4},
        {"rocket-control-unit", 20},
        {"se-plasma-canister", 40}
    }

    -- Tech changes
    data.raw["technology"]["immolator-tech"].prerequisites = {
        "spidertronmk2-tech",
        "se-superconductive-cable"
    }
    data.raw["technology"]["immolator-tech"].unit = {
        count = 3000,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"military-science-pack", 1},
            {"chemical-science-pack", 1},
            {"utility-science-pack", 1},
            {"se-rocket-science-pack", 1},
            {"se-biological-science-pack-3", 1},
            {"se-material-science-pack-3", 1},
            {"se-energy-science-pack-3", 1}
        },
        time = 30
    }
end

if not settings.startup["disable-spidertronmk3"].value then
    -- Recipe changes
    data.raw["recipe"]["spidertronmk3"].ingredients = {
        {"spidertronmk2", 1},
        {"low-density-structure", 150},
        {"fusion-reactor-equipment", 4},
        {"se-naquium-processor", 1},
        {"se-nanomaterial", 20},
        {"se-significant-specimen", 1}
    }

    -- Tech changes
    data.raw["technology"]["spidertronmk3-tech"].prerequisites = {
        "spidertronmk2-tech",
        "se-biological-science-pack-3",
        "se-heavy-composite",
        "se-rtg-equipment-2"
    }
    data.raw["technology"]["spidertronmk3-tech"].unit = {
        count = 5000,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"military-science-pack", 1},
            {"chemical-science-pack", 1},
            {"utility-science-pack", 1},
            {"se-rocket-science-pack", 1},
            {"se-astronomic-science-pack-4", 1},
            {"se-biological-science-pack-4", 1},
            {"se-material-science-pack-4", 1},
            {"se-energy-science-pack-4", 1},
            {"se-deep-space-science-pack-3", 1}
        },
        time = 30
    }
end
