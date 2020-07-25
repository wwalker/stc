# The Plan
Now that version 0.0.1 exists, has been tagged, actually works, and is in use (by me); need to change from proof of concept to a planned tool.

## Precedence of Tasks
* Initial Planning
* Bug fixes first, always
* Add features as users, if any, vote for them

## Defining Features

### Readability
* This:
```
PS1=$(stc_ps1 '🌈Green[🌈Red\u🌈Reset@🌈IGreen\h🌈Reset:🌈InvGreen\w] $🌈Reset')
```
* Rather than this:
```
PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32m\] \\$\[\e[m\] "
```

### Use termpcap/termino
* Rather than just use the hard coded VT ANSI Escape Sequences
* Use tput to provide compatibility with most any terminal

### Clarity and Optional Terseness 
* First support:
```
Bold
Underline
InvertColors
ClearAttributes
ResetAllAttributes

Red
IntenseRed
OnRed
OnIntenseRed
```

