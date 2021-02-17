<h1 align="center">mac-o-dos</h1>
<a href="https://github.com/richardklose/mac-o-dos/blob/master/LICENSE">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" target="_blank" />
</a>
<a href="https://twitter.com/richard_klose">
    <img alt="Twitter: richard_klose" src="https://img.shields.io/twitter/follow/richard_klose.svg?style=social" target="_blank" />
</a>

> Create macOS apps out of DOS apps... automatically 🪄📦

### 🏠 [Homepage](https://github.com/richardklose/mac-o-dos)

This script creates a macOS Dosbox-X wrapper app for DOS applications. All you need is:
    - The name of the DOS application
    - The original DOS files of the application
    - A suitable dosbox config file

## Usage
```bash
./mac-o-dos.sh --name=<appname> --conf=<path_to_dosbox.conf> --app=<path_to_dos_app_dir>

Options:
  -n, --name           (Required) The desired name of the final macOS app.
  -c, --conf           (Required) Path to the Dosbox-X config file.
  -a, --app            (Required) Path to the directory with the files of the DOS applications.
  -d, --dosbox-version (Optional) Version of Dosbox-X that should be used. (0.83.10 and later)
  --arm                (Optional) Use the ARM version of Dosbox-X for Apple Silicon Macs.
```

mac-o-dos will perform the following operations automatically:
* Download Dosbox-X v 0.83.10 from GitHub
* Create .app
* Install Dosbox-X Wrapper into the .app
* Install Dosbox-X Config File into the .app
* Install DOS application into the .app
* Install Dosbox-X for either Apple Silicon Macs or Intel Macs into the .app

## Installation

### Option A: Download
* [Download here](https://github.com/richardklose/mac-o-dos/archive/master.zip)
* Extract the zip archive
* Open Terminal and `cd` to the directory you just downloaded.

### Option B: Git
Run the following commands in your Terminal
```
git clone https://github.com/richardklose/mac-o-dos.git
cd mac-o-dos
```

## Remaining TODOs
* Add a plist file, so we can have nice icons.

## 👤 Author

**Richard Klose &lt;richard@klose.dev&gt;**

* Twitter: [@richard_klose](https://twitter.com/richard_klose)
* Github: [@richardklose](https://github.com/richardklose)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/richardklose/mac-o-dos/issues).

## Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2019 [Richard Klose &lt;richard@klose.dev&gt;](https://github.com/richardklose).<br />
This project is [MIT](https://github.com/richardklose/mac-o-dos/blob/master/LICENSE) licensed.