use std::io::{self, BufRead};

use chrono::{DateTime, FixedOffset};

fn process<I: IntoIterator<Item = String>>(strings: I) {
    for string in strings {
        let dt: DateTime<FixedOffset> = DateTime::parse_from_rfc3339(&string).unwrap();
        println!("{}", dt.timestamp_millis());
    }
}

fn main() {
    match std::env::args().len() {
        1 => process(io::stdin().lock().lines().map(|ln| ln.unwrap())),
        _ => process(std::env::args().skip(1)),
    };
}
