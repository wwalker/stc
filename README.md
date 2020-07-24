# stc - simple terminal colors
stc is a bash library to make terminal colors and attributes readable and relatively terse

Instead of:
```
# let us setup the prompt
PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32m\] \\$\[\e[m\] "
```

This (in the future you can change the delimiter from 🌈 Rainbow to whatever you like):
```
PS1=$(stc_ps1 '🌈Green[🌈Red\u🌈Reset@🌈IGreen\h🌈Reset:🌈InvGreen\w] $🌈Reset')
```

Current Attribute names:
```
Bold    # Bold text only, keep colors
Undr    # Underline text only, keep colors
Inv     # Inverse: swap background and foreground colors
Reg     # Regular text only, keep colors
RegF    # Regular foreground coloring
RegB    # Regular background coloring
Reset   # Reset all coloring and style

# Basic      High Intensity   Background     High Intensity Background
Black        IBlack           OnBlack        OnIBlack
Red          IRed             OnRed          OnIRed
Green        IGreen           OnGreen        OnIGreen
Yellow       IYellow          OnYellow       OnIYellow
Blue         IBlue            OnBlue         OnIBlue
Purple       IPurple          OnPurple       OnIPurple
Cyan         ICyan            OnCyan         OnICyan
White        IWhite           OnWhite        OnIWhite
```
