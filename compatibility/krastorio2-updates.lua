--skipping if Krastorio2 not present
if not mods["Krastorio2"] then
    return
end

-- recipe changes
if not settings.startup["disable-spidertronmk2"].value then
    data.raw["recipe"]["spidertronmk2"].ingredients = {
        {type = "item", name = "spidertron", amount = 1},
        {type = "item", name = "processing-unit", amount = 50},
        {type = "item", name = "speed-module-3", amount = 30},
        {type = "item", name = "efficiency-module-3", amount = 30},
        {type = "item", name = "low-density-structure", amount = 150},
        {type = "item", name = "kr-fusion-reactor-equipment", amount = 2}
    }
end

if not settings.startup["disable-immolator"].value then
    data.raw["recipe"]["immolator"].ingredients = {
        {type = "item", name = "spidertron", amount = 1},
        {type = "item", name = "processing-unit", amount = 50},
        {type = "item", name = "speed-module-3", amount = 30},
        {type = "item", name = "efficiency-module-3", amount = 30},
        {type = "item", name = "low-density-structure", amount = 150},
        {type = "item", name = "kr-fusion-reactor-equipment", amount = 2}
    }
end

if not settings.startup["disable-spidertronmk3"].value then
    data.raw["recipe"]["spidertronmk3"].category = "crafting-with-fluid"
    local ingr = {
        {type = "item", name = "spidertron",amount = 1},
        {type = "item", name = "kr-ai-core", amount = 50},
        {type = "item", name = "kr-imersite-crystal", amount = 25},
        -- {"fluid-kr-nitric-acid", 125},
        {
            type="fluid", 
            name="kr-nitric-acid", 
            amount=125, 
            catalyst_amount = 125
        },
        {type = "item", name = "kr-heavy-rocket-launcher", amount = 4},
        {type = "item", name = "kr-imersium-plate", amount = 100},
        {type = "item", name = "kr-fusion-reactor-equipment", amount = 2}
    }
    -- if spidertronmk2 not disabled use this recipe
    if not settings.startup["disable-spidertronmk2"].value then
        ingr = {
            {type = "item", name = "spidertronmk2", amount = 1},
            {type = "item", name = "kr-ai-core", amount = 50},
            {type = "item", name = "kr-imersite-crystal", amount = 25},
            -- {"fluid-kr-nitric-acid", 125},
            {
                type="fluid", 
                name="kr-nitric-acid", 
                amount=125, 
                catalyst_amount = 125
            },
            {type = "item", name = "kr-heavy-rocket-launcher", amount = 4},
            {type = "item", name = "kr-imersium-plate", amount = 100},
            {type = "item", name = "kr-fusion-reactor-equipment", amount = 2}
        }
    end
    data.raw["recipe"]["spidertronmk3"].ingredients = ingr
end



if not settings.startup["disable-spidertron-builder"].value then
    if settings.startup["kr-containers"].value then
        data.raw["recipe"]["spidertron-builder"].ingredients = {
            {type = "item", name = "kr-ai-core", amount = 1},
            {type = "item", name = "processing-unit", amount = 16},
            {type = "item", name = "low-density-structure", amount = 150},
            {type = "item", name = "productivity-module-3", amount = 2},
            {type = "item", name = "kr-strongbox", amount = 10},
            {type = "item", name = "construction-robot", amount = 50},
            {type = "item", name = "radar", amount = 5}
        }
    else
        data.raw["recipe"]["spidertron-builder"].ingredients = {
            {type = "item", name = "kr-ai-core", amount = 1},
            {type = "item", name = "rocket-control-unit", amount = 16},
            {type = "item", name = "low-density-structure", amount = 150},
            {type = "item", name = "productivity-module-3", amount = 2},
            {type = "item", name = "steel-chest", amount = 10},
            {type = "item", name = "construction-robot", amount = 50},
            {type = "item", name = "radar", amount = 5}
        }
    end
end

--major spidertron changes
if not settings.startup["disable-major-spidertron"].value then
    data.raw["recipe"]["major-spidertron"].ingredients = {
        {type = "item", name = "spidertron", amount = 1},
        {type = "item", name = "processing-unit", amount = 50},
        {type = "item", name = "speed-module-3", amount = 30},
        {type = "item", name = "efficiency-module-3", amount = 30},
        {type = "item", name = "low-density-structure", amount = 150},
        {type = "item", name = "kr-fusion-reactor-equipment", amount = 2}
    }
end