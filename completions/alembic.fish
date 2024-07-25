complete -f -c alembic
complete -c alembic -a "branches\t'Show current branch points.'
check\t'Check if revision command with autogenerate has pending upgrade ops.'
current\t'Display the current revision for a database.'
downgrade\t'Revert to a previous version.'
edit\t'Edit revision script(s) using \$EDITOR.'
ensure_version\t'Create the alembic version table if it doesn\'t exist already .'
heads\t'Show current available heads in the script directory.'
history\t'List changeset scripts in chronological order.'
init\t'Initialize a new scripts directory.'
list_templates\t'List available templates.'
merge\t'Merge two revisions together. Creates a new migration file.'
revision\t'Create a new revision file.'
show\t'Show the revision(s) denoted by the given symbol.'
stamp\t'\'stamp\' the revision table with the given revision; don\'t run any migrations.'
upgrade\t'Upgrade to a later version.'"


complete -c alembic -s h -l help -d "show this help message and exit."
complete -c alembic -s v -d "show program's version number and exit"
complete -c alembic -s c -l config -d "Alternate config file; defaults to value of ALEMBIC_CONFIG environment variable, or \"alembic.ini\""
complete -c alembic -s n -l name -d "Name of section in .ini file to use for Alembic config"
complete -c alembic -s x -d "Additional arguments consumed by custom env.py scripts, e.g. -x setting1=somesetting -x setting2=somesetting"
complete -c alembic -l raiseerr -d "Raise a full stack trace on error"
complete -c alembic -s q -l quiet -d "Do not log to std output."
