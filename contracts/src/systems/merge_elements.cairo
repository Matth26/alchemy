#[system]
mod merge_elements_system {
    use dojo::world::Context;
    use alchemy::components::{Element, Elements};

    fn execute(ctx: Context, elem_id_1: u32, elem_id_2: u32) {
        let elem1 = get!(ctx.world, (ctx.origin, elem_id_1), (Elements));
        let elem2 = get!(ctx.world, (ctx.origin, elem_id_2), (Elements));

        let elem3 = merge_elements(elem1.element, elem2.element);
        match elem3 {
            Option::Some(new_elem) => {
                let id = ctx.world.uuid();
                set!(ctx.world, Elements { player: ctx.origin, id: id, element: new_elem });
            },
            Option::None(_) => (),
        }

        return ();
    }

    fn merge_elements(elem1: Element, elem2: Element) -> Option<Element> {
        let mut e1 = elem1;
        let mut e2 = elem2;
        //if elem1. > elem2 {
        //    e1 = elem2;
        //    e2 = elem1;
        //}
        if e1 == Element::Water {
            if e2 == Element::Air { // Rain = Water + Air
                Option::Some(Element::Rain)
            } else if e2 == Element::Earth { // Mud = Water + Earth
                Option::Some(Element::Mud)
            } else if e2 == Element::Fire { // Steam = Water + Fire
                Option::Some(Element::Steam)
            } else if e2 == Element::Water { // Sea = Water + Water
                Option::Some(Element::Sea)
            } else if e2 == Element::Lava { // Obsidian = Lava + Water
                Option::Some(Element::Obsidian)
            } else {
                Option::None
            }
        } else {
            Option::None
        }
    }
}
