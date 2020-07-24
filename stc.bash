# Credits:
#     which referenced:

# NOTE - "attrs" refers to both terminal attributes (Bold, Underline, ...) and colors

stc_ps1(){
  stc "$1" 1
}

stc(){
  # We don't use '\e' for escape as that is only handled by the bash prompt handler
  local sequence_start=$'\x1B['

  #   declare -A clearing
  #    local clearing=(
  #    ["CLR_LINE_START"]="1K"
  #    ["CLR_LINE_END"]="K"
  #    ["CLR_LINE"]="2K"
  #  
  #    ["RESET_LINE"]="${CLR_LINE}1000D" # Hope no terminal is greater than 1k columns
  #  )

  # Stolen fair and square from bcap's gist:
  # https://gist.githubusercontent.com/bcap/5682077/raw/47c1f0a6f573ae46fae6afe69df345d56810f465/terminal-control.sh
  #   Colors and styles (based on https://github.com/demure/dotfiles/blob/master/subbash/prompt)
  #   Terminal output control (http://www.termsys.demon.co.uk/vtansi.htm)
  #     which is unfortunately gone.... (not on archive.org either
  declare -A attrs
  local attrs=(
    ["Bold"]="1"    # Bold text only, keep colors
    ["Undr"]="4"    # Underline text only, keep colors
    ["Inv"]="7"     # Inverse: swap background and foreground colors
    ["Reg"]="2224" # Regular text only, keep colors
    ["RegF"]="39"   # Regular foreground coloring
    ["RegB"]="49"   # Regular background coloring
    ["Reset"]="0"     # Reset all coloring and style
  
    # Basic         High Intensity   Background        High Intensity Background
    ["Black"]="30"  ["IBlack"]="90"  ["OnBlack"]="40"  ["OnIBlack"]="100"
    ["Red"]="31"    ["IRed"]="91"    ["OnRed"]="41"    ["OnIRed"]="101"
    ["Green"]="32"  ["IGreen"]="92"  ["OnGreen"]="42"  ["OnIGreen"]="102"
    ["Yellow"]="33" ["IYellow"]="93" ["OnYellow"]="43" ["OnIYellow"]="103"
    ["Blue"]="34"   ["IBlue"]="94"   ["OnBlue"]="44"   ["OnIBlue"]="104"
    ["Purple"]="35" ["IPurple"]="95" ["OnPurple"]="45" ["OnIPurple"]="105"
    ["Cyan"]="36"   ["ICyan"]="96"   ["OnCyan"]="46"   ["OnICyan"]="106"
    ["White"]="37"  ["IWhite"]="97"  ["OnWhite"]="47"  ["OnIWhite"]="107"
  )

  #later this will be overrideable
  local delimiter="🌈"

  local output=''

  # List of all the attributes keys
  local re_attr_list='Bold|Undr|Inv|RegF|RegB|Reg|Reset|Black|IBlack|OnBlack|OnIBlack|Red|IRed|OnRed|OnIRed|Green|IGreen|OnGreen|OnIGreen|Yellow|IYellow|OnYellow|OnIYellow|Blue|IBlue|OnBlue|OnIBlue|Purple|IPurple|OnPurple|OnIPurple|Cyan|ICyan|OnCyan|OnICyan|White|IWhite|OnWhite|OnIWhite'

  # Regex to separate the input into Text, Delimiter, RestOfLine
  local re_split_input="^([^$delimiter]*?)$delimiter(.*)$"

  # Regex to get the next command in the list
  local re_get_next_attr="^($re_attr_list)(.*)$"
  
  local input=$1
  # If this will be used as PS1, then we will wrap the escape sequence in \[sequence\]
  # This is so the shell can understand how long the actual prompt is in characters
  local is_ps1=$2
  
  # Repeatedly break the line into "stuff before the delimiter", "the delimiter", "the rest of the line, which should contain 1 or more attrs
  while [[ $input =~ $re_split_input ]]
  do
    output+=${BASH_REMATCH[1]}
    # If this will be used as PS1, then we wrap
    local rest_of_line=${BASH_REMATCH[2]}
  
    [[ -n "$is_ps1" ]] && output+='\['
    output+=$sequence_start
    # Use this to prevent the first attr from having a preceding ;
    local separator=''
  
    while [[ $rest_of_line =~ $re_get_next_attr ]]
    do
      output+=$separator${attrs[${BASH_REMATCH[1]}]}
      rest_of_line=${BASH_REMATCH[2]}
      separator=';'
    done
    if [[ -n "$separator" ]]
    then
      output+='m'
      [[ -n "$is_ps1" ]] && output+='\]'
    fi
    input=$rest_of_line
  done
  output+=$input
  printf "%s" "$output"
}
