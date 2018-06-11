# Ricing Notes

## Foreward
This document is far from complete. When I'm done configuring my system, I'll
clean up this document, add all of the appropriate references, and set it as the
 repository's README.

## Disclaimer
This article is by no means an authoritative source for how to set up your own
operating system. I just felt the need to document some intricacies that I
stumbled upon with my 7th(?) installation of Arch Linux from the minimal install
image. As such, I take no responsibilities in whatever problems that you may run
into while following this guide for your own installation. Though I hope that
this is the last time I'll need to configure my set up from scratch, going
through the installation process several times, starting over, reading plenty of
articles, and watching many videos on how Arch works and how to install it made
the next process easier to deal with, and gave me a deeper knowledge of the
different components that work together to make my operating system work. If
you're reading this and are thinking about trying out Arch Linux, don't be
discouraged if you don't get it right the first time! It takes a lot of
intentional time spent with the technology to truly feel comfortable in what
you're doing.

## Installing Arch

I install Arch Linux using a mix of the standard
[install guide](https://wiki.archlinux.org/index.php/installation_guide)
and this [gist](https://gist.github.com/binaerbaum/535884a7f5b8a8697557). I used
a mix of the official guide and an unofficial guide in order to see explicit
examples of how one sets up their system, along with the officially supported
way to install and set up the OS and various programs. I just found that the
gist followed a setup that I was looking for with my system, so referring to it
meant less time sifting through various articles to see how each individual
program works, and a quicker system set up.  Some of the things that I changed
from the gist guide were of course locales, timezones, and keymaps of my
preference, but also to create an additional encrypted home partition by doing
the following: 

```
lvcreate --size 16G vg0 --name swap
lvcreate --size 32G vg0 --name root
lvcreate -l 100%FREE vg0 --name home
```

and of course by setting this `home` partition to be formatted in `ext4` with
`mkfs.ext4 /dev/mapper/vg-home` and additionally mounting it with

```
mkdir /mnt/home
mount /dev/mapper/vg0-home /mnt/home
```
while setting up the disks prior to chroot-ing.

I forgoed anything related to running Arch on a laptop, such as wireless
capabilities or using the `resume` HOOK module in my initramfs CPIO image.  My
HOOK module order is thus
```
HOOKS=(base udev autodetect modconf block encrypt lvm2 filesystems keyboard fsck)
```
and it works fine for me.

I'm using `systemd-boot` instead of `grub` for now, and will tinker with it and
see whether or not I prefer it over `grub`. My bootloader configuration for
decryption has the line
```
options cryptdevice=UUID=e23a8174-c24c-4292-be5f-f170660896be:vg0 root=/dev/mapper/vg0-root resume=/dev/mapper/vg0-swap home=/dev/mapper/vg0-home rw intel_pstate=no_hwp
```
to account for my additional home partition. I'm not too sure if this is
required or not, but I will update this at a later date to note if it matters.

Since I'm currently using an Intel CPU, I referred to the Arch install guide for
[enabling microcode updates](https://wiki.archlinux.org/index.php/Microcode#Enabling_Intel_microcode_updates).
Refer to the appropriate sections for whether you're using `grub` or
`systemd-boot`.

While I'm still chroot-ed, I used `pacstrap` to install a number of useful
programs to help me not get rekt when I directly boot into my new system, and to
save tiem:
```
base base-devel audacity dialog efibootmgr elinks firefox git imagemagick irssi java-runtime-common mpd mpv mupdf ncmpcpp neovim networkmanager pavucontrol perl php pulseaudio-equalizer python ruby rxvt-unicode sudo supertux tmux zsh 
```
I ripped this list of packages from both the gist install guide, and the package
prompts from
[Anarchy Linux](https://github.com/deadhead420/anarchy-linux/blob/master/lib/configure_base.sh)
(which is the reason why I instead chose to directly install Arch).

After a few syntax errors with configuration files, namely fixing the initramfs
HOOK modules and order and entering my drive UUID in the `systemd-boot` config,
I booted and things worked.

## Post-installation
A few minor mishaps occured as I booted into the system, mainly networking. My
home server setup is a bit odd, so I need to manually refresh my IP lease
whenever I boot my computer.  I enabled the `dhcpcd` and `NetworkManager`
services so I can easily use these whenever my computer boots.

Once my system successfully booted, I decided to install some graphical
utilities. I always wait until I can boot into Arch with networking before
installing graphical utilities, as it seems that everything else fails if I try
to do it all at once.

I installed `gdm` as my display manager, as it looks pretty good out of the box,
and lets me switch between desktop environments and window managers with ease.
After enabling the `gdm` service, I reboot to make sure that it works, and it
does. I get prompted with a very minimal GNOME environment, in which I set up
[`aurman`](https://aur.archlinux.org/packages/aurman/) and install
[`i3-gaps`](https://github.com/Airblader/i3) to start ricing. I chose `aurman`
rather than something like `yaourt` or `pacaur` based on security
recommendations made in the
[AUR Helpers](https://wiki.archlinux.org/index.php/AUR_helpers) article in the
Arch Wiki.

Now that I have installed a minimally viable environment, I can start my rice.

## Ricing

The following section is going to be split up into different sections
corresponding to the different aspects of my system. They're split this way so a
reader can quickly view a single section and look at what corresponds to that
specific program. As a tl;dr, here's a list of all the programs that I use (and
as a reminder to myself as to what needs to be installed for everything to
work):

* aurman -- AUR helper
* base16-manager -- manage colors across all programs
  * base16-vim
  * base16-shell
  * base16-rofi
  * base16-xresources
* compton -- compositor
* dunst -- notifications popup
* feh -- image viewer
* firefox -- browser
* gdm -- GNOME display manager
* i3-gaps -- window manager
* neovim -- text editor
  * vim-plug -- plugin manager
* polybar -- status bar
* ranger -- file manager
* rofi -- application launcher
* rxvt-unicode -- terminal emulator
* screenfetch -- to flex
* scrot -- screenshot utility
* scientifica -- bitmap font for non-symbols
* siji -- bitmap font for symbols
* yadm -- yet another dotfile manager
* zsh -- shell
  * zplug -- plugin manager

There may be a few minor ones that I'm missing, but for the most part these are
it.

### Colorscheme
I thoroughly enjoy the [base16](http://chriskempson.com/projects/base16/)
colorschemes, so I try to find a way to integrate them throughout my system. I
installed the [base16-manager](https://github.com/AuditeMarlow/base16-manager/)
along with each of the supported templates so I can use them across my system.

I like to be able to change colors by modifying just one file, so any other
program that I use that isn't supported by this uses colors from my
`.Xresources` file.

### Terminal
I'm using [urxvt]() because it seems to be lightweight and highly configurable. I didn't put too much thought into which terminals to use, and I've read that
this one works with a lot of things.

I haven't used any special symbols in my terminal before writing this article, so I've decided to give it a shot and try to make it work.
I decided to install [Nerd Fonts]() since the [infinality font package]() appears to have been deprecated. I followed the instructions in [this post](https://gist.github.com/cryzed/e002e7057435f02cc7894b9e748c5671) for
getting a similarly performant font rendering.

I ended up not using any of the fonts in the Nerd Fonts package, and instead opted to use [siji]() for symbols, and [scientifica]() for text. There's a nice plugin for haskell and python that turns the syntax into more
[mathematical expressions](), which I find super neat, which is supported by scientifica. I haven't installed it or used it, but I'll check it out once I start writing more
serious python later this summer.

### Text Editor
My text editor of choice is [`neovim`](). I made the switch after a friend showed me some of the benefits over regular `vim`. I have split up my configuration file into more logical chunks, rather than a massive file --
I find it easier to organize my configurations across multiple files and reference them in a single file, as to make it more modular. 

I've tried to comment most all of my vim configurations, and most of the settings are named in a straightforward fashion, so hopefully its easy to understand.

I also use [`vim-plug`] for `neovim` to manage plugins and such. At a later point, I'm planning on setting up my plugins file to only load
certain plugins based on the type of file being edited, so as to not overload my terminal all the time. Just some of the time :)

### Window Manager

i3, dunst, polybar, 

### File Manager
ranger

### Email
mutt
https://spaceandtim.es/code/protonmail_mutt/

### Password Manager
I've heard of the allure of using programs like LastPass, but I don't know if I trust my password store being hosted on a server I don't control. I looked into [GNU `pass`](), and saw that its
simplicity was something alluring. I looked online for various plugins to make it easier to use `pass` across different platforms (Windows, macOS, mobile, etc), and found a [plugin]() for
Firefox and Chrome that can read a password store from a server and use that for form auto-filling and easier accessibility.







### Miscellaneous
tools for auto-detect displays


#vim set tw=80 fo=cqt wm=0
