use core::array::ArrayTrait;
pub mod calculator;
pub mod garden;
use garden::vegetables::Vegetable;
use calculator::RectangleGeometry;

#[derive(Drop, Copy)]
enum BlogStatus {
    Pending,
    Reviewed,
    Rejected,
    Accepted,
}

#[derive(Drop)]
struct Post<T> {
    id: T,
    author: felt252,
    title: ByteArray,
    content: ByteArray,
    status: BlogStatus,
    likes: u64,
}

trait PostTrait<T> {
    fn update_title(ref self: T, new_title: ByteArray);
    fn add_a_like(ref self: T);
    fn print_post(self: @T);
    fn update_status(ref self: T, new_status: BlogStatus);
}

impl PostTraitImpl of PostTrait<Post<u256>> {
    fn update_title(ref self: Post<u256>, new_title: ByteArray) {
        self.title = new_title;
    }
    fn add_a_like(ref self: Post<u256>) {
        self.likes += 1;
    }
    fn print_post(self: @Post<u256>) {
        let status: ByteArray = match *self.status {
            BlogStatus::Pending => "pending",
            BlogStatus::Reviewed => "reviewed",
            BlogStatus::Rejected => "rejected",
            BlogStatus::Accepted => "accepted",
        };
        let post = format!(
            "\nPost title: {}\nPost likes: {}\nPost status: {}", self.title, self.likes, status
        );
        println!("{}", post);
    }
    fn update_status(ref self: Post<u256>, new_status: BlogStatus) {
        self.status = new_status;
    }
}

fn main() {
    let mut post_1 = Post {
        id: 1,
        author: 'Dalmas Ogembo',
        title: "Getting started with Starknet",
        content: "We have alot of content",
        status: BlogStatus::Pending,
        likes: 0
    };

    let mut post_2 = Post {
        id: 2,
        author: 'Dalmas Ogembo',
        title: "Getting started with Starknet",
        content: "We have alot of content",
        status: BlogStatus::Pending,
        likes: 0
    };

    post_1.print_post();
    post_1.update_status(BlogStatus::Reviewed);
    post_1.print_post();

    // let num: Option<u8> = Option::Some(6);

    // match num {
    //     Option::Some(x) => {
    //         println!("There is a number: {}", x);
    //     },
    //     Option::None => {
    //         println!("There is no number")
    //     }
    // }

    let sum = calculator::add('1', 2);

    println!("Sum is: {}", sum);

    let fruit = calculator::return_a_fruit();

    println!("Fruit: {:?}", fruit);

    let _vegetable = Vegetable { name: "SukumaWiki" };

    // Represent Strings as felt252 but only up to 31 characters
    let _new_var = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';

    let rect = calculator::Rectangle { width: 4, length: 10, };

    let circle = calculator::Circle { radius: 4 };

    println!("Area of rectangle is: {}", rect.calculate_area());
    println!("Perimeter of rectangle is: {}", rect.calculate_perimeter());

    println!("Area of circle is: {}", circle.calculate_area());
    println!("Perimeter of circle is: {}", circle.calculate_perimeter());

    // if
    // while / loop

    if 1 == 1 {
        // Do something
    }

    let posts = array![post_1,post_2];
    let posts_len = posts.len();

    let mut i = 0;
    // while i < posts_len {

    //     let post = posts.at(i);
    //     println!("Post ID: {}", *post.id);

    //     i += 1;
    // };

    loop {
        if i == posts_len {
            break;
        }
        let post = posts.at(i);
        println!("Post ID: {}", *post.id);

        i += 1;
    }


}
