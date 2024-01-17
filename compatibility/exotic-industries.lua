if not mods["exotic-industries"] then
    return
end

if not settings.startup["disable-spidertronmk2"].value then
    for i,v in pairs(data.raw.recipe.spidertronmk2.ingredients) do
        if v[1] == "beacon" then
            data.raw.recipe.spidertronmk2.ingredients[i][1] = "ei_copper-beacon"
        end

        if v[1] == "fusion-reactor-equipment" then
            data.raw.recipe.spidertronmk2.ingredients[i][1] = "ei_personal-reactor"
        end
    end
    data.raw.technology["spidertronmk2-tech"].prerequisites = {"spidertron", "ei_quantum-age"}
end

if not settings.startup["disable-spidertron-builder"].value then
    data.raw.technology["spidertron-builder-tech"].prerequisites = {"spidertron", "ei_quantum-age", "construction-robotics"}
end

if not settings.startup["disable-immolator"].value then
    for i,v in pairs(data.raw.recipe.immolator.ingredients) do
        if v[1] == "fusion-reactor-equipment" then
            data.raw.recipe.immolator.ingredients[i][1] = "ei_personal-reactor"
        end
    end
    data.raw.technology["immolator-tech"].prerequisites = {"spidertron", "ei_quantum-age"}
end

if not settings.startup["disable-spidertronmk3"].value then
    for i,v in pairs(data.raw.recipe.spidertronmk3.ingredients) do
        if v[1] == "beacon" then
            data.raw.recipe.spidertronmk3.ingredients[i][1] = "ei_iron-beacon"
        end
        if v[1] == "speed-module-3" then
            data.raw.recipe.spidertronmk3.ingredients[i][1] = "ei_speed-module-5"
        end

        if v[1] == "effectivity-module-3" then
            data.raw.recipe.spidertronmk3.ingredients[i][1] = "ei_effectivity-module-5"
        end

    end

    local spidertron_tech = "spidertronmk2-tech"
    if not settings.startup["disable-spidertronmk2"].value then
        spidertron_tech = "spidertron"
    end
    data.raw.technology["spidertronmk3-tech"].prerequisites = {spidertron_tech, "fusion-reactor-equipment", "ei_effectivity-module-5", "ei_speed-module-5"}
end
