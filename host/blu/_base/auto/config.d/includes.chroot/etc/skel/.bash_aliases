# Repurposed to source drop-in bash(1) scripts
# Mirroring RHEL derived distributions' configuration: #1726397 (bugzilla)
# Sourced by the default Debian GNU/Linux '.bashrc' file

# User specific aliases and functions
if [[ -d ~/.bashrc.d ]]; then
    for rc in ~/.bashrc.d/*; do
        if [[ -f "${rc}" ]]; then
            . "${rc}"
        fi
    done
fi
unset rc
