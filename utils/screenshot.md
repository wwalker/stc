Paste what is below into a terminal to show what stc does :-)
```
PS1='$ '
clear
# Let's have a more useful prompt
PS1="[\\u@\h \\W]\\$ "
# Or the same thing with single quotes
PS1='[\u@\h \W]\$ '
# Now I want some color:
PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32m\] \\$\[\e[m\] "
# That ^^ was long... and error prone, and dizzying
PS1='$ '
# The same prompt as above but shorter, less error Prone, more readable
# Add something you can edit/improve without needing a bottle of Excedrin®™
PS1=$(stc_ps1 '🌈Green[🌈Red\u🌈Yellow@🌈IGreen\h🌈Reset:🌈Cyan\w🌈Green] $🌈Reset ')
# Changing it up is simple
PS1=$(stc_ps1 '🌈Green[🌈InvRed\u🌈ResetBoldUndrIYellow@🌈InvIBlack\h🌈ResetIBlue:🌈ResetCyan\w🌈Green] $🌈Reset ')
# I want a two line prompt.  We handle that well
PS1=$(stc_ps1 '🌈Green[🌈InvRed\u🌈ResetBoldUndrIYellow@🌈InvIBlack\h🌈ResetIBlue:🌈ResetCyan\w🌈Green]'"\n$ 🌈Reset")
```
