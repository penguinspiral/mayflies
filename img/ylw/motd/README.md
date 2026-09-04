# About

This "target" is a simplistic example of extending the '_base' target.
It demonstrates the minimal configuration required to perform customisations
atop a functional Debian GNU/Linux distribution.

The "Don't Repeat Yourself" (DRY) principle is adopted in its most simplistic
form: All '_base/auto' configuration is copied wholesale into 'motd/auto'
skipping any file that exists.
