#!/usr/bin/env bash

# TODO: Ask user for margins during installation

. /etc/os-release

check_pkg () {
    if [ "${ID}" = "debian" ] || [ "${ID_LIKE}" = "debian" ]; then
	return $(dpkg -l "$1" | grep -c ^ii)
    elif [ "${ID}" = "alpine" ] || [ "${ID_LIKE}" = "alpine" ]; then
	return $(apk list "$1" | grep -c '[installed]')
    fi
}

check_pkg "gnome-tweaks"
GTT=$?
check_pkg "gnome-shell-extensions"
GSE=$?

if [ "${GTT}" = "0" ]; then
    echo
    echo "WARNING: GNOME Tweak Tool not installed."
    echo "  Please install the package 'gnome-tweaks' (or similar) in your OS."
    echo
fi
if [ "${GSE}" = "0" ]; then
    echo
    echo "WARNING: GNOME Shell Extensions not installed."
    echo "  Please install the package 'gnome-shell-extensions' (or similar) in your OS."
    echo
fi

NERDTHEME="${HOME}/.themes/nerdtheme"

if [ ! -d ${NERDTHEME} ]; then
    mkdir -pv ${NERDTHEME}
fi

echo "Deploying gnome-shell and GTK-3.0 CSS files:"

# gnome-shell and gtk
cp -rv g* ${NERDTHEME}

echo

if [ -x "$(which gsettings)" ]; then
    echo "Enabling GTK 3.0 nerdtheme!"
    gsettings set org.gnome.desktop.interface gtk-theme nerdtheme
    echo
fi

# FireFox
PROFILES_PATH="${HOME}/.mozilla/firefox"
PROFILES_INI="${PROFILES_PATH}/profiles.ini"
if [ -r "${PROFILES_INI}" ]; then
    PROFILES=$(grep '^Path=' "${PROFILES_INI}")
    NUM_PROFILES=$(echo "${PROFILES}" | grep -c ^)
    # DEBUG
    echo "Found ${NUM_PROFILES} FireFox profile(s)."
    if [ "${NUM_PROFILES}" -eq "1" ]; then
	THE_PROFILE=$(echo "${PROFILES}" | awk -F= '{print $2}')
	PROFILE_PATH="${PROFILES_PATH}/${THE_PROFILE}/chrome"
	USERCHROMECSS="${PROFILE_PATH}/userChrome.css"
	if [ ! -f "${USERCHROMECSS}" ]; then
	    echo "Installing userChrome.css to ${PROFILE_PATH}:"
	    cp -v firefox/userChrome.css "${PROFILE_PATH}"
	    echo "CSS copied. To complete FireFox theme installation please follow these steps:"
	    echo "  1. Open FF and type \"about:config\" into the URL bar, and press Enter."
	    echo "  2. Accept the warning."
	    echo "  3. Set toolkit.legacyUserProfileCustomizations.stylesheets = True"
	else
	    echo "WARNING: File ${USERCHROMECSS} already exists. This file will not be replaced. You will need to install the file manually."
	fi
    else
	echo "You will need to install userChrome.css yourself."
    fi
else
    echo "ERROR: Unable to locate FireFox profiles:"
    echo "  ${PROFILES_INI} does not exist or is not readable."
fi
