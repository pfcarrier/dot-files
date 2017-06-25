# dot-files

## Install

These instructions allow to install my various dotfiles on various platform.
Don't run them blindly.  Your `.bash_profile` and `.vimrc`, among others,
would end up overwritten.  Unless your me you want to edit the `.gitconfig` file
afterward.

#### Debian, Termux or MacOS
  ```
  curl "https://raw.githubusercontent.com/pfcarrier/dot-files/master/install" \
    | bash -s -- all
  exec bash -l
  ```

## Thank you / Credit
Inspired by :
* https://github.com/kstevens715/dot-files
