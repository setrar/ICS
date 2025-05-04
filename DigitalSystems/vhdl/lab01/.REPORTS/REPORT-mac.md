- [ ] Install openFPGA

```
brew install openfpgaloader
```
> Returns
```powershell
Running `brew update --auto-update`...
==> Auto-updated Homebrew!
Updated 1 tap (homebrew/cask).
==> New Casks
posture-pal                                                          proton-mail

You have 29 outdated formulae and 10 outdated casks installed.

==> Downloading https://ghcr.io/v2/homebrew/core/openfpgaloader/manifests/0.12.0
################################################################################################################################## 100.0%
==> Fetching dependencies for openfpgaloader: confuse and libftdi
==> Downloading https://ghcr.io/v2/homebrew/core/confuse/manifests/3.3
################################################################################################################################## 100.0%
==> Fetching confuse
==> Downloading https://ghcr.io/v2/homebrew/core/confuse/blobs/sha256:6d46500c283c20fcf41348fc34293d30a85e0fac9955ea849369deeaf84b3a2b
################################################################################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/libftdi/manifests/1.5_2
################################################################################################################################## 100.0%
==> Fetching libftdi
==> Downloading https://ghcr.io/v2/homebrew/core/libftdi/blobs/sha256:63ffb0285cabb32fb40e7f609ba8e63da9c0452e30400bd9261218bd3e393b9f
################################################################################################################################## 100.0%
==> Fetching openfpgaloader
==> Downloading https://ghcr.io/v2/homebrew/core/openfpgaloader/blobs/sha256:e01a215c16c41140fcbda7940a95cefdcdd7fdc941390238fbaf6f842c8a
################################################################################################################################## 100.0%
==> Installing dependencies for openfpgaloader: confuse and libftdi
==> Installing openfpgaloader dependency: confuse
==> Downloading https://ghcr.io/v2/homebrew/core/confuse/manifests/3.3
Already downloaded: /Users/valiha/Library/Caches/Homebrew/downloads/a09f514665c87141e6f2fd437ab609993f206ef00910cea28201e52a918329bf--confuse-3.3.bottle_manifest.json
==> Pouring confuse--3.3.arm64_sonoma.bottle.tar.gz
🍺  /opt/homebrew/Cellar/confuse/3.3: 15 files, 243.4KB
==> Installing openfpgaloader dependency: libftdi
==> Downloading https://ghcr.io/v2/homebrew/core/libftdi/manifests/1.5_2
Already downloaded: /Users/valiha/Library/Caches/Homebrew/downloads/d7dd754a416715375d46e69a69b46cf756740bfd46a279c9d32b8abc20008e0a--libftdi-1.5_2.bottle_manifest.json
==> Pouring libftdi--1.5_2.arm64_sonoma.bottle.tar.gz
🍺  /opt/homebrew/Cellar/libftdi/1.5_2: 58 files, 1.1MB
==> Installing openfpgaloader
==> Pouring openfpgaloader--0.12.0.arm64_sonoma.bottle.tar.gz
🍺  /opt/homebrew/Cellar/openfpgaloader/0.12.0: 56 files, 5.5MB
==> Running `brew cleanup openfpgaloader`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
```

* [References openFPGA](https://trabucayre.github.io/openFPGALoader/guide/first-steps.html)
* [Vivado workflow (macOS/Apple Silicon)](https://www.reddit.com/r/FPGA/comments/18vrtrf/vivado_workflow_macosapple_silicon/)


```
 openFPGALoader --list-boards | grep zybo
 ```
 > Returns
 ```powershell
zybo_z7_10               digilent
zybo_z7_20               digilent
```

- [ ] Install [`ghdl`](https://ghdl.github.io/ghdl/) :warning: Not working 

```
brew install ghdl
```
> Returns
```powershell
==> Downloading https://github.com/ghdl/ghdl/releases/download/v3.0.0/ghdl-macos-11-llvm.tgz
==> Downloading from https://objects.githubusercontent.com/github-production-release-asset-2e65be/46439446/6de5fb33-49d
################################################################################################################ 100.0%
==> Installing Cask ghdl
==> Linking Binary 'ghdl' to '/opt/homebrew/bin/ghdl'
🍺  ghdl was successfully installed!
```

```
ghdl help
```
> Returns
```powershell
usage: ghdl COMMAND [OPTIONS] ...
COMMAND is one of:
analyze [OPTS] FILEs
  Analyze one or multiple VHDL files
  aliases: -a, analyse
elaborate [OPTS] UNIT [ARCH]
  Elaborate design UNIT
  alias: -e
run UNIT [ARCH] [RUNOPTS]
  Run design UNIT
  alias: -r
elab-run [OPTS] UNIT [ARCH] [RUNOPTS]
  Elaborate and run design UNIT
  alias: --elab-run
bind [OPTS] UNIT [ARCH]
  Bind design UNIT
  alias: --bind
link [OPTS] UNIT [ARCH]
  Link design UNIT
  alias: --link
list-link [OPTS] UNIT [ARCH]
  List objects file to link UNIT
  alias: --list-link
compile [OPTS] FILEs -e UNIT [ARCH]
  Generate whole sequence to elaborate design UNIT from FILEs
  alias: -c
make [OPTS] UNIT [ARCH]
  Make design UNIT
  alias: -m
gen-makefile [OPTS] UNIT [ARCH]
  Generate a Makefile for design UNIT
  alias: --gen-makefile
gen-depends [OPTS] UNIT [ARCH]
  Generate dependencies of design UNIT
  alias: --gen-depends
disp-config
  Display tools path
  aliases: --disp-config, dispconfig, --dispconfig
bootstrap-std
  (internal) Compile std.standard
  alias: --bootstrap-standard
synth [FILES... -e] UNIT [ARCH]
  Synthesis from UNIT
  alias: --synth
import [OPTS] FILEs
  Import units of FILEs
  alias: -i
syntax [OPTS] FILEs
  Check syntax of FILEs
  alias: -s
dir [LIBs]
  Display contents of the libraries
  alias: --dir
files FILEs
  Display units in FILES
  alias: -f
clean
  Remove generated files
  alias: --clean
remove
  Remove generated files and library file
  alias: --remove
copy
  Copy work library to current directory
  alias: --copy
disp-standard
  Disp std.standard in pseudo-vhdl
  alias: --disp-standard
elab-order [--libraries] [OPTS] UNIT [ARCH]
  Display ordered source files
  alias: --elab-order
find-top
  Display possible top entity in work library
  alias: --find-top
chop [OPTS] FILEs
  Chop FILEs
  alias: --chop
lines FILEs
  Precede line with its number
  alias: --lines
reprint [OPTS] FILEs
  Redisplay FILEs
  alias: --reprint
fmt [OPTS] FILEs
  Format FILEs
  alias: --format
compare-tokens [OPTS] REF FILEs
  Compare FILEs with REF
  alias: --compare-tokens
pp-html FILEs
  Pretty-print FILEs in HTML
  alias: --pp-html
xref-html FILEs
  Display FILEs in HTML with xrefs
  alias: --xref-html
xref FILEs
  Generate xrefs
  alias: --xref
--vpi-compile CMD ARGS
  Compile with VPI/VHPI include path
--vpi-link CMD ARGS
  Link with VPI/VHPI library
--vpi-cflags
  Display VPI/VHPI compile flags
--vpi-ldflags
  Display VPI/VHPI link flags
--vpi-include-dir
  Display VPI/VHPI include directory
--vpi-library-dir
  Display VPI/VHPI library directory
--vpi-library-dir-unix
  Display VPI/VHPI library directory (unix form)
file-to-xml FILEs
  Dump AST in XML
  alias: --file-to-xml
--libghdl-name
  Display libghdl name
--libghdl-library-path
  Display libghdl library path
--libghdl-include-dir
  Display libghdl include directory
help [CMD]
  Display this help or [help on CMD]
  aliases: -h, --help
version
  Display ghdl version
  aliases: -v, --version
opts-help
  Display help for analyzer options
  alias: --options-help

To display the options of a GHDL program,
  run your program with the 'help' option.
Also see 'opts-help' for analyzer options.

Please, refer to the GHDL manual for more information.
Report issues on https://github.com/ghdl/ghdl
```

```
brew install gtkwave
```
> Returns
```powershell
==> Downloading https://formulae.brew.sh/api/formula.jws.json

Warning: Formula gtkwave was renamed to homebrew/cask/gtkwave.
==> Downloading https://formulae.brew.sh/api/cask.jws.json
################################################################################################################ 100.0%
==> Caveats
You may need to install Perl’s Switch module to run gtkwave’s command line
tool, e.g. using `cpan install Switch`

  https://ughe.github.io/2018/11/06/gtkwave-osx

==> Downloading https://downloads.sourceforge.net/gtkwave/gtkwave-3.3.107-osx-app/gtkwave.zip
==> Downloading from https://versaweb.dl.sourceforge.net/project/gtkwave/gtkwave-3.3.107-osx-app/gtkwave.zip
################################################################################################################ 100.0%
==> Installing Cask gtkwave
==> Moving App 'gtkwave.app' to '/Applications/gtkwave.app'
==> Linking Binary 'gtkwave' to '/opt/homebrew/bin/gtkwave'
🍺  gtkwave was successfully installed!
```

# &#x1F4DA; References

- [ ] [Developing FPGAs on a Raspberry Pi 400 with Cocotb](https://www.hackster.io/adam-taylor/developing-fpgas-on-a-raspberry-pi-400-with-cocotb-fd4b7e)
- [ ] [Installs Vivado on M1/M2 macs](https://github.com/ichi4096/vivado-on-silicon-mac)
- [ ] [Unable to launch GTKWave on macOS Sonoma](https://github.com/gtkwave/gtkwave/issues/250)
- [ ] [GTKWave on MacOS Sonoma](https://www.reddit.com/r/FPGA/comments/16tqja3/gtkwave_on_macos_sonoma/)
