#!/usr/bin/env bash
#
# Installe tout ce qu'il faut pour produire les vidéos sur un Mac.
# Idempotent : relançable sans risque.
#
#   ./video-production/setup-macos.sh
#
set -euo pipefail

RED=$'\033[31m'; GREEN=$'\033[32m'; YELLOW=$'\033[33m'; BOLD=$'\033[1m'; OFF=$'\033[0m'
step() { printf '%s==>%s %s%s\n' "$BOLD" "$OFF" "$1" "$OFF"; }
ok()   { printf '  %s✓%s %s\n' "$GREEN" "$OFF" "$1"; }
warn() { printf '  %s!%s %s\n' "$YELLOW" "$OFF" "$1"; }
die()  { printf '  %sx%s %s\n' "$RED" "$OFF" "$1" >&2; exit 1; }

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

# --- Garde-fous ---------------------------------------------------------------

[[ "$(uname -s)" == "Darwin" ]] || die "Ce script est prévu pour macOS (détecté : $(uname -s)).
     Une session Claude Code remote tourne sous Linux — lance-le sur le MacBook Pro."

step "Machine"
ARCH="$(uname -m)"
ok "macOS $(sw_vers -productVersion) — $ARCH"
if [[ "$ARCH" != "arm64" ]]; then
  warn "Mac Intel détecté. Les rendus seront nettement plus lents qu'en Apple Silicon,"
  warn "et l'encodage matériel VideoToolbox est bien moins performant."
fi

FREE_GB="$(df -g . | awk 'NR==2 {print $4}')"
ok "Espace disque libre : ${FREE_GB} Go"
[[ "$FREE_GB" -ge 20 ]] || warn "Moins de 20 Go libres — les rendus vidéo remplissent vite un disque."

# --- Homebrew -----------------------------------------------------------------

step "Homebrew"
if ! command -v brew >/dev/null 2>&1; then
  warn "Homebrew absent, installation…"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Le shell courant ne connaît pas encore brew : on charge son environnement.
  BREW_BIN="/opt/homebrew/bin/brew"
  [[ -x "$BREW_BIN" ]] || BREW_BIN="/usr/local/bin/brew"
  eval "$("$BREW_BIN" shellenv)"
fi
ok "brew $(brew --version | head -1 | cut -d' ' -f2)"

# --- Dépendances de rendu -----------------------------------------------------

step "Dépendances de rendu"
# ffmpeg fait le gros du travail ; les autres servent aux pipelines courants
# (sous-titres, images, audio, polices).
FORMULAE=(ffmpeg imagemagick fontconfig jq)
for f in "${FORMULAE[@]}"; do
  if brew list --formula "$f" >/dev/null 2>&1; then
    ok "$f (déjà installé)"
  else
    warn "installation de $f…"
    brew install "$f"
    ok "$f"
  fi
done

# Vérifie que l'encodeur matériel Apple est bien disponible : c'est tout
# l'intérêt de produire sur le MacBook Pro plutôt que sur l'Air.
step "Encodage matériel"
if ffmpeg -hide_banner -encoders 2>/dev/null | grep -q h264_videotoolbox; then
  ok "VideoToolbox disponible (h264_videotoolbox, hevc_videotoolbox)"
  ok "utilise -c:v h264_videotoolbox plutôt que libx264 pour les rendus longs"
else
  warn "VideoToolbox introuvable dans ce build de ffmpeg — les rendus resteront en CPU."
fi

# --- Runtimes, seulement si le pipeline en a besoin ----------------------------

step "Runtimes du pipeline"
INSTALLED_RUNTIME=0

if [[ -f package.json ]]; then
  INSTALLED_RUNTIME=1
  command -v node >/dev/null 2>&1 || { warn "installation de node…"; brew install node; }
  ok "node $(node --version)"
  if [[ -f package-lock.json ]]; then npm ci; else npm install; fi
  ok "dépendances npm installées"
fi

for req in requirements.txt video-production/requirements.txt; do
  [[ -f "$req" ]] || continue
  INSTALLED_RUNTIME=1
  command -v python3 >/dev/null 2>&1 || { warn "installation de python…"; brew install python; }
  ok "python $(python3 --version | cut -d' ' -f2)"
  [[ -d .venv ]] || python3 -m venv .venv
  ./.venv/bin/pip install --quiet --upgrade pip
  ./.venv/bin/pip install --quiet -r "$req"
  ok "dépendances python installées depuis $req (venv : .venv)"
done

if [[ "$INSTALLED_RUNTIME" -eq 0 ]]; then
  warn "Aucun package.json ni requirements.txt trouvé."
  warn "Le pipeline de génération n'est pas encore dans ce repo — voir MIGRATION.md."
fi

# --- Résumé -------------------------------------------------------------------

step "Terminé"
ok "Le MacBook Pro est prêt à rendre."
printf '\n  Suite : lance %sclaude%s en local dans ce dossier pour piloter les rendus,\n' "$BOLD" "$OFF"
printf '  et lis %svideo-production/MIGRATION.md%s pour ramener le pipeline du MacBook Air.\n\n' "$BOLD" "$OFF"
