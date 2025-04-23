use base64::{prelude::BASE64_STANDARD, Engine};
use clap::{Arg, Command};
use random_string::{charsets, generate};

fn main() {
    let matches = Command::new("rand_string")
        .arg(
            Arg::new("length")
                .short('l')
                .long("length")
                .default_value("16"),
        )
        .arg(
            Arg::new("charset")
                .short('c')
                .long("charset")
                .default_value(charsets::ALPHANUMERIC),
        )
        .arg(
            Arg::new("base64")
                .required(false)
                .num_args(0)
                .short('b')
                .help("encodes string into base64")
                .long("base64"),
        )
        .get_matches();

    let length_string: &String = matches.get_one("length").expect("a default value");
    let charset: &String = matches.get_one("charset").expect("a default value");
    let b64: &bool = matches.get_one("base64").unwrap();

    let length: usize = length_string.parse().expect("a valid usize");

    let mut s = generate(length.to_owned(), charset.to_owned());

    if *b64 {
        s = BASE64_STANDARD.encode(s);
    }
    println!("{}", s)
}
