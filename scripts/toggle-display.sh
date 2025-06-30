MONITOR="$1"
RES="$2"
POS="$3"
SCALE="$4"

STATUS=$(hyprctl monitors all | awk "/Monitor $MONITOR/{found=1} found && /disabled:/ {print \$2; exit}")

if [ "$STATUS" = "true" ]; then
	hyprctl keyword monitor "$MONITOR,$RES,$POS,$SCALE"
else
	hyprctl keyword monitor "$MONITOR,disable"
fi

