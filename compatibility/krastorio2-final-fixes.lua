if mods["Krastorio2"] then
    -- trying to change so that vanilla spidertron
    -- doesn't use burner for krastorio on setting
    if settings.startup["disable-krastorio-spidertron-burner"].value then
        data.raw["spider-vehicle"]["spidertron"].energy_source = data.raw["spider-vehicle"]["spidertronmk2"].energy_source
        data.raw["spider-vehicle"]["spidertron"].movement_energy_consumption = data.raw["spider-vehicle"]["spidertronmk2"].movement_energy_consumption
    end
    -- copying the grid equipment here since the variables are available here
    data.raw["equipment-grid"]["spidertronmk2-grid"].equipment_categories = data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].equipment_categories
    data.raw["equipment-grid"]["spidertronmk3-grid"].equipment_categories = data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].equipment_categories
    data.raw["equipment-grid"]["spidertron-builder-grid"].equipment_categories = data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].equipment_categories
    data.raw["equipment-grid"]["immolator-grid"].equipment_categories = data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].equipment_categories
    data.raw["equipment-grid"]["major-spidertron-grid"].equipment_categories = data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].equipment_categories

    -- now adjust the grid size
    local vanilla_grid_width = settings.startup["vanilla-spidertron-width"].value
    local vanilla_grid_height = settings.startup["vanilla-spidertron-height"].value

    if vanilla_grid_width ~= 0 then
        data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].width = vanilla_grid_width
    end
    if vanilla_grid_height ~= 0 then
        data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].height = vanilla_grid_height
    end
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
			{type = "item", name = "radar", 5}
		}
	end
end