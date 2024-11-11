# For better error handling and reliability
set -euo pipefail

if [ ! -d "/usuarios" ]; then
	mkdir /usuarios
fi

function set_users() {
	useradd -m -d "/usuarios" miguel
	useradd -m -d "/usuarios" andrea
}

# Configure samba
echo "Installing samba..."
pkg install samba

if [ ! -f "/etc/samba/smb.conf" ]; then
	echo "Failed to install samba"
	exit 1
fi

mv "/etc/samba/smb.conf" "/etc/samba/smb.conf.bak"
cp "./samba/smb.conf" "/etc/samba/smb.conf"

smbpasswd -a miguel
smbpasswd -a andrea

svcadm enable samba
