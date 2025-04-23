use std::env;
use std::time::{SystemTime, UNIX_EPOCH};

fn main() {
    let args: Vec<String> = env::args().collect();

    let mut millis: bool = false;

    if args.contains(&String::from("-h")) {
        println!("
prints unix time now

Flags: 
        -m: prints time in milliseconds
        -h: prints this message
        ");
        return
    }

    if args.contains(&String::from("-m")) {
        millis = true;
    }

    let now = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("unixmillis");

    let mut unix = now.as_secs() as u128;

    if millis {
        unix = now.as_millis();
    }
    println!("{}", unix)
}
