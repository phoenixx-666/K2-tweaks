local items = {
  'express-underground-belt',
  'express-splitter',
  'nuclear-reactor',
  'engine-unit'
}

for i, recipe in ipairs(items) do
  if settings.startup['enable-' .. recipe .. '-handcrafting'].value then
    data.raw.recipe[recipe].category = 'crafting'
  end
end

--if settings.startup['enable-laser-artillery-range-upgrade'].value then
  
--end

local kr_graphic_mod_path = '__Krastorio2__/graphics/'
local kr_icons_path = kr_graphic_mod_path .. 'icons/'
local kr_items_icons_path = kr_icons_path .. 'items/'

if settings.startup['distinct-icons-for-advanced-assembling-machine'].value then
  local copper_ore = data.raw['item']['copper-ore']
  local iron_ore = data.raw['item']['iron-ore']
  local iron_plate = data.raw['item']['iron-plate']
  local imersite_powder = data.raw['item']['imersite-powder']
  local raw_rare_metals = data.raw['item']['raw-rare-metals']
  data.raw['recipe']['kr-s-c-copper-cable'].icons = {
    { icon = '__base__/graphics/icons/copper-cable.png', icon_size = 64 },
    { icon = copper_ore.icon, icon_size = copper_ore.icon_size, scale = 0.22, shift = { 8, -8 } },
  }
  data.raw['recipe']['kr-s-c-iron-stick'].icons = {
    { icon = '__base__/graphics/icons/iron-stick.png', icon_size = 64 },
    { icon = iron_ore.icon, icon_size = iron_ore.icon_size, scale = 0.22, shift = { 8, -8 } },
  }
  data.raw['recipe']['kr-s-c-iron-beam'].icons = {
    { icon = kr_items_icons_path .. 'iron-beam.png', icon_size = 64 },
    { icon = iron_ore.icon, icon_size = iron_ore.icon_size, scale = 0.22, shift = { -8, -8 } },
  }
  data.raw['recipe']['kr-s-c-iron-gear-wheel'].icons = {
    { icon = kr_items_icons_path .. 'iron-gear-wheel.png', icon_size = 64 },
    { icon = iron_ore.icon, icon_size = iron_ore.icon_size, scale = 0.3, shift = { -8, -8 } },
  }
  data.raw['recipe']['kr-s-c-steel-beam'].icons = {
    { icon = kr_items_icons_path .. 'steel-beam.png', icon_size = 64 },
    { icon = iron_plate.icon, icon_size = iron_plate.icon_size, scale = 0.3, shift = { -8, -8 } },
  }
  data.raw['recipe']['kr-s-c-steel-gear-wheel'].icons = {
    { icon = kr_items_icons_path .. 'steel-gear-wheel.png', icon_size = 64 },
    { icon = iron_plate.icon, icon_size = iron_plate.icon_size, scale = 0.3, shift = { -8, -8 } },
  }
  if settings.startup['advanced-assembling-machine-recipes-with-raw-rare-metals'].value then
    data.raw['recipe']['kr-s-c-imersium-beam'].icons = {
      { icon = kr_items_icons_path .. 'imersium-beam.png', icon_size = 64 },
      { icon = imersite_powder.icon, icon_size = imersite_powder.icon_size, scale = 0.3, shift = { 8, -8 } },
      { icon = raw_rare_metals.icon, icon_size = raw_rare_metals.icon_size, scale = 0.22, shift = { -8, -8 } },
    }
    data.raw['recipe']['kr-s-c-imersium-gear-wheel'].icons = {
      { icon = kr_items_icons_path .. 'imersium-gear-wheel.png', icon_size = 64 },
      { icon = imersite_powder.icon, icon_size = imersite_powder.icon_size, scale = 0.3, shift = { 8, -8 } },
      { icon = raw_rare_metals.icon, icon_size = raw_rare_metals.icon_size, scale = 0.22, shift = { -8, -8 } },
    }
  else
    data.raw['recipe']['kr-s-c-imersium-beam'].icons = {
      { icon = kr_items_icons_path .. 'imersium-beam.png', icon_size = 64 },
      { icon = imersite_powder.icon, icon_size = imersite_powder.icon_size, scale = 0.3, shift = { -8, -8 } },
    }
    data.raw['recipe']['kr-s-c-imersium-gear-wheel'].icons = {
      { icon = kr_items_icons_path .. 'imersium-gear-wheel.png', icon_size = 64 },
      { icon = imersite_powder.icon, icon_size = imersite_powder.icon_size, scale = 0.3, shift = { -8, -8 } },
    }
  end
end

if settings.startup['advanced-assembling-machine-recipes-with-raw-rare-metals'].value then
  data.raw['recipe']['kr-s-c-imersium-beam'].ingredients = {
    { 'imersite-powder', 6 },
    { 'raw-rare-metals', 8 },
  }
  data.raw['recipe']['kr-s-c-imersium-gear-wheel'].ingredients = {
    { 'imersite-powder', 3 },
    { 'raw-rare-metals', 4 },
  }
end

local enriched_ores = settings.startup['advanced-enriched-ore-based-assembling-machine-recipes'].value
if enriched_ores ~= 'disabled' then
  local enriched_copper = data.raw['item']['enriched-copper']
  local enriched_iron = data.raw['item']['enriched-iron']

  local copper_cable = table.deepcopy(data.raw['recipe']['kr-s-c-copper-cable'])
  copper_cable.name = 'krtw-s-c-e-copper-cable'
  copper_cable.ingredients = { {'enriched-copper', 1} }
  copper_cable.icons = {
    { icon = '__base__/graphics/icons/copper-cable.png', icon_size = 64 },
    { icon = enriched_copper.icon, icon_size = enriched_copper.icon_size, scale = 0.22, shift = { 8, -8 } },
  }

  local iron_stick = table.deepcopy(data.raw['recipe']['kr-s-c-iron-stick'])
  iron_stick.name = 'krtw-s-c-e-iron-stick'
  iron_stick.ingredients = { {'enriched-iron', 1} }
  iron_stick.icons = {
    { icon = '__base__/graphics/icons/iron-stick.png', icon_size = 64 },
    { icon = enriched_iron.icon, icon_size = enriched_iron.icon_size, scale = 0.22, shift = { 8, -8 } },
  }
  
  local iron_gear_wheel = table.deepcopy(data.raw['recipe']['kr-s-c-iron-gear-wheel'])
  iron_gear_wheel.name = 'krtw-s-c-e-iron-gear-wheel'
  iron_gear_wheel.ingredients = { {'enriched-iron', 1} }
  iron_gear_wheel.icons = {
    { icon = kr_items_icons_path .. 'iron-gear-wheel.png', icon_size = 64 },
    { icon = enriched_iron.icon, icon_size = enriched_iron.icon_size, scale = 0.22, shift = { -8, -8 } },
  }

  local iron_beam = table.deepcopy(data.raw['recipe']['kr-s-c-iron-beam'])
  iron_beam.name = 'krtw-s-c-e-iron-beam'
  iron_beam.ingredients = { {'enriched-iron', 2} }
  iron_beam.icons = {
    { icon = kr_items_icons_path .. 'iron-beam.png', icon_size = 64 },
    { icon = enriched_iron.icon, icon_size = enriched_iron.icon_size, scale = 0.22, shift = { -8, -8 } },
  }
  
  local extensions = {
    copper_cable,
    iron_stick,
    iron_gear_wheel,
    iron_beam
  }
  
  if settings.startup['advanced-assembling-machine-recipes-with-raw-rare-metals'].value then
    local imersite_powder = data.raw['item']['imersite-powder']
    local enriched_rare_metals = data.raw['item']['enriched-rare-metals']

    local imersium_gear_wheel = table.deepcopy(data.raw['recipe']['kr-s-c-imersium-gear-wheel'])
    imersium_gear_wheel.name = 'krtw-s-c-e-imersium-gear-wheel'
    imersium_gear_wheel.ingredients = {
      { 'imersite-powder', 3 },
      { 'enriched-rare-metals', 2 }
    }
    imersium_gear_wheel.icons = {
      { icon = kr_items_icons_path .. 'imersium-gear-wheel.png', icon_size = 64 },
      { icon = imersite_powder.icon, icon_size = imersite_powder.icon_size, scale = 0.3, shift = { 8, -8 } },
      { icon = enriched_rare_metals.icon, icon_size = enriched_rare_metals.icon_size, scale = 0.22, shift = { -8, -8 } },
    }
    table.insert(extensions, imersium_gear_wheel)
    
    local imersium_beam = table.deepcopy(data.raw['recipe']['kr-s-c-imersium-beam'])
    imersium_beam.name = 'krtw-s-c-e-imersium-beam'
    imersium_beam.ingredients = {
      { 'imersite-powder', 6 },
      { 'enriched-rare-metals', 4 }
    }
    imersium_beam.icons = {
      { icon = kr_items_icons_path .. 'imersium-beam.png', icon_size = 64 },
      { icon = imersite_powder.icon, icon_size = imersite_powder.icon_size, scale = 0.3, shift = { 8, -8 } },
      { icon = enriched_rare_metals.icon, icon_size = enriched_rare_metals.icon_size, scale = 0.22, shift = { -8, -8 } },
    }
    table.insert(extensions, imersium_beam)
  end

  data:extend(extensions)

  if enriched_ores == 'enabled' or enriched_ores == 'require' then
    local unlocks = table.deepcopy(data.raw['technology']['kr-automation'].effects)
    table.insert(unlocks, 2, {
      type = 'unlock-recipe',
      recipe = 'krtw-s-c-e-copper-cable',
    })
    table.insert(unlocks, 4, {
      type = 'unlock-recipe',
      recipe = 'krtw-s-c-e-iron-stick',
    })
    table.insert(unlocks, 6, {
      type = 'unlock-recipe',
      recipe = 'krtw-s-c-e-iron-gear-wheel',
    })
    table.insert(unlocks, 8, {
      type = 'unlock-recipe',
      recipe = 'krtw-s-c-e-iron-beam',
    })
    if settings.startup['advanced-assembling-machine-recipes-with-raw-rare-metals'].value then
      table.insert(unlocks, 11, {
        type = 'unlock-recipe',
        recipe = 'krtw-s-c-e-imersium-gear-wheel',
      })
      table.insert(unlocks, 13, {
        type = 'unlock-recipe',
        recipe = 'krtw-s-c-e-imersium-beam',
      })
    end
    data.raw['technology']['kr-automation'].effects = unlocks
    if enriched_ores == 'require' then
      table.insert(data.raw['technology']['kr-automation'].prerequisites, 'kr-enriched-ores');
    end
  else
    --local kr_technologies_icons_path = kr_graphic_mod_path .. 'technologies/'
    local tech = {
      type = 'technology',
      name = 'krtw-enriched-ore-advanced-assembly',
      icon = '__K2-tweaks__/graphics/technologies/advanced-assembling-enriched-ores.png',
      icon_size = 256,
      icon_mipmaps = 4,
      effects = {
        {
          type = 'unlock-recipe',
          recipe = 'krtw-s-c-e-copper-cable',
        },
        {
          type = 'unlock-recipe',
          recipe = 'krtw-s-c-e-iron-stick',
        },
        {
          type = 'unlock-recipe',
          recipe = 'krtw-s-c-e-iron-gear-wheel',
        },
        {
          type = 'unlock-recipe',
          recipe = 'krtw-s-c-e-iron-beam',
        },
      },
      prerequisites = { 'kr-automation', 'kr-enriched-ores' },
      unit = {
        count = 200,
        ingredients = {
          { 'production-science-pack', 1 },
          { 'utility-science-pack', 1 },
          { 'matter-tech-card', 1 },
          { 'advanced-tech-card', 1 },
        },
        time = 30,
      },
    }
    if settings.startup['advanced-assembling-machine-recipes-with-raw-rare-metals'].value then
      table.insert(tech['effects'], {
        type = 'unlock-recipe',
        recipe = 'krtw-s-c-e-imersium-gear-wheel',
      })
      table.insert(tech['effects'], {
        type = 'unlock-recipe',
        recipe = 'krtw-s-c-e-imersium-beam',
      })
    end
    data:extend({ tech })
  end
end
