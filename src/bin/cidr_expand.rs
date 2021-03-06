use std::{
    io::{self, BufRead},
    str::FromStr,
};

use ipnet::IpNet;

fn process<I: IntoIterator<Item = String>>(strings: I) {
    for string in strings {
        let net = IpNet::from_str(&string).expect("input was not a valid IPv4/IPv6 CIDR");
        let subnets = net.subnets(net.max_prefix_len()).unwrap();
        for (_, subnet) in subnets.enumerate() {
            println!("{}", subnet.addr())
        }
    }
}

fn main() {
    match std::env::args().nth(1) {
        Some(_) => process(std::env::args()),
        None => process(io::stdin().lock().lines().map(|ln| ln.unwrap())),
    };
}
