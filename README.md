# dot-files

## Install

These instructions allow to install my various dotfiles on various platform.
Don't run them blindly.  Your `.bash_profile` and `.vimrc`, among other,
would end up overwriten.  Unless your me you want to edit the `.gitconfig` file
afterward.

#### Debian
  ```
  curl "https://raw.githubusercontent.com/pfcarrier/dot-files/master/install" \
    | bash -s -- apt-debian repos clean init
  exec bash -l
  ```

#### Termux
  ```
  curl "https://raw.githubusercontent.com/pfcarrier/dot-files/master/install" \
    | bash -s -- apt-termux repos clean init
  exec bash -l
  ```

#### MacOS
  ```
  curl "https://raw.githubusercontent.com/pfcarrier/dot-files/master/install" \
    | bash -s -- brew repos clean init
  exec bash -l
  ```

## Thank you / Credit
Inspired by :
* https://github.com/kstevens715/dot-files
