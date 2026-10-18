#!/bin/bash
set -e

if [[ -n ${1} ]]; then
  PROTON_VERSION="${1}"
else
  printf "Usage: %s [PROTON-VERSION]
  View versions with: ls ~/.steam/steam/compatibilitytools.d
" "${0}"
  exit 1
fi

export STEAM_COMPAT_DATA_PATH=~/.local/share/wineprefixes/sed-docker
export STEAM_COMPAT_CLIENT_INSTALL_PATH=~/.local/share/Steam
export WINEPREFIX="${STEAM_COMPAT_DATA_PATH}"
export WINEARCH=win64

ROOT_PATH="$(dirname "$(realpath "${0}")")"
STEAM_COMPAT_TOOLS=~/.steam/steam/compatibilitytools.d
SED_SAVE_PATH="${WINEPREFIX}/pfx/drive_c/users/steamuser/AppData/Roaming/SpaceEngineersDedicated/Saves"
SED_DOCKER_SAVE_PATH="${ROOT_PATH}/appdata/space-engineers/instances/SE"

# Configure a prefix to run the server to create a world
winecfg /v win10

# Run server creation program
cd "${ROOT_PATH}/appdata/space-engineers/SpaceEngineersDedicated/DedicatedServer64" || exit 1
echo 
~/.steam/steam/compatibilitytools.d/"${PROTON_VERSION}"/proton run SpaceEngineersDedicated.exe

# Copy the world data to the server's docker location
cp "${SED_SAVE_PATH}/../SpaceEngineers-Dedicated.cfg" "${SED_DOCKER_SAVE_PATH}"/
cp -R "${SED_SAVE_PATH}" "${SED_DOCKER_SAVE_PATH}"/


printf "\n\nREMEMBER: we still need to remove the date/time from the folder name in Saves\n\n"