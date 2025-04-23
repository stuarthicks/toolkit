use clap::Parser;
use std::io::{self, BufRead};

#[derive(Parser, Debug)]
#[command(author,version,about,long_about=None)]
struct Args {
    #[arg(short, long, default_value_t=String::from(","))]
    separator: String,

    strings: Option<Vec<String>>,
}

fn main() {
    let args = Args::parse();
    let sep = &format!("{} ", args.separator);
    match args.strings {
        Some(ss) => println!("{}", ss.join(&sep)),
        None => println!(
            "{}",
            io::stdin()
                .lock()
                .lines()
                .map(|ln| ln.unwrap())
                .collect::<Vec<String>>()
                .join(&sep)
        ),
    }
}
