use starknet::ContractAddress;

#[cfg(test)]
use debug::PrintTrait;

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Elements {
    #[key]
    player: ContractAddress,
    #[key]
    id: u32,
    element: Element,
}

#[derive(Copy, PartialEq, PartialOrd, Drop, Serde)]
enum Element {
    Water,
    Fire,
    Earth,
    Air,
    Pressure, // Air + Air
    Energy, // Air + Fire
    Dust, // Earth + Air
    Lava, // Earth + Fire
    Rain, // Water + Air
    Mud, // Water + Earth
    Steam, // Water + Fire
    Sea, // Water + Water
    Wind, // Air + Energy
    Stone, // Air + Lava
    Atmosphere, // Air + Pressure
    Cloud, // Air + Steam
    Earthquake, // Earth + Energy
    Gunpowder, // Fire + Dust
    Salt, // Fire + Sea
    Volcano, // Lava + Earth
    Granite, // Lava + Pressure
    Obsidian, // Lava + Water
    Brick, // Mud + Fire
    Plant, // Rain + Earth
    Flood, // Rain + Rain
    Ocean, // Sea + Sea
    Geyser, // Steam + Earth
    Sky, // Air + Cloud
    Sand, // Air + Stone
    Wall, // Brick + Brick
    Fog, // Earth + Cloud
    Mountain, // Earthquake + Earth
    Storm, // Energy + Cloud
    Metal, // Fire + Stone
    Explosion, // Gunpowder + Fire
    Swamp, // Mud + Plant
    Tsunami, // Ocean + Earthquake
    Algae, // Ocean + Plant
    Isle, // Ocean + Volcano
    Wave, // Ocean + Wind
    Cotton, // Plant + Cloud
    Grass, // Plant + Earth
    Tobacco, // Plant + Fire
    Seaweed, // Plant + Ocean
    Garden, // Plant + Plant
    Moss, // Plant + Stone
    Coal, // Pressure + Plant
    Ash, // Volcano + Energy
    Eruption, // Volcano + Energy
    Hurricane, // Wind + Energy
}

impl ElementSerdeLen of dojo::SerdeLen<Element> {
    #[inline(always)]
    fn len() -> usize {
        1
    }
}

#[cfg(test)]
impl ElementPrint of debug::PrintTrait<Element> {
    fn print(self: Element) {
        match self {
            Element::Water => 'Water'.print(),
            Element::Fire => 'Fire'.print(),
            Element::Earth => 'Earth'.print(),
            Element::Air => 'Air'.print(),
            Element::Pressure => 'Pressure'.print(),
            Element::Energy => 'Energy'.print(),
            Element::Dust => 'Dust'.print(),
            Element::Lava => 'Lava'.print(),
            Element::Rain => 'Rain'.print(),
            Element::Mud => 'Mud'.print(),
            Element::Steam => 'Steam'.print(),
            Element::Sea => 'Sea'.print(),
            Element::Wind => 'Wind'.print(),
            Element::Stone => 'Stone'.print(),
            Element::Atmosphere => 'Atmosphere'.print(),
            Element::Cloud => 'Cloud'.print(),
            Element::Earthquake => 'Earthquake'.print(),
            Element::Gunpowder => 'Gunpowder'.print(),
            Element::Salt => 'Salt'.print(),
            Element::Volcano => 'Volcano'.print(),
            Element::Granite => 'Granite'.print(),
            Element::Obsidian => 'Obsidian'.print(),
            Element::Brick => 'Brick'.print(),
            Element::Plant => 'Plant'.print(),
            Element::Flood => 'Flood'.print(),
            Element::Ocean => 'Ocean'.print(),
            Element::Geyser => 'Geyser'.print(),
            Element::Sky => 'Sky'.print(),
            Element::Sand => 'Sand'.print(),
            Element::Wall => 'Wall'.print(),
            Element::Fog => 'Fog'.print(),
            Element::Mountain => 'Mountain'.print(),
            Element::Storm => 'Storm'.print(),
            Element::Metal => 'Metal'.print(),
            Element::Explosion => 'Explosion'.print(),
            Element::Swamp => 'Swamp'.print(),
            Element::Tsunami => 'Tsunami'.print(),
            Element::Algae => 'Algae'.print(),
            Element::Isle => 'Isle'.print(),
            Element::Wave => 'Wave'.print(),
            Element::Cotton => 'Cotton'.print(),
            Element::Grass => 'Grass'.print(),
            Element::Tobacco => 'Tobacco'.print(),
            Element::Seaweed => 'Seaweed'.print(),
            Element::Garden => 'Garden'.print(),
            Element::Moss => 'Moss'.print(),
            Element::Coal => 'Coal'.print(),
            Element::Ash => 'Ash'.print(),
            Element::Eruption => 'Eruption'.print(),
            Element::Hurricane => 'Hurricane'.print(),
        }
    }
}

