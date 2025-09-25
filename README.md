dotfiles (configuration files) for linux mint, xfce environment. but should work other linux distros.
* xmodmap for keybindings.
  capslock is hell of a shit. xmodmap replace it with Mod3 key, enabling to assign keybindings with the key.
  for example, capslock(Mod3) + j indicates "left arrow" key function, by configuring the .Xmodmap file.
    for memo, it seems the behaviors are restricted by x11 server system, which composes linux's desktop environemnt. in my attemt, I failed it to differ the behaviors based on if left or right shift key was pressed.
    be better not to attempt and consume unnecessary period of time for it.
  
* code keybindings.
  in vscode, i use vim extension. this is only for that setup.
  
* install.sh for automation.
  I don't have to route them thanks to this. but, i remember that i have to create some of the files. there should be error message what is lacking. please follow that instruction.
  - important!
    after installed on ~ dir, rename the directories name "dotfiles_mint-xfce" to "dotfiles". otherwise, install.sh won't recognize!

if you have spare time and being bored, enhance the automation.
