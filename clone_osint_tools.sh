#!/usr/bin/env bash
set -euo pipefail

# Simple script to clone recommended OSINT tools into tools/
# Usage: bash clone_osint_tools.sh

DEST_DIR="tools"
mkdir -p "$DEST_DIR"
cd "$DEST_DIR"

repos=(
  "https://github.com/jivoi/awesome-osint.git"
  "https://github.com/k4m4/OSINT-Framework.git"
  "https://github.com/smicallef/spiderfoot.git"
  "https://github.com/laramies/theHarvester.git"
  "https://github.com/lanmaster53/recon-ng.git"
  "https://github.com/sherlock-project/sherlock.git"
  "https://github.com/OWASP/Amass.git"
  "https://github.com/s0md3v/Photon.git"
  "https://github.com/datasploit/datasploit.git"
  "https://github.com/aboul3la/Sublist3r.git"
  "https://github.com/laramies/metagoofil.git"
  "https://github.com/megadose/holehe.git"
  "https://github.com/sundowndev/phoneinfoga.git"
  "https://github.com/projectdiscovery/subfinder.git"
  "https://github.com/Ciphey/Ciphey.git"
  "https://github.com/bellingcat/GeoGuessr-OSINT-Tools.git"
  "https://github.com/Faizan-Khanx/TelegramOSINT.git"
  "https://github.com/megadose/OnionSearch.git"
  "https://github.com/iudicium/pryingdeep.git"
  "https://github.com/OpenOSINT/OpenOSINT.git"
  "https://github.com/seekr-osint/seekr.git"
  "https://github.com/rawfilejson/awesome-osint-arsenal.git"
)

for repo in "${repos[@]}"; do
  name=$(basename -s .git "$repo")
  if [ -d "$name" ]; then
    echo "Skipping existing: $name"
    continue
  fi
  echo "Cloning $repo"
  git clone --depth 1 "$repo" || echo "Failed to clone $repo"
done

echo "Done. Cloned tools into: $(pwd)"
