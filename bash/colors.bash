# MAC_COLOR_CODE_PREFIX="\[\033["
# MAC_COLOR_CODE_SUFFIX='m\]'
# LINUX_COLOR_CODE_PREFIX="\e["
# LINUX_COLOR_CODE_SUFFIX="m"

# if [[ "$OSTYPE" == "darwin"* ]]; then
#     ESC_OPEN=$MAC_COLOR_CODE_PREFIX
#     ESC_CLOSE=$MAC_COLOR_CODE_SUFFIX
# else
#     ESC_OPEN=$LINUX_COLOR_CODE_PREFIX
#     ESC_CLOSE=$LINUX_COLOR_CODE_SUFFIX
# fi

ESC_OPEN="\[\033["
ESC_CLOSE='m\]'

Color_Reset="${ESC_OPEN}0${ESC_CLOSE}"     # Text Reset

# Regular Colors
Black="${ESC_OPEN}0;30${ESC_CLOSE}"        # Black
Red="${ESC_OPEN}0;31${ESC_CLOSE}"          # Red
Green="${ESC_OPEN}0;32${ESC_CLOSE}"        # Green
Yellow="${ESC_OPEN}0;33${ESC_CLOSE}"       # Yellow
Blue="${ESC_OPEN}0;34${ESC_CLOSE}"         # Blue
Purple="${ESC_OPEN}0;35${ESC_CLOSE}"       # Purple
Cyan="${ESC_OPEN}0;36${ESC_CLOSE}"         # Cyan
White="${ESC_OPEN}0;37${ESC_CLOSE}"        # White

# Bold
BBlack="${ESC_OPEN}1;30${ESC_CLOSE}"       # Black
BRed="${ESC_OPEN}1;31${ESC_CLOSE}"         # Red
BGreen="${ESC_OPEN}1;32${ESC_CLOSE}"       # Green
BYellow="${ESC_OPEN}1;33${ESC_CLOSE}"      # Yellow
BBlue="${ESC_OPEN}1;34${ESC_CLOSE}"        # Blue
BPurple="${ESC_OPEN}1;35${ESC_CLOSE}"      # Purple
BCyan="${ESC_OPEN}1;36${ESC_CLOSE}"        # Cyan
BWhite="${ESC_OPEN}1;37${ESC_CLOSE}"       # White

# Underline
UBlack="${ESC_OPEN}4;30${ESC_CLOSE}"       # Black
URed="${ESC_OPEN}4;31${ESC_CLOSE}"         # Red
UGreen="${ESC_OPEN}4;32${ESC_CLOSE}"       # Green
UYellow="${ESC_OPEN}4;33${ESC_CLOSE}"      # Yellow
UBlue="${ESC_OPEN}4;34${ESC_CLOSE}"        # Blue
UPurple="${ESC_OPEN}4;35${ESC_CLOSE}"      # Purple
UCyan="${ESC_OPEN}4;36${ESC_CLOSE}"        # Cyan
UWhite="${ESC_OPEN}4;37${ESC_CLOSE}"       # White

# Background
On_Black="${ESC_OPEN}40${ESC_CLOSE}"       # Black
On_Red="${ESC_OPEN}41${ESC_CLOSE}"         # Red
On_Green="${ESC_OPEN}42${ESC_CLOSE}"       # Green
On_Yellow="${ESC_OPEN}43${ESC_CLOSE}"      # Yellow
On_Blue="${ESC_OPEN}44${ESC_CLOSE}"        # Blue
On_Purple="${ESC_OPEN}45${ESC_CLOSE}"      # Purple
On_Cyan="${ESC_OPEN}46${ESC_CLOSE}"        # Cyan
On_White="${ESC_OPEN}47${ESC_CLOSE}"       # White

# High Intensity
IBlack="${ESC_OPEN}0;90${ESC_CLOSE}"       # Black
IRed="${ESC_OPEN}0;91${ESC_CLOSE}"         # Red
IGreen="${ESC_OPEN}0;92${ESC_CLOSE}"       # Green
IYellow="${ESC_OPEN}0;93${ESC_CLOSE}"      # Yellow
IBlue="${ESC_OPEN}0;94${ESC_CLOSE}"        # Blue
IPurple="${ESC_OPEN}0;95${ESC_CLOSE}"      # Purple
ICyan="${ESC_OPEN}0;96${ESC_CLOSE}"        # Cyan
IWhite="${ESC_OPEN}0;97${ESC_CLOSE}"       # White

# Bold High Intensity
BIBlack="${ESC_OPEN}1;90${ESC_CLOSE}"      # Black
BIRed="${ESC_OPEN}1;91${ESC_CLOSE}"        # Red
BIGreen="${ESC_OPEN}1;92${ESC_CLOSE}"      # Green
BIYellow="${ESC_OPEN}1;93${ESC_CLOSE}"     # Yellow
BIBlue="${ESC_OPEN}1;94${ESC_CLOSE}"       # Blue
BIPurple="${ESC_OPEN}1;95${ESC_CLOSE}"     # Purple
BICyan="${ESC_OPEN}1;96${ESC_CLOSE}"       # Cyan
BIWhite="${ESC_OPEN}1;97${ESC_CLOSE}"      # White

# High Intensity backgrounds
On_IBlack="${ESC_OPEN}0;100${ESC_CLOSE}"   # Black
On_IRed="${ESC_OPEN}0;101${ESC_CLOSE}"     # Red
On_IGreen="${ESC_OPEN}0;102${ESC_CLOSE}"   # Green
On_IYellow="${ESC_OPEN}0;103${ESC_CLOSE}"  # Yellow
On_IBlue="${ESC_OPEN}0;104${ESC_CLOSE}"    # Blue
On_IPurple="${ESC_OPEN}0;105${ESC_CLOSE}"  # Purple
On_ICyan="${ESC_OPEN}0;106${ESC_CLOSE}"    # Cyan
On_IWhite="${ESC_OPEN}0;107${ESC_CLOSE}"   # White
