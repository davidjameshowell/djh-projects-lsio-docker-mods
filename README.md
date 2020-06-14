# LinuxServer.io Docker Mods

These are LinuxServer Docker mods. Docker Mods can be applied to containers and are unpacked at runtime to modify an image with additional modifications without rebuilding a new image.

In my time, I have made a few which have helped me out in my own day to day tasks.

# NZBGet Post Processing Scripts
These are scripts for NZBGET designed for post processing. They are a collection of well utilized scripts that assist with certain functions. 

* flatten.py - This flattens files to a single directory (or appendable by category).
* delete_samples.py - This removes samples based upo
* hash_renamer.py - Renames files that are hashed to proper file Renames
* reverse_renamer.py - Reverses file naming

Configure in NZBGET scripts appropriately, do not forget to enable for each category.

# Rclone Rotate Service Account
This is designed to rotate between a set of scripts on a configurable predefined set of time in order to avoid hitting the 750GB limit of each service account WITHOUT the need to restart/remount any services.

