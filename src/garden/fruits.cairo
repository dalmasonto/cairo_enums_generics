

#[derive(Drop)]
pub struct Fruit {
    pub name: felt252
}


// #[generate_trait]
// impl FruitFmt of Fmt{
//     fn fmt(self: @Fruit){
//         format!("Fruit name is {}", *self.name);
//     }
// }
