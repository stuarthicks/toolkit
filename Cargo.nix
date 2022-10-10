# This file was @generated by cargo2nix 0.11.0.
# It is not intended to be manually edited.
args @ {
  release ? true,
  rootFeatures ? [
    "toolkit/default"
  ],
  rustPackages,
  buildRustPackages,
  hostPlatform,
  hostPlatformCpu ? null,
  hostPlatformFeatures ? [],
  target ? null,
  codegenOpts ? null,
  profileOpts ? null,
  rustcLinkFlags ? null,
  rustcBuildFlags ? null,
  mkRustCrate,
  rustLib,
  lib,
  workspaceSrc,
}: let
  workspaceSrc =
    if args.workspaceSrc == null
    then ./.
    else args.workspaceSrc;
in let
  inherit (rustLib) fetchCratesIo fetchCrateLocal fetchCrateGit fetchCrateAlternativeRegistry expandFeatures decideProfile genDrvsByProfile;
  profilesByName = {
  };
  rootFeatures' = expandFeatures rootFeatures;
  overridableMkRustCrate = f: let
    drvs = genDrvsByProfile profilesByName ({
      profile,
      profileName,
    }:
      mkRustCrate ({inherit release profile hostPlatformCpu hostPlatformFeatures target profileOpts codegenOpts rustcLinkFlags rustcBuildFlags;} // (f profileName)));
  in
    {
      compileMode ? null,
      profileName ? decideProfile compileMode release,
    }: let
      drv = drvs.${profileName};
    in
      if compileMode == null
      then drv
      else drv.override {inherit compileMode;};
in {
  cargo2nixVersion = "0.11.0";
  workspace = {
    toolkit = rustPackages.unknown.toolkit."0.1.0";
  };
  "registry+https://github.com/rust-lang/crates.io-index".android_system_properties."0.1.5" = overridableMkRustCrate (profileName: rec {
    name = "android_system_properties";
    version = "0.1.5";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311";
    };
    dependencies = {
      libc = rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.133" {inherit profileName;};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".autocfg."1.1.0" = overridableMkRustCrate (profileName: rec {
    name = "autocfg";
    version = "1.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa";
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".bumpalo."3.11.0" = overridableMkRustCrate (profileName: rec {
    name = "bumpalo";
    version = "3.11.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "c1ad822118d20d2c234f427000d5acc36eabe1e29a348c89b63dd60b13f28e5d";
    };
    features = builtins.concatLists [
      ["default"]
    ];
  });

  "registry+https://github.com/rust-lang/crates.io-index".cfg-if."1.0.0" = overridableMkRustCrate (profileName: rec {
    name = "cfg-if";
    version = "1.0.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd";
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".chrono."0.4.22" = overridableMkRustCrate (profileName: rec {
    name = "chrono";
    version = "0.4.22";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "bfd4d1b31faaa3a89d7934dbded3111da0d2ef28e3ebccdb4f0179f5929d1ef1";
    };
    features = builtins.concatLists [
      ["clock"]
      ["default"]
      ["iana-time-zone"]
      ["js-sys"]
      ["oldtime"]
      ["std"]
      ["time"]
      ["wasm-bindgen"]
      ["wasmbind"]
      ["winapi"]
    ];
    dependencies = {
      iana_time_zone = rustPackages."registry+https://github.com/rust-lang/crates.io-index".iana-time-zone."0.1.50" {inherit profileName;};
      ${
        if hostPlatform.parsed.cpu.name == "wasm32" && !(hostPlatform.parsed.kernel.name == "emscripten" || hostPlatform.parsed.kernel.name == "wasi")
        then "js_sys"
        else null
      } =
        rustPackages."registry+https://github.com/rust-lang/crates.io-index".js-sys."0.3.60" {inherit profileName;};
      num_integer = rustPackages."registry+https://github.com/rust-lang/crates.io-index".num-integer."0.1.45" {inherit profileName;};
      num_traits = rustPackages."registry+https://github.com/rust-lang/crates.io-index".num-traits."0.2.15" {inherit profileName;};
      time = rustPackages."registry+https://github.com/rust-lang/crates.io-index".time."0.1.44" {inherit profileName;};
      ${
        if hostPlatform.parsed.cpu.name == "wasm32" && !(hostPlatform.parsed.kernel.name == "emscripten" || hostPlatform.parsed.kernel.name == "wasi")
        then "wasm_bindgen"
        else null
      } =
        rustPackages."registry+https://github.com/rust-lang/crates.io-index".wasm-bindgen."0.2.83" {inherit profileName;};
      ${
        if hostPlatform.isWindows
        then "winapi"
        else null
      } =
        rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi."0.3.9" {inherit profileName;};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".core-foundation-sys."0.8.3" = overridableMkRustCrate (profileName: rec {
    name = "core-foundation-sys";
    version = "0.8.3";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "5827cebf4670468b8772dd191856768aedcb1b0278a04f989f7766351917b9dc";
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".html-escape."0.2.11" = overridableMkRustCrate (profileName: rec {
    name = "html-escape";
    version = "0.2.11";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "b8e7479fa1ef38eb49fb6a42c426be515df2d063f06cb8efd3e50af073dbc26c";
    };
    features = builtins.concatLists [
      ["default"]
      ["std"]
    ];
    dependencies = {
      utf8_width = rustPackages."registry+https://github.com/rust-lang/crates.io-index".utf8-width."0.1.6" {inherit profileName;};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".iana-time-zone."0.1.50" = overridableMkRustCrate (profileName: rec {
    name = "iana-time-zone";
    version = "0.1.50";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "fd911b35d940d2bd0bea0f9100068e5b97b51a1cbe13d13382f132e0365257a0";
    };
    features = builtins.concatLists [
      ["fallback"]
    ];
    dependencies = {
      ${
        if hostPlatform.parsed.kernel.name == "android"
        then "android_system_properties"
        else null
      } =
        rustPackages."registry+https://github.com/rust-lang/crates.io-index".android_system_properties."0.1.5" {inherit profileName;};
      ${
        if hostPlatform.parsed.kernel.name == "darwin" || hostPlatform.parsed.kernel.name == "ios"
        then "core_foundation_sys"
        else null
      } =
        rustPackages."registry+https://github.com/rust-lang/crates.io-index".core-foundation-sys."0.8.3" {inherit profileName;};
      ${
        if hostPlatform.parsed.cpu.name == "wasm32"
        then "js_sys"
        else null
      } =
        rustPackages."registry+https://github.com/rust-lang/crates.io-index".js-sys."0.3.60" {inherit profileName;};
      ${
        if hostPlatform.parsed.cpu.name == "wasm32"
        then "wasm_bindgen"
        else null
      } =
        rustPackages."registry+https://github.com/rust-lang/crates.io-index".wasm-bindgen."0.2.83" {inherit profileName;};
      ${
        if hostPlatform.parsed.kernel.name == "windows"
        then "winapi"
        else null
      } =
        rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi."0.3.9" {inherit profileName;};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".ipnet."2.5.0" = overridableMkRustCrate (profileName: rec {
    name = "ipnet";
    version = "2.5.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "879d54834c8c76457ef4293a689b2a8c59b076067ad77b15efafbb05f92a592b";
    };
    features = builtins.concatLists [
      ["default"]
    ];
  });

  "registry+https://github.com/rust-lang/crates.io-index".js-sys."0.3.60" = overridableMkRustCrate (profileName: rec {
    name = "js-sys";
    version = "0.3.60";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "49409df3e3bf0856b916e2ceaca09ee28e6871cf7d9ce97a692cacfdb2a25a47";
    };
    dependencies = {
      wasm_bindgen = rustPackages."registry+https://github.com/rust-lang/crates.io-index".wasm-bindgen."0.2.83" {inherit profileName;};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".libc."0.2.133" = overridableMkRustCrate (profileName: rec {
    name = "libc";
    version = "0.2.133";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "c0f80d65747a3e43d1596c7c5492d95d5edddaabd45a7fcdb02b95f644164966";
    };
    features = builtins.concatLists [
      ["default"]
      ["std"]
    ];
  });

  "registry+https://github.com/rust-lang/crates.io-index".log."0.4.17" = overridableMkRustCrate (profileName: rec {
    name = "log";
    version = "0.4.17";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e";
    };
    dependencies = {
      cfg_if = rustPackages."registry+https://github.com/rust-lang/crates.io-index".cfg-if."1.0.0" {inherit profileName;};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".num-integer."0.1.45" = overridableMkRustCrate (profileName: rec {
    name = "num-integer";
    version = "0.1.45";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9";
    };
    dependencies = {
      num_traits = rustPackages."registry+https://github.com/rust-lang/crates.io-index".num-traits."0.2.15" {inherit profileName;};
    };
    buildDependencies = {
      autocfg = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".autocfg."1.1.0" {profileName = "__noProfile";};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".num-traits."0.2.15" = overridableMkRustCrate (profileName: rec {
    name = "num-traits";
    version = "0.2.15";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd";
    };
    buildDependencies = {
      autocfg = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".autocfg."1.1.0" {profileName = "__noProfile";};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".once_cell."1.15.0" = overridableMkRustCrate (profileName: rec {
    name = "once_cell";
    version = "1.15.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "e82dad04139b71a90c080c8463fe0dc7902db5192d939bd0950f074d014339e1";
    };
    features = builtins.concatLists [
      ["alloc"]
      ["default"]
      ["race"]
      ["std"]
    ];
  });

  "registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.46" = overridableMkRustCrate (profileName: rec {
    name = "proc-macro2";
    version = "1.0.46";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "94e2ef8dbfc347b10c094890f778ee2e36ca9bb4262e86dc99cd217e35f3470b";
    };
    features = builtins.concatLists [
      ["default"]
      ["proc-macro"]
    ];
    dependencies = {
      unicode_ident = rustPackages."registry+https://github.com/rust-lang/crates.io-index".unicode-ident."1.0.4" {inherit profileName;};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".quote."1.0.21" = overridableMkRustCrate (profileName: rec {
    name = "quote";
    version = "1.0.21";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "bbe448f377a7d6961e30f5955f9b8d106c3f5e449d493ee1b125c1d43c2b5179";
    };
    features = builtins.concatLists [
      ["default"]
      ["proc-macro"]
    ];
    dependencies = {
      proc_macro2 = rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.46" {inherit profileName;};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".syn."1.0.101" = overridableMkRustCrate (profileName: rec {
    name = "syn";
    version = "1.0.101";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "e90cde112c4b9690b8cbe810cba9ddd8bc1d7472e2cae317b69e9438c1cba7d2";
    };
    features = builtins.concatLists [
      ["clone-impls"]
      ["default"]
      ["derive"]
      ["full"]
      ["parsing"]
      ["printing"]
      ["proc-macro"]
      ["quote"]
      ["visit"]
    ];
    dependencies = {
      proc_macro2 = rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.46" {inherit profileName;};
      quote = rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.21" {inherit profileName;};
      unicode_ident = rustPackages."registry+https://github.com/rust-lang/crates.io-index".unicode-ident."1.0.4" {inherit profileName;};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".time."0.1.44" = overridableMkRustCrate (profileName: rec {
    name = "time";
    version = "0.1.44";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "6db9e6914ab8b1ae1c260a4ae7a49b6c5611b40328a735b21862567685e73255";
    };
    dependencies = {
      libc = rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.133" {inherit profileName;};
      ${
        if hostPlatform.parsed.kernel.name == "wasi"
        then "wasi"
        else null
      } =
        rustPackages."registry+https://github.com/rust-lang/crates.io-index".wasi."0.10.0+wasi-snapshot-preview1" {inherit profileName;};
      ${
        if hostPlatform.isWindows
        then "winapi"
        else null
      } =
        rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi."0.3.9" {inherit profileName;};
    };
  });

  "unknown".toolkit."0.1.0" = overridableMkRustCrate (profileName: rec {
    name = "toolkit";
    version = "0.1.0";
    registry = "unknown";
    src = fetchCrateLocal workspaceSrc;
    dependencies = {
      chrono = rustPackages."registry+https://github.com/rust-lang/crates.io-index".chrono."0.4.22" {inherit profileName;};
      html_escape = rustPackages."registry+https://github.com/rust-lang/crates.io-index".html-escape."0.2.11" {inherit profileName;};
      ipnet = rustPackages."registry+https://github.com/rust-lang/crates.io-index".ipnet."2.5.0" {inherit profileName;};
      unescape = rustPackages."registry+https://github.com/rust-lang/crates.io-index".unescape."0.1.0" {inherit profileName;};
      urlencoding = rustPackages."registry+https://github.com/rust-lang/crates.io-index".urlencoding."2.1.0" {inherit profileName;};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".unescape."0.1.0" = overridableMkRustCrate (profileName: rec {
    name = "unescape";
    version = "0.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "ccb97dac3243214f8d8507998906ca3e2e0b900bf9bf4870477f125b82e68f6e";
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".unicode-ident."1.0.4" = overridableMkRustCrate (profileName: rec {
    name = "unicode-ident";
    version = "1.0.4";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "dcc811dc4066ac62f84f11307873c4850cb653bfa9b1719cee2bd2204a4bc5dd";
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".urlencoding."2.1.0" = overridableMkRustCrate (profileName: rec {
    name = "urlencoding";
    version = "2.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "68b90931029ab9b034b300b797048cf23723400aa757e8a2bfb9d748102f9821";
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".utf8-width."0.1.6" = overridableMkRustCrate (profileName: rec {
    name = "utf8-width";
    version = "0.1.6";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "5190c9442dcdaf0ddd50f37420417d219ae5261bbf5db120d0f9bab996c9cba1";
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".wasi."0.10.0+wasi-snapshot-preview1" = overridableMkRustCrate (profileName: rec {
    name = "wasi";
    version = "0.10.0+wasi-snapshot-preview1";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "1a143597ca7c7793eff794def352d41792a93c481eb1042423ff7ff72ba2c31f";
    };
    features = builtins.concatLists [
      ["default"]
      ["std"]
    ];
  });

  "registry+https://github.com/rust-lang/crates.io-index".wasm-bindgen."0.2.83" = overridableMkRustCrate (profileName: rec {
    name = "wasm-bindgen";
    version = "0.2.83";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "eaf9f5aceeec8be17c128b2e93e031fb8a4d469bb9c4ae2d7dc1888b26887268";
    };
    features = builtins.concatLists [
      ["default"]
      ["spans"]
      ["std"]
    ];
    dependencies = {
      cfg_if = rustPackages."registry+https://github.com/rust-lang/crates.io-index".cfg-if."1.0.0" {inherit profileName;};
      wasm_bindgen_macro = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".wasm-bindgen-macro."0.2.83" {profileName = "__noProfile";};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".wasm-bindgen-backend."0.2.83" = overridableMkRustCrate (profileName: rec {
    name = "wasm-bindgen-backend";
    version = "0.2.83";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "4c8ffb332579b0557b52d268b91feab8df3615f265d5270fec2a8c95b17c1142";
    };
    features = builtins.concatLists [
      ["spans"]
    ];
    dependencies = {
      bumpalo = rustPackages."registry+https://github.com/rust-lang/crates.io-index".bumpalo."3.11.0" {inherit profileName;};
      log = rustPackages."registry+https://github.com/rust-lang/crates.io-index".log."0.4.17" {inherit profileName;};
      once_cell = rustPackages."registry+https://github.com/rust-lang/crates.io-index".once_cell."1.15.0" {inherit profileName;};
      proc_macro2 = rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.46" {inherit profileName;};
      quote = rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.21" {inherit profileName;};
      syn = rustPackages."registry+https://github.com/rust-lang/crates.io-index".syn."1.0.101" {inherit profileName;};
      wasm_bindgen_shared = rustPackages."registry+https://github.com/rust-lang/crates.io-index".wasm-bindgen-shared."0.2.83" {inherit profileName;};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".wasm-bindgen-macro."0.2.83" = overridableMkRustCrate (profileName: rec {
    name = "wasm-bindgen-macro";
    version = "0.2.83";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "052be0f94026e6cbc75cdefc9bae13fd6052cdcaf532fa6c45e7ae33a1e6c810";
    };
    features = builtins.concatLists [
      ["spans"]
    ];
    dependencies = {
      quote = rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.21" {inherit profileName;};
      wasm_bindgen_macro_support = rustPackages."registry+https://github.com/rust-lang/crates.io-index".wasm-bindgen-macro-support."0.2.83" {inherit profileName;};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".wasm-bindgen-macro-support."0.2.83" = overridableMkRustCrate (profileName: rec {
    name = "wasm-bindgen-macro-support";
    version = "0.2.83";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "07bc0c051dc5f23e307b13285f9d75df86bfdf816c5721e573dec1f9b8aa193c";
    };
    features = builtins.concatLists [
      ["spans"]
    ];
    dependencies = {
      proc_macro2 = rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.46" {inherit profileName;};
      quote = rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.21" {inherit profileName;};
      syn = rustPackages."registry+https://github.com/rust-lang/crates.io-index".syn."1.0.101" {inherit profileName;};
      wasm_bindgen_backend = rustPackages."registry+https://github.com/rust-lang/crates.io-index".wasm-bindgen-backend."0.2.83" {inherit profileName;};
      wasm_bindgen_shared = rustPackages."registry+https://github.com/rust-lang/crates.io-index".wasm-bindgen-shared."0.2.83" {inherit profileName;};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".wasm-bindgen-shared."0.2.83" = overridableMkRustCrate (profileName: rec {
    name = "wasm-bindgen-shared";
    version = "0.2.83";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "1c38c045535d93ec4f0b4defec448e4291638ee608530863b1e2ba115d4fff7f";
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".winapi."0.3.9" = overridableMkRustCrate (profileName: rec {
    name = "winapi";
    version = "0.3.9";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419";
    };
    features = builtins.concatLists [
      ["activation"]
      ["combaseapi"]
      ["minwinbase"]
      ["minwindef"]
      ["ntdef"]
      ["objbase"]
      ["profileapi"]
      ["roapi"]
      ["std"]
      ["sysinfoapi"]
      ["timezoneapi"]
      ["winerror"]
      ["winstring"]
    ];
    dependencies = {
      ${
        if hostPlatform.config == "i686-pc-windows-gnu"
        then "winapi_i686_pc_windows_gnu"
        else null
      } =
        rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi-i686-pc-windows-gnu."0.4.0" {inherit profileName;};
      ${
        if hostPlatform.config == "x86_64-pc-windows-gnu"
        then "winapi_x86_64_pc_windows_gnu"
        else null
      } =
        rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi-x86_64-pc-windows-gnu."0.4.0" {inherit profileName;};
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".winapi-i686-pc-windows-gnu."0.4.0" = overridableMkRustCrate (profileName: rec {
    name = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6";
    };
  });

  "registry+https://github.com/rust-lang/crates.io-index".winapi-x86_64-pc-windows-gnu."0.4.0" = overridableMkRustCrate (profileName: rec {
    name = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo {
      inherit name version;
      sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f";
    };
  });
}
