complete -c gribber -n "__fish_use_subcommand" -s h -l help -d 'Print help'
complete -c gribber -n "__fish_use_subcommand" -s V -l version -d 'Print version'
complete -c gribber -n "__fish_use_subcommand" -f -a "completions" -d 'Generate shell completions for your shell to stdout'
complete -c gribber -n "__fish_use_subcommand" -f -a "decode" -d 'Export decoded data with latitudes and longitudes'
complete -c gribber -n "__fish_use_subcommand" -f -a "info" -d 'Show identification information'
complete -c gribber -n "__fish_use_subcommand" -f -a "inspect" -d 'Inspect and describes the data structure'
complete -c gribber -n "__fish_use_subcommand" -f -a "list" -d 'List layers contained in the data'
complete -c gribber -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c gribber -n "__fish_seen_subcommand_from completions" -s h -l help -d 'Print help'
complete -c gribber -n "__fish_seen_subcommand_from decode" -s b -l big-endian -d 'Export (without lat/lon) as a big-endian flat binary file' -r -F
complete -c gribber -n "__fish_seen_subcommand_from decode" -s l -l little-endian -d 'Export (without lat/lon) as a little-endian flat binary file' -r -F
complete -c gribber -n "__fish_seen_subcommand_from decode" -s h -l help -d 'Print help'
complete -c gribber -n "__fish_seen_subcommand_from info" -s h -l help -d 'Print help'
complete -c gribber -n "__fish_seen_subcommand_from inspect" -s s -l sections -d 'Print sections constructing the GRIB message'
complete -c gribber -n "__fish_seen_subcommand_from inspect" -s m -l submessages -d 'Print submessages in the GRIB message'
complete -c gribber -n "__fish_seen_subcommand_from inspect" -s t -l templates -d 'Print templates used in the GRIB message'
complete -c gribber -n "__fish_seen_subcommand_from inspect" -s h -l help -d 'Print help'
complete -c gribber -n "__fish_seen_subcommand_from list" -s d -l dump -d 'Show details of each data'
complete -c gribber -n "__fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c gribber -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from decode; and not __fish_seen_subcommand_from info; and not __fish_seen_subcommand_from inspect; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from help" -f -a "completions" -d 'Generate shell completions for your shell to stdout'
complete -c gribber -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from decode; and not __fish_seen_subcommand_from info; and not __fish_seen_subcommand_from inspect; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from help" -f -a "decode" -d 'Export decoded data with latitudes and longitudes'
complete -c gribber -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from decode; and not __fish_seen_subcommand_from info; and not __fish_seen_subcommand_from inspect; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from help" -f -a "info" -d 'Show identification information'
complete -c gribber -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from decode; and not __fish_seen_subcommand_from info; and not __fish_seen_subcommand_from inspect; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from help" -f -a "inspect" -d 'Inspect and describes the data structure'
complete -c gribber -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from decode; and not __fish_seen_subcommand_from info; and not __fish_seen_subcommand_from inspect; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from help" -f -a "list" -d 'List layers contained in the data'
complete -c gribber -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from decode; and not __fish_seen_subcommand_from info; and not __fish_seen_subcommand_from inspect; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
