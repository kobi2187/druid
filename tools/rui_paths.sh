# rui_paths.sh -- sourced: RUI_PATHS, the --path flags that let a program
# outside the RUI repository import RUI (as RUI's own config.nims does inside
# it). RUI_DIR is the RUI checkout (default: ../rui2 next to this repository).
ROOT="${ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
RUI_DIR="${RUI_DIR:-$ROOT/../rui2}"
[ -d "$RUI_DIR/packages/rui/src" ] || { echo "no RUI checkout at $RUI_DIR: set RUI_DIR"; exit 2; }
RUI_PATHS="--path:$ROOT/src"
for p in rui_core rui_hittest rui_events rui_drawing rui_scripting rui_widgets rui_windows rui_shaped rui; do
  RUI_PATHS="$RUI_PATHS --path:$RUI_DIR/packages/$p/src"
done
for pkg in naylib yaml db_connector; do
  p="$(nimble path "$pkg" 2>/dev/null | tail -1)"; [ -n "$p" ] && RUI_PATHS="$RUI_PATHS --path:$p"
done
