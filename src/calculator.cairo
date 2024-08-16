use core::option::OptionTrait;
use core::traits::TryInto;
// pub mod garden;
use custom_enums::garden::fruits::Fruit;

pub fn add<T, +Add<T>>(a: T, b: T) -> T {
    a + b
}

pub fn return_a_fruit() -> Fruit {
    Fruit { name: 'Mango' }
}

#[derive(Drop)]
pub struct Rectangle {
    pub width: u8,
    pub length: u8
}

#[derive(Drop)]
pub struct Circle {
    pub radius: u8,
}

pub trait Geometry<T> {
    fn calculate_area(self: @T) -> u256;
    fn calculate_perimeter(self: @T) -> u256;
}


pub impl RectangleGeometry of Geometry<Rectangle> {
    fn calculate_area(self: @Rectangle) -> u256 {
        let area = *self.length * *self.width;
        area.try_into().unwrap()
    }
    fn calculate_perimeter(self: @Rectangle) -> u256 {
        let perimeter = self.calculate_area() * 2;
        perimeter
    }
}

impl CirlceGeometry of Geometry<Circle> {
    fn calculate_area(self: @Circle) -> u256 {
        let num = 22_u32;
        let den = 7_u32;
        let radius = *self.radius;
        let radius = radius.try_into().unwrap();
        let area = (num / den) * radius * radius;
        area.try_into().unwrap()
    }

    fn calculate_perimeter(self: @Circle) -> u256 {
        let num = 22_u32;
        let den = 7_u32;
        let radius = *self.radius;
        let radius = radius.try_into().unwrap();
        let perimeter = (num / den) * (radius * 2);
        perimeter.try_into().unwrap()
    }
}

