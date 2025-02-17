local SS = settings.startup
local DRR = data.raw.recipe
local BobPR = mods["bobrevamp"] and mods["bobplates"]
local BobWar = mods["bobwarfare"]
local SAge = mods["space-age"]

function remove_ingredient(recipe_name, ingredient_name)
    for i, ingredient in pairs(DRR[recipe_name].ingredients) do
        if ingredient.name == ingredient_name then
            table.remove(DRR[recipe_name].ingredients, i)
        end
    end
end

DRR["spidertronmk2"].ingredients = {
    {type = "item", name = "spidertron", amount = 1},
    {type = "item", name = "concrete", amount = 40},
    {type = "item", name = "exoskeleton-equipment", amount = 2},
    {type = "item", name = "fission-reactor-equipment", amount = 2},
}
if SAge then
    table.insert(DRR["spidertronmk2"].ingredients, {type = "item", name = "carbon-fiber", amount = 50})
    table.insert(DRR["spidertronmk2"].ingredients, {type = "item", name = "supercapacitor", amount = 50})
    table.insert(DRR["spidertronmk2"].ingredients, {type = "item", name = "tungsten-carbide", amount = 50})
end
if BobWar then
    remove_ingredient("spidertronmk2", "exoskeleton-equipment")
    table.insert(DRR["spidertronmk2"].ingredients, {type = "item", name = "mech-armor-plate", amount = 35})
    table.insert(DRR["spidertronmk2"].ingredients, {type = "item", name = "mech-brain", amount =5})
    table.insert(DRR["spidertronmk2"].ingredients, {type = "item", name = "mech-leg", amount = 8})
end
if BobPR then
    remove_ingredient("spidertronmk2", "concrete")
    remove_ingredient("spidertronmk2", "fission-reactor-equipment")
    table.insert(DRR["spidertronmk2"].ingredients, {type = "item", name = "rtg", amount = 5})
    table.insert(DRR["spidertronmk2"].ingredients, {type = "item", name = "heat-shield-tile", amount = 40})
    table.insert(DRR["spidertronmk2"].ingredients, {type = "item", name = "bob-titanium-gear-wheel", amount = 50})
    table.insert(DRR["spidertronmk2"].ingredients, {type = "item", name = "bob-aluminium-plate", amount = 50})
end

DRR["spidertronmk3"].category = "crafting-with-fluid"
if SS["disable-spidertronmk2"].value == false then
    DRR["spidertronmk3"].ingredients = {
        {type = "item", name = "spidertronmk2", amount = 1},
        {type = "item", name = "refined-concrete", amount = 80},
        {type = "item", name = "exoskeleton-equipment", amount = 4},
        {type = "item", name = "fission-reactor-equipment", amount = 4},
    }
    if SAge then
        table.insert(DRR["spidertronmk3"].ingredients, {type = "fluid", name = "fluoroketone-cold", amount = 40})
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "quantum-processor", amount = 20})
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "supercapacitor", amount = 50})
    end
    if BobWar then
        remove_ingredient("spidertronmk3", "exoskeleton-equipment")
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "mech-armor-plate", amount = 50})
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "mech-leg", amount = 8})
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "mech-brain", amount = 5})
    end
    if BobPR then
        remove_ingredient("spidertronmk3", "refined-concrete")
        remove_ingredient("spidertronmk3", "fission-reactor-equipment")
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "rtg", amount = 10})
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "heat-shield-tile", amount = 80})
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "bob-nitinol-gear-wheel", amount = 50})
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "bob-copper-tungsten-alloy", amount = 50})
    end
elseif SS["disable-spidertronmk2"].value == true then
    DRR["spidertronmk3"].ingredients = {
        {type = "item", name = "spidertron", amount = 1},
        {type = "item", name = "refined-concrete", amount = 80},
        {type = "item", name = "fission-reactor-equipment", amount = 4},
        {type = "item", name = "exoskeleton-equipment", amount = 4},
    }
    if SAge then
        table.insert(DRR["spidertronmk3"].ingredients, {type = "fluid", name = "fluoroketone-cold", amount = 40})
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "quantum-processor", amount = 20})
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "supercapacitor", amount = 50})
    end
    if BobWar then
        remove_ingredient("spidertronmk3", "exoskeleton-equipment")
        table.insert(DRR["spidertronmk3"].ingredients,{type = "item", name = "mech-armor-plate", amount = 50})
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "mech-brain", amount = 5})
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "mech-leg",amount = 8})
    end
    if BobPR then
        remove_ingredient("spidertronmk3", "refined-concrete")
        remove_ingredient("spidertronmk3", "fission-reactor-equipment")
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "rtg", amount =10})
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "heat-shield-tile", amount = 80})
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "bob-nitinol-gear-wheel", amount = 50})
        table.insert(DRR["spidertronmk3"].ingredients, {type = "item", name = "bob-copper-tungsten-alloy", amount = 50})
    end
end

DRR["immolator"].ingredients = {
    {type = "item", name = "fission-reactor-equipment", amount = 2},
    {type = "item", name = "refined-concrete", amount = 200},
    {type = "item", name = "storage-tank", amount = 1},
    {type = "item", name = "flamethrower", amount = 1},
}
if SAge then
    table.insert(DRR["immolator"].ingredients, {type = "item", name = "tungsten-carbide", amount = 50})
    table.insert(DRR["immolator"].ingredients, {type = "item", name = "supercapacitor", amount = 50})
    table.insert(DRR["immolator"].ingredients, {type = "item", name = "carbon-fiber", amount = 50})
end
if BobWar then
    table.insert(DRR["immolator"].ingredients, {type = "item", name = "mech-armor-plate", amount = 50})
    table.insert(DRR["immolator"].ingredients, {type = "item", name = "mech-frame", amount = 1})
    table.insert(DRR["immolator"].ingredients, {type = "item", name = "mech-leg", amount = 8})
end
if BobPR then
    remove_ingredient("immolator", "storage-tank")
    remove_ingredient("immolator", "refined-concrete")
    remove_ingredient("immolator", "fission-reactor-equipment")
    table.insert(DRR["immolator"].ingredients, {type = "item", name = "rtg", amount = 5})
    table.insert(DRR["immolator"].ingredients, {type = "item", name = "heat-shield-tile", amount = 200})
    table.insert(DRR["immolator"].ingredients, {type = "item", name = "bob-invar-alloy", amount = 100})
    table.insert(DRR["immolator"].ingredients, {type = "item", name = "bob-cobalt-steel-bearing", amount = 100})
end

DRR["spidertron-builder"].ingredients = {
    {type = "item", name = "low-density-structure", amount = 50},
    {type = "item", name = "construction-robot", amount = 10},
    {type = "item", name = "steel-chest", amount = 10},
    {type = "item", name = "laser-turret", amount = 2},
    {type = "item", name = "spidertron", amount = 1},
    {type = "item", name = "roboport", amount = 2},
    {type = "item", name = "radar", amount = 5},
}
if SAge then
    table.insert(DRR["spidertron-builder"].ingredients, {type = "item", name = "tungsten-plate", amount = 50})
    table.insert(DRR["spidertron-builder"].ingredients, {type = "item", name = "supercapacitor", amount = 50})
    table.insert(DRR["spidertron-builder"].ingredients, {type = "item", name = "carbon-fiber", amount = 50})
end
if BobWar then
    remove_ingredient("spidertron-builder", "construction-robot")
    table.insert(DRR["spidertron-builder"].ingredients, {type = "item", name = "mech-armor-plate", amount = 35})
    table.insert(DRR["spidertron-builder"].ingredients, {type = "item", name = "mech-frame", amount = 1})
    table.insert(DRR["spidertron-builder"].ingredients, {type = "item", name = "mech-leg", amount = 8})
    table.insert(DRR["spidertron-builder"].ingredients, {type = "item", name = "mech-brain", amount = 5})
end
if BobPR then
    remove_ingredient("spidertron-builder", "radar")
    remove_ingredient("spidertron-builder", "roboport")
    remove_ingredient("spidertron-builder", "steel-chest")
    table.insert(DRR["spidertron-builder"].ingredients, {type = "item", name = "rtg", amount = 5})
    table.insert(DRR["spidertron-builder"].ingredients, {type = "item", name = "bob-titanium-bearing", amount = 50})
    table.insert(DRR["spidertron-builder"].ingredients, {type = "item", name = "bob-silicon-nitride", amount = 50})
end


DRR["major-spidertron"].ingredients = {
    {type = "item", name = "raw-fish", amount = 1},
    {type = "item", name = "engine-unit", amount = 40},
    {type = "item", name = "steel-plate", amount = 60},
    {type = "item", name = "refined-concrete", amount = 60},
    {type = "item", name = "processing-unit", amount = 80},
}
if SAge then
    table.insert(DRR["major-spidertron"].ingredients, {type = "item", name = "tungsten-plate", amount = 50})
    table.insert(DRR["major-spidertron"].ingredients, {type = "item", name = "supercapacitor", amount = 50})
    table.insert(DRR["major-spidertron"].ingredients, {type = "item", name = "carbon-fiber", amount = 50})
end
if BobWar then
    remove_ingredient("major-spidertron", "raw-fish")
    remove_ingredient("major-spidertron", "engine-unit")
    remove_ingredient("major-spidertron", "refined-concrete")
    table.insert(DRR["major-spidertron"].ingredients, {type = "item", name = "mech-armor-plate", amount =50})
    table.insert(DRR["major-spidertron"].ingredients, {type = "item", name = "spidertron-cannon", amount =1})
    table.insert(DRR["major-spidertron"].ingredients, {type = "item", name = "mech-frame", amount =1})
    table.insert(DRR["major-spidertron"].ingredients, {type = "item", name = "mech-brain", amount =5})
    table.insert(DRR["major-spidertron"].ingredients, {type = "item", name = "mech-leg", amount =8})
end
if BobPR then
    remove_ingredient("major-spidertron", "steel-plate")
    table.insert(DRR["major-spidertron"].ingredients, {type = "item", name = "heat-shield-tile", amount =60})
    table.insert(DRR["major-spidertron"].ingredients, {type = "item", name = "rtg", amount =5})
end