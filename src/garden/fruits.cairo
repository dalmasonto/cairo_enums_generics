

#[derive(Drop, Debug)]
pub struct Fruit {
    pub name: felt252
}

use core::fmt::{Display, Formatter, Error};
impl FruitDisplay of Display<Fruit> {
    fn fmt(self: @Fruit, ref f: Formatter) -> Result<(), Error> {
        let str: ByteArray = format!("Fruit ({})", *self.name);
        f.buffer.append(@str);
        Result::Ok(())
    }
}

