<!-- MASTER-ONLY: DO NOT MODIFY THIS FILE

Copyright © Telecom Paris
Copyright © Renaud Pacalet (renaud.pacalet@telecom-paris.fr)

This file must be used under the terms of the CeCILL. This source
file is licensed as described in the file COPYING, which you should
have received as part of this distribution. The terms are also
available at:
https://cecill.info/licences/Licence_CeCILL_V2.1-en.html
-->

Frequently asked questions

---

[TOC]

---

# Text editors

## I do not know any text editor under GNU/Linux (or macOS), which one shall I use?

If you don't know any text editor yet, chances are that you would find the learning curve of the most powerful ones, like `vim` or `emacs`, a bit too steep.
A good starting point is GNU `nano` which offers a good balance between simplicity of use and efficiency.
It is installed by default on many GNU/Linux distributions like Ubuntu and under macOS.

To edit a file simply open a terminal and type:

```bash
nano myFile.txt
```

Use the arrows to navigate, type some text, use the backspace or delete keys to delete text.
Once you are done with your editing type <kbd>Ctrl+O</kbd> (press <kbd>Ctrl</kbd>, do not release it, then press <kbd>O</kbd>, release <kbd>O</kbd>, release <kbd>Ctrl</kbd>) to save the file and <kbd>Ctrl+X</kbd> to exit `nano`.
Of course `nano` has much more to offer.
Launch `nano` and type <kbd>Ctrl+G</kbd> to see the integrated help.
If you prefer a tutorial search Internet with _nano editor tutorial_ and you should quickly find one.

# GitLab authentication with `ssh` 

The following assumes that you use default names and locations for your `ssh` keys.
If you do not use the default you probably know what you are doing and do not need this FAQ.

## The `git` server asks for a password when I try to `clone`, `push`, `pull`, `fetch`, etc. how can I avoid this?

There are several possible reasons:

1. You tried to clone the repository using the `https` protocol (`https://gitlab.eurecom.fr/renaud.pacalet/ds.git`) and your OS does not provide a `git` credential manager to handle the password for you.
   Try again with the `ssh` protocol:

   ```bash
   git clone git@gitlab.eurecom.fr:renaud.pacalet/ds.git
   ```

1. You already successfully cloned the repository but you did it using the `https` protocol (`https://gitlab.eurecom.fr/renaud.pacalet/ds.git`) and your OS does not provide a `git` credential manager to handle the password for you.
   Check the protocol:

   ```bash
   cd path/to/the/clone
   git remote -v
   ```

   ```escape
   <!origin   https://gitlab.eurecom.fr/renaud.pacalet/ds.git (fetch)
   origin   https://gitlab.eurecom.fr/renaud.pacalet/ds.git (push)!>
   ```

  If it is `https`, either set up a `git` credential manager or change the protocol for `ssh`:

   ```bash
   git remote set-url origin git@gitlab.eurecom.fr:renaud.pacalet/ds.git
   git remote -v
   ```

   ```escape
   <!origin   git@gitlab.eurecom.fr:renaud.pacalet/ds.git (fetch)
   origin   git@gitlab.eurecom.fr:renaud.pacalet/ds.git (push)!>
   ```

1. You used the `ssh` protocol but you did not add your `ssh` public key to your GitLab account.
   If you do not have a `ssh` key pair yet (see [How do I know if I already have a `ssh` key pair?](#how-do-i-know-if-i-already-have-a-ssh-key-pair)) generate one (see [How to generate a ssh key pair?](#how-to-generate-a-ssh-key-pair)).
   Add the public part of your key pair to your GitLab account (see [How do I add my `ssh` public key to my GitLab account?](#how-do-i-add-my-ssh-public-key-to-my-gitlab-account)).

1. You do not have a `ssh` agent running or your `bash` session does not know about it.
   Check:

   ```bash
   ssh-add -l
   ```

   ```escape
   <!Could not open a connection to your authentication agent.!>
   ```

   If you do not have a running `ssh` agent, launch one:

   ```bash
   eval $(ssh-agent -s)
   ```

1. You have a running `ssh` agent but you did not add your private key to the agent.
   Do it:

   ```bash
   ssh-add
   ```

  > Note: if your private key is protected you will have to enter your passphrase to unlock it.

## How do I know if I already have a `ssh` key pair?

Your `ssh` key pairs are normally stored in a sub-directory of your home directory named `.ssh`.
Each key pair is stored in two files: `KEY.pub` for the public part and `KEY` for the private part, where `KEY` is some name.
To check what `ssh` keys you have simply list the content of this sub-directory:

```bash
ls ~/.ssh
```

```escape
<!authorized_keys  id_ed25519      id_rsa      known_hosts
config           id_ed25519.pub  id_rsa.pub!>
```

In this list we see 2 key pairs: `id_ed25519`/`id_ed25519.pub` and `id_rsa`/`id_rsa.pub`.

## How to generate a `ssh` key pair?

`ssh-keygen` is the command that generates `ssh` key pairs.
During the key pair generation you will be asked to enter the name of the file in which to save the key; hit <kbd>Enter</kbd> to accept the default.
You will also be asked to type twice a passphrase to protect the private key.
If you enter en empty passphrase (by just hitting the <kbd>Enter</kbd> key) your private key will not be passphrase-protected.
As it is stored under your home directory with restricted access permissions, and as what you will do with your GitLab account is probably not critical, this is a reasonable choice that will save yourself the burden of remembering a passphrase and having to type it from time to time.
But if you are concerned about security, or intend to store valuable assets on your GitLab account, feel free to enter a non-empty passphrase.
Example of key pair generation under GNU/Linux (`ed25519` is the kind of key pair currently recommended by security experts over the default `rsa`):

```bash
ssh-keygen -t ed25519
```

```escape
<!Generating public/private ed25519 key pair.
Enter file in which to save the key (/homes/shelley/.ssh/id_ed25519):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /homes/shelley/.ssh/id_ed25519
Your public key has been saved in /homes/shelley/.ssh/id_ed25519.pub
The key fingerprint is:
SHA256:OlWKH9VRKKM3TJYfSgkO9VzZRyegHlrFbs913FTigFo shelley@megantic
The key's randomart image is:
+--[ED25519 256]--+
|      ..o. =**+.=|
|       o oE==+.o+|
|        .OO*...+.|
|       .oB=.+   =|
|      . S..o o ..|
|       + .    o  |
|      o .        |
|       .         |
|                 |
+----[SHA256]-----+!>
```

Your public key is in `~/.ssh/id_ed25519.pub` and your private key is in `~/.ssh/id_ed25519`.
Of course, as the names indicate, you can (and must) disclose the former but you must keep the latter secret.
This is why `ssh` complains if your private key files have too open access permissions.

## How do I add my `ssh` public key to my GitLab account?

Visit the [_SSH Keys_ section of your _User Settings_](https://gitlab.eurecom.fr/-/profile/keys), log in with your LDAP-EURECOM credentials if asked to, click on `Add new key`.
Copy the **content** of `~/.ssh/KEY.pub` (where `KEY` is the base name of the key you want to use) to the clipboard, paste it in the `Key` text box and click on the `Add Key` button.

# Working on personal computer

## Can I clone the `git` repository on my laptop?

Yes, likely.
How to do it depends on your OS, `git` client, preferred authentication method...

Under Windows I recommend installing [Git for Windows] and using the `bash` that comes with it (even if there is also a graphical user interface).

Under macOS I recommend installing decently recent GNU/Linux utilities (`bash`, `git`...) with, e.g., [MacPorts] or [Homebrew].
The versions of these that come with macOS are frequently outdated.

Under any GNU/Linux OS, `bash`, the `ssh` client and the `git` client should be available by default.

Then, open a `bash` terminal and type the following commands.

```bash
git clone git@gitlab.eurecom.fr:renaud.pacalet/ds.git ~/Documents/ds
cd ~/Documents/ds
git switch shelley
git pull
git merge --no-edit origin/master
git config user.name shelley
git config user.email mary.shelley@eurecom.fr
```

# The command-line interface: `bash`

When using the Command-Line Interface (CLI) on EURECOM GNU/Linux computers you are communicating with a software program named `bash`.
**Warning**: by default under recent versions of macOS the CLI is more likely `zsh`, a different program with different syntax, commands, etc.
If your CLI is not `bash` please read its manual (or switch to `bash`).

## What are `bash` variables and how to use them?

Like most programming languages `bash` supports variables to store values.
A variable name contains only letters, digits and underscores and must start with a letter or a underscore.
It is defined by a simple assignment with no spaces around the `=` sign:

```bash
foo=42
```

It is expanded by preceding its name with a `$` sign:

```bash
echo foo
```

```escape
<!foo!>
```

```bash
echo $foo
```

```escape
<!42!>
```

Undefined variables expand as the empty string:

```bash
echo X${bar}X
```

```escape
<!XX!>
```

If a variable expansion is immediately followed by alphanumeric characters or underscores it must be isolated with curly braces to avoid ambiguities:

```bash
echo $foobar
```

```escape
<!!>
```

```bash
echo ${foo}bar
```

```escape
<!42bar!>
```

> Note: variable definitions are not persistent, they are valid only for the current `bash` session.
> To avoid having to type them each time you open a new terminal window or a new tab in a terminal window see [How to make my `bash` variable definitions permanent?](#how-to-make-my-bash-variable-definitions-permanent).

## What is the difference between environment variables and regular variables?

By default a variable definition is valid only for the current `bash` session, not for sub-sessions or commands launched from the current `bash` session.
The `export` built-in command of `bash` is used to pass variable definitions to subsequently executed commands:

```bash
foo=42
export foo
```

Or, all at once:

```bash
export foo=42
```

When a sub-sessions or a command is launched it inherits all exported variables of the parent `bash`.
They are part of its _environment_, reason why they are called _environment variables_.

## How can I use `bash` variables to simplify the typing of long commands?

Some commands can be quite long, especially when they involve absolute paths.
Example: assume we want to convert several files from this project to upper case using the `/packages/LabSoC/bin/to_uc` toy utility.
Suppose also we were asked to work out of the source tree to avoid accidental addition of generated files to the `git` repository.
We could type:

```bash
mkdir -p /tmp/shelley/labs   # create a temporary working directory under /tmp
cd /tmp/shelley/labs         # change current directory
/packages/LabSoC/bin/to_uc /homes/shelley/Documents/ds/FAQ.md FAQ.upper.md
/packages/LabSoC/bin/to_uc /homes/shelley/Documents/ds/README.md README.upper.md
/packages/LabSoC/bin/to_uc /homes/shelley/Documents/ds/foo/bar/baz baz.upper
```

We could also use _`bash` variables_ to simplify the typing.
Once a variable was defined it can be used in commands:

```bash
cln=/homes/shelley/Documents/ds     # absolute path of clone of git repository
twd=/tmp/shelley/labs               # absolute path of temporary working directory
mkdir -p "$twd"                     # create temporary working directory
cd "$twd"                           # change current directory
/packages/LabSoC/bin/to_uc "$cln"/FAQ.md FAQ.upper.md
/packages/LabSoC/bin/to_uc "$cln"/README.md README.upper.md
/packages/LabSoC/bin/to_uc "$cln"/foo/bar/baz baz.upper
```

> Note: as you can see we enclosed the variable expansions in double-quotes (`"$cln"`).
> This FAQ is not the best place to explain why, just remember that this a recommended practice.

We can do even better with the [`PATH` environment variable](#what-is-the-path-environment-variable-and-how-to-use-it).

## What is the `PATH` environment variable and how to use it?

Some commands you type in the terminal are `bash` built-in commands, `bash` knows them because they are part of it.
To run these commands you just use their name:

```bash
echo "Hello world!"
```

```escape
<!Hello world!!>
```

In order to run an external command, that is, not a built-in, like the `to_uc` toy command, you can type its absolute path:

```bash
/packages/LabSoC/bin/to_uc /homes/shelley/Documents/ds/FAQ.md FAQ.upper.md
```

As this is not very convenient, `bash` provides and uses an environment variable named `PATH` which value is a colon-separated list of directories in which external commands are searched for.
Let's print its current value:

```bash
printenv PATH
```

```escape
<!/bin:/usr/bin:/usr/local/bin!>
```

As it is not part of it yet let's add `/packages/LabSoC/bin` to the `PATH` definition:

```bash
export PATH="$PATH":/packages/LabSoC/bin
printenv PATH
```

```escape
<!/bin:/usr/bin:/usr/local/bin:/packages/LabSoC/bin!>
```

> Note how we use the current value of the variable (`$PATH`) in the new value.
> Be careful when typing the variable assignment because if you get it wrong it could be that your `bash` session does not find any command any more.
> If it happens, just launch a new `bash` session.

The letter case conversion command can now be as simple as:

```bash
to_uc /homes/shelley/Documents/ds/FAQ.md FAQ.upper.md
```

> Note: this `PATH` definition is not persistent, it is valid only for the current `bash` session.
> To avoid having to type it each time you open a new terminal window or a new tab in a terminal window see [How to make my `bash` variable definitions permanent?](#how-to-make-my-bash-variable-definitions-permanent).
> To simplify also the typing of the source file path see [How can I use `bash` variables to simplify the typing of long commands?](#how-can-i-use-bash-variables-to-simplify-the-typing-of-long-commands).

## How to make my `bash` variable definitions permanent?

When a new `bash` session is launched (for instance when you open a new terminal window or a new tab in a terminal window) it evaluates (_sources_, in `bash` parlance) a _runcom_ (`rc`) file.
Which file is sourced depends if it is an interactive session or not, and if it is a login session or not.
On EURECOM GNU/Linux computers, if you launched a new `bash` session by opening a new terminal window or a new tab in an existing terminal window, chances are that the sourced _runcom_ file was `~/.bashrc+`.

So, you can make variable definitions permanent by adding them to this file.

> Note that this will take effect only the next time you will launch a new `bash` session.

This is not limited to variable definitions.
Definitions of `bash` functions can also be added to the _runcom_ file.
Other `bash` commands too.

## When trying to execute a command I get a `command not found` error, why?

One first possible reason is that the command is not installed on the computer.
If you know where the command is supposed to be you can verify if it is installed by listing the content of the directory where it is supposed to be:

```bash
ls /packages/LabSoC/bin
```

Note: do not rely on the auto-completion (e.g., `ls /packages/LabS`+<kbd>tab</kbd>) to conclude that a directory is not there; some are automatically mounted from a remote NFS server when needed and the completion can fail just because the auto-mounter did not mount the NFS share yet.

Another possible reason is that you forgot to tell your `bash` session where to find the command.
See the [`PATH` environment variable](#what-is-the-path-environment-variable-and-how-to-use-it).

# The VHDL language

- [How can I initialize a vector?][Aggregate notation]
- [What types shall I use for arithmetic?][Arithmetic: which types to use?]
- [What is the syntax for comments?][Comments]
- [What are D flip flops (DFF) and latches?][D-flip-flops (DFF) and latches]
- [I don't know where to start from to design my hardware device with VHDL][Digital hardware design using VHDL in a nutshell]
- [Can I reuse hardware models to create a new hardware device?][Entity instantiations]
- [The synthesis reports are verbose; what shall I look at?][Examining synthesis results]
- [Is there a way to design a generic hardware device, say a N-bits adder?][Generics]
- [What are the most important things I should know about VHDL before I start coding?][Getting started with VHDL]
- [I have a boolean function but it is not defined by an equation, all I have is its truth table; how can I model it in VHDL?][How to implement a boolean function defined as a Look Up Table?]
- [I have the inputs and expected outputs in text files; can I use them to drive my simulation?][How to use text files to drive simulations?]
- [What are the constraints for the VHDL user identifiers?][Identifiers]
- [Is there a way to initialize variables or signals when declaring them; is it a good practice?][Initial value declarations]
- [Are there any object-oriented features in VHDL?][Protected types]
- [How can I generate random inputs for my simulation?][Random numbers generation]
- [Does VHDL support recursivity?][Recursivity]
- [What are the differences between `std_ulogic` and `std_logic` and which one shall I use?][Resolution functions, unresolved and resolved types]
- [What is the `std_ulogic` type?][`std_logic_1164`]
- [Can I declare an array type without specifying the dimensions?][Unconstrained types]
- [What is VHDL simulation and what shall I do to simulate my design?][VHDL simulation]
- [What is the `wait` statement?][Wait]
- [I got a compilation error about wait statement and sensitivity list, what does it mean?][Wait statement in a process with sensitivity list]

# Terminal emulators

## What is a terminal emulator?

The USB link between our computer and the Zybo board is used to power the Zybo but it can also be used to communicate with the operating system that runs on the ARM processor of the Zynq core.
In order to do this, if you do not have one already, you need to install a serial communication program on your computer, also frequently referred to as a _terminal emulator_.

## What terminal emulator can I use?

Under GNU/Linux and macOS `picocom` is a good option.
It is available from most GNU/Linux package managers and from MacPorts or Homebrew for macOS.
If you are under Windows, Digilent (manufacturer of the Zybo) has a [web page dedicated to installing and using the `Tera Term` terminal emulator under Windows](https://reference.digilentinc.com/learn/programmable-logic/tutorials/tera-term).

## How can I know which logical device on my computer corresponds to the Zybo board?

On EURECOM GNU/Linux computers a `udev` rule takes care of this: as soon as you connect a Zybo board and power up a `/dev/zyboUSB` symbolic link is created; use it.
Else, continue reading.

Under most operating systems many hardware components of the computer and also external peripherals connected to the computer are represented by one or several _logical devices_ (a single component or peripheral can have several interfaces, thus several logical devices).
Under GNU/Linux and macOS the logical devices are special files found in `/dev`.
Communicating with a component or a peripheral mostly consists in reading or writing its device files.
Under Window things are a bit different but the same concept of logical device applies.

Once you have a terminal emulator installed you need to know which logical devices on your computer corresponds to the Zybo.
If you power up the Zybo the logical devices should show up on your computer.

Under macOS it should be something like `/dev/cu.usbserial-210279A42E221`.
Under GNU/Linux it should be something like `/dev/ttyUSB1`.
Be careful, there are two device files with very similar names, one for the JTAG and one for the serial link.
If you pick the wrong one and nothing happens when you try to connect, try the other one.

Under Windows use the _Device Manager_ or the Graphical User Interface of your terminal emulator to explore and test the available devices.

## How can I attach the terminal emulator to the logical device of the Zybo board?

Once you found which logical device to use, launch your serial communication program (e.g. `picocom`) and attach it to the device.
Example under macOS with `picocom` if the device is `/dev/cu.usbserial-210279A42E221`:

```bash
picocom -b115200 /dev/cu.usbserial-210279A42E221
```

```escape
<!...
Welcome to DS (c) Telecom Paris
ds login: root
root@ds> !>
```

Note: the `-b115200` option of `picocom` specifies which baud rate to use (115200 symbols/s in our case).
There are other options that can be tuned but for our needs their default values should be OK.

Example under GNU/Linux with `picocom` if the device is `/dev/ttyUSB1`:

```bash
picocom -b115200 /dev/ttyUSB1
```

```escape
<!...
Welcome to DS (c) Telecom Paris
ds login: root
root@ds> !>
```

Note: under GNU/Linux if you get an error message about permissions you probably need to change the permissions of the device file which is, by default, mounted read/write for the root user only.
Example: `sudo chmod a+rw /dev/ttyUSB1`.
As the device disappears each time you disconnect the Zybo you will have to do this each time you reconnect and power up the board.
To make this permanent install a `udev` rule such that the device is always mounted with read/write permissions for all users (and in the same `udev` rule we can even create a convenient `/dev/zyboUSB` symbolic link, like on EURECOM computers):

   ```bash
   cat <<! > /tmp/51-usb2uartFT2232H.rules
   # USB2UART FT2232H
   ACTION=="add" \
   , ATTRS{interface}=="Digilent Adept USB Device" \
   , MODE="0666"
   ACTION=="add" \
   , ATTRS{interface}=="Digilent Adept USB Device" \
   , ATTRS{bInterfaceNumber}=="01" \
   , SYMLINK+="zyboUSB"
   !
   sudo cp /tmp/51-usb2uartFT2232H.rules /etc/udev/rules.d
   sudo udevadm control --reload-rules
   sudo udevadm trigger
   ```

# The DHT11 sensor

## I saw an Arduino software library for the DHT11 sensor, does it mean that Arduino boards have a hardware interface like the one we designed?

No, Arduino boards have a much simpler generic interface.
From the software we can read and write at specific addresses corresponding to the I/O pins of the board.
So the software library implements in software what we designed in hardware.
It reads and writes the I/O pin on which you plug the sensor and makes use of the internal timers of the Arduino chip to measure the time intervals between value changes.
If you study the source code of this library (recommended) you will probably recognize things that you are now familiar with.
This is the magic of microcontrollers (the Arduino chip is a microcontroller): they are not very powerful but they have plenty of I/Os, easily accessible from the software, plus timers and other useful components.
As long as performance is not an issue (and, in our case, there are no performance issues) they can be used to quickly design interfaces with many kinds of peripherals.

Note that the Zynq core of our Zybo board embeds an ARM processor with internal timers.
We could have used the same approach as the Arduino: design a very simple hardware interface to access the I/O pin of the Pmod connector with simple read/write operations from the software running on the ARM processor, and implement the complete protocol in software.
This software would be very similar to the one for Arduino.
But using a dual core ARM Cortex A9 processor running at 667 MHz just for this would be a bit overkill...

# Tools (GHDL, GTKWave, Modelsim, Vivado)

The course makes use of two types of tools: a VHDL simulator and a VHDL synthesizer.
The VHDL simulator allows to exercise your VHDL code, find bugs and fix them.
The VHDL synthesizer translates your VHDL code into a binary bitstream that you then use to reconfigure the FPGA circuit of the prototyping board.
 
If you want or must work on your own personal computer you will need to get access to these tools.
We will first look at commercial (but free) tools.
At the end of this chapter you will find some notes about free and open source alternatives.

## Where are the simulation and synthesis tools?

If you are working on one of the EURECOM's GNU/Linux computers the paths to the tools are:

* GHDL (simulation): `/packages/LabSoC/ghdl/bin`
* Modelsim (simulation): `/packages/LabSoC/Mentor/Modelsim/bin`
* Vivado (synthesis): `/packages/LabSoC/Xilinx/bin`

> Note: if you connected to `ssh.eurecom.fr` from remote, you connected to the EURECOM gateway.
> This gateway is not for development, no development tools are installed.
> To use the simulation or synthesis tools you must first bounce to one of the GNU/Linux desktop computers of lab room 52 (`eurecom1`, `eurecom2`, ..., `eurecom22`).
> You can check to which computer you are currently connected with the `hostname` command.

## What VHDL simulator can/shall I use?

Different from the synthesizer the simulator can be any VHDL simulator that you can find.
And different from synthesis, for simulation a GUI really makes a difference when debugging.
And using a simulator's GUI through `ssh`, while not always impossible, is far from convenient.

If you have a VHDL simulator already (note that there is one in Vivado), you can use it.
Else I recommend Modelsim from [Siemens].
Intel offers the ModelSim-Intel FPGA Starter Edition Software ([see below](#installing-modelsim-intel-fpga-starter-edition-software)) free of charge.
Please do not wait the last moment to install it, it takes some time to download (you will have to download a bit more than 1GB).
Even if you have Vivado installed, if you can also install Modelsim, prefer Modelsim for simulation, it is superior (full VHDL 2008 support, faster...).

The free and open source [GHDL]+[GTKWave] solution is another option.
Binaries are available for GNU/Linux, Windows and macOS and they can also be compiled from the sources.
This solution is a bit less user-friendly than Modelsim for debugging (no step-by-step, no breakpoints, etc.) but it is perfectly usable for our needs.

## Can I install the Modelsim simulator on my personal computer?

Under GNU/Linux or Windows install the ModelSim-Intel FPGAs Standard Edition Software version for your OS.
Under macOS install a GNU/Linux virtual machine (for instance with VirtualBox) and install the ModelSim-Intel FPGA Standard Edition Software version for Linux inside the virtual machine.
The ModelSim-Intel FPGA Standard Edition Software version has several limitations compared to the regular version but they should not be a problem for this course.

Important:
- As the archive to download is quite large, before downloading it double-check that you really download the **ModelSim-Intel FPGA Standard Edition Software** (not Quartus or any other tool), that it is the version for **your operating system** (Linux or Windows), and that you really install **ModelSim-Intel FPGA Starter Edition Software** (the installer tool also offers to install the **Pro** version that requires a license).
- After installation do not forget to protect the installation from accidental removal or modification.
- The GNU/Linux version is a 32 bits version so, as your GNU/Linux OS is very likely 64 bits, you will need to install the 32 bits version of several software libraries.
The following has been tested on Debian Bookworm and should also work under recent Ubuntu distributions:

```bash
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libxext6:i386 libxft2:i386 libstdc++6:i386
```

1. Download the installer using the [direct link for Linux] or the [direct link for Windows].
1. If the direct link does not work:
   * Visit the [ModelSim-Intel FPGA Standard Edition Software] download page.
   * Select the **Standard** edition (not Pro)
   * Select the latest version (**20.1.1** at the time of writing).
   * Select your operating system (Windows or Linux).

Be patient, the file is quite large.
Once it is downloaded double-click on the file's icon (Windows) or run the installer (Linux):

```bash
chmod +x ModelSimSetup-xxx-linux.run
./ModelSimSetup-xxx-linux.run
```

Select the _Modelsim - Intel FPGA Starter Edition_ and follow the instructions.
Once the installation is finished protect the installation from accidental removal or modification.
Example under GNU/Linux (replace `/some/where` with your own install path):

```bash
chmod -r a+rX-w /some/where
```

Finally, still under GNU/Linux, add the directory containing the installed executables to your `PATH` environment variable:

```bash
export PATH=$PATH:/some/where/modelsim_ase/bin
```

For a permanent `PATH` definition add the same command to your shell initialization file (e.g. `~/.bashrc`):

```bash
echo 'export PATH=$PATH:/some/where/modelsim_ase/bin' >> ~/.bashrc
```

The tools should now work.

### Troubleshooting

At the beginning of simulations you will maybe see warnings like these:

```escape
<!# ** Warning: (vsim-3116) Problem reading symbols from /lib/i386-linux-gnu/librt.so.1 : module was loaded at an absolute address.
# ** Warning: (vsim-3116) Problem reading symbols from /lib/i386-linux-gnu/libdl.so.2 : module was loaded at an absolute address.
# ** Warning: (vsim-3116) Problem reading symbols from /lib/i386-linux-gnu/libm.so.6 : module was loaded at an absolute address.
# ** Warning: (vsim-3116) Problem reading symbols from /lib/i386-linux-gnu/libpthread.so.0 : module was loaded at an absolute address.
# ** Warning: (vsim-3116) Problem reading symbols from /lib/i386-linux-gnu/libc.so.6 : module was loaded at an absolute address.
# ** Warning: (vsim-3116) Problem reading symbols from /lib/ld-linux.so.2 : module was loaded at an absolute address.
# ** Warning: (vsim-3116) Problem reading symbols from /lib/i386-linux-gnu/libnss_files.so.2 : module was loaded at an absolute address.!>
```

They are apparently harmless.
If you prefer suppressing them completely edit the `/some/where/modelsim_ase/modelsim.ini` configuration file and add the following lines at the beginning of the file:

```escape
<![msg_system]
suppress = 3116!>
```

## How can I install GHDL and GTKWave under macOS, and use them to simulate my VHDL model?

[This video](https://mediaserver.eurecom.fr/permalink/v126193e12950nece4k3/) explains all this.

## I am not comfortable with the Command Line Interface (CLI), is there a way to compile and simulate with a Graphical User Interface (GUI)?

GHDL has no GUI.
But Modelsim has a GUI; this video explains how to work with it:

- [Modelsim](https://mediaserver.eurecom.fr/permalink/v125f4143c20fzptvtz8/).

Note, however, that GUIs tend to significantly slow down the work flow.
If you are not comfortable with the CLI it is probably time to start learning it.

## What VHDL synthesizer can/shall I use?

The VHDL synthesizer we must use is constrained by the FPGA circuit that equips our prototyping board: it is a Zynq core from [Xilinx] so we must use the [Vivado] tool from Xilinx.
The most recent versions of this tool are extremely heavy (tens of gigabytes, hours or days of download).
If you absolutely want to install Vivado on your own computer (not recommended) see [below](#installing-vivado-webpack).
And of course, if you have it already installed, you can use it.

Else, Vivado is already installed on the GNU/Linux computers in the EURECOM's lab rooms.
As we do not need a Graphical User Interface the best option is thus to work on a EURECOM's computer through an `ssh` connection.
If you do not have one yet, install an `ssh` client.
Use your `ssh` client to connect to a GNU/Linux computer at EURECOM and to download the synthesis results on your laptop.

## Why do I get `CRITICAL WARNING: [IP_Flow 19-5655]` when synthesizing my design with Vivado?

This warning can be safely ignored.
It just says that Vivado does not support yet the full VHDL 2008 standard that we use.
This should not be a real problem for this course.

## Why do I get `ERROR: [DRC UCIO-1] Unconstrained Logical Port` when synthesizing my design with Vivado?

You left some top-level input-outputs unspecified, Vivado does not know to which I/O pins of the Zynq core they should be routed.
Edit your `xxx.params.tcl` synthesis script and add all missing specifications to the `ios` array.
Example:

```tcl
array set ios {
	led[0]        { M14 LVCMOS33 }
	...
}
```

## Why do I get `ERROR: [DRC NSTD-1] Unspecified I/O Standard` when synthesizing my design with Vivado?

You left the signalling voltage and/or standard of some top-level input-outputs unspecified, Vivado does not know how to configure the corresponding I/O pins of the Zynq core.
Edit your `xxx.params.tcl` synthesis script and add all missing specifications to the `ios` array.
Example:

```tcl
array set ios {
	led[0]        { M14 LVCMOS33 }
	...
}
```

## Can I install the Vivado synthesis tool on my personal computer?

Xilinx offers a free of charge version of its Vivado design suite for Windows or GNU/Linux, named the WebPack edition.
It has some limitations but they should not be a real problem for this course.
You can try to install it on your laptop but be warned:

- It is huge (about 30GB for version 2019.2) which means that downloading and installing will take time and that it will use a significant part of your disk space.
- There are Windows and GNU/Linux versions but no macOS version.
  If it is your OS the best option is probably to install Vivado in a GNU/Linux virtual machine.
- It is very picky about the OS versions.
  If your Windows or GNU/Linux OS is not one of the officially supported ones you will have to workaround several problems.
  It can even be that it does not work at all.

If you install Vivado on your own laptop do not forget:

- To protect the installation from accidental removal or modification.
- To install the Zybo board description files from Digilent:

    ```bash
    cd ds
    cp -r zybo /path/to/Vivado/2018.3/data/boards/board_files
    ```

## Are there free and open source hardware design tools?

A very interesting post (in French) about free and open source hardware design tools in 2020: <https://linuxfr.org/news/la-liberation-des-fpga-et-des-asic-bien-engagee-pour-2020>.

### VHDL simulation

[GHDL] is probably the most mature free and open source VHDL simulator.
It comes in three different flavours depending on the backend used: `gcc`, `llvm` or `mcode`.
It runs under Windows, GNU/Linux and macOS.
It has no graphical user interface but waveforms can be displayed using [GTKWave].

### VHDL synthesis

There are free and open source synthesizers ([Yosys], [Icarus]) but, up to now, their native front-ends are only for the Verilog hardware description language, not VHDL.
However, there is an experimental VHDL synthesis feature in GHDL based on Yosys.

[Git for Windows]: https://gitforwindows.org/
[MacPorts]: https://www.macports.org/
[Homebrew]: https://brew.sh/
[GHDL]: https://ghdl.github.io/ghdl/about.html
[GTKWave]: https://sourceforge.net/projects/gtkwave/
[ModelSim-Intel FPGA Starter Edition Software]: https://fpgasoftware.intel.com/?edition=lite&product=modelsim_ae
[direct link for Linux]: https://download.altera.com/akdlm/software/acdsinst/20.1std.1/720/ib_installers/ModelSimSetup-20.1.1.720-linux.run
[direct link for Windows]: https://download.altera.com/akdlm/software/acdsinst/20.1std.1/720/ib_installers/ModelSimSetup-20.1.1.720-windows.exe
[Siemens]: https://eda.sw.siemens.com/
[Yosys]: https://yosyshq.net/yosys/
[ghdl-yosys-plugin]: https://github.com/ghdl/ghdl-yosys-plugin
[Icarus]: http://iverilog.icarus.com/
[Xilinx]: https://www.xilinx.com/
[Vivado]: https://www.xilinx.com/support/download.html
[Aggregate notation]: doc/data/aggregate-notations.md
[Arithmetic: which types to use?]: doc/data/arithmetic-which-types-to-use.md
[Comments]: doc/data/comments.md
[D-flip-flops (DFF) and latches]: doc/data/d-flip-flops-dff-and-latches.md
[Digital hardware design using VHDL in a nutshell]: doc/data/digital-hardware-design-using-vhdl-in-a-nutshell.md
[Entity instantiations]: doc/data/entity-instantiations.md
[Examining synthesis results]: doc/data/examining-synthesis-results.md
[Generics]: doc/data/generics.md
[Getting started with VHDL]: doc/data/getting-started-with-vhdl.md
[How to implement a boolean function defined as a Look Up Table?]: doc/data/how-to-implement-a-boolean-function-defined-as-a-look-up-table.md
[How to use text files to drive simulations?]: doc/data/how-to-use-text-files-to-drive-simulations.md
[Identifiers]: doc/data/identifiers.md
[Initial value declarations]: doc/data/initial-values.md
[Protected types]: doc/data/protected-types.md
[Random numbers generation]: doc/data/random-numbers-generation.md
[Recursivity]: doc/data/recursivity.md
[Resolution functions, unresolved and resolved types]: doc/data/resolution-functions-unresolved-and-resolved-types.md
[`std_logic_1164`]: doc/data/std_logic_1164.md
[Unconstrained types]: doc/data/unconstrained-types.md
[VHDL simulation]: doc/data/vhdl-simulation.md
[Wait]: doc/data/wait.md
[Wait statement in a process with sensitivity list]: doc/data/wait-statement-in-a-process-with-sensitivity-list.md

<!-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0: -->
