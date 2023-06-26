complete -c ruff -n "__fish_use_subcommand" -s v -l verbose -d 'Enable verbose logging'
complete -c ruff -n "__fish_use_subcommand" -s q -l quiet -d 'Print lint violations, but nothing else'
complete -c ruff -n "__fish_use_subcommand" -s s -l silent -d 'Disable all logging (but still exit with status code "1" upon detecting lint violations)'
complete -c ruff -n "__fish_use_subcommand" -s h -l help -d 'Print help'
complete -c ruff -n "__fish_use_subcommand" -s V -l version -d 'Print version'
complete -c ruff -n "__fish_use_subcommand" -f -a "check" -d 'Run Ruff on the given files or directories (default)'
complete -c ruff -n "__fish_use_subcommand" -f -a "rule" -d 'Explain a rule'
complete -c ruff -n "__fish_use_subcommand" -f -a "config" -d 'List or describe the available configuration options'
complete -c ruff -n "__fish_use_subcommand" -f -a "linter" -d 'List all supported upstream linters'
complete -c ruff -n "__fish_use_subcommand" -f -a "clean" -d 'Clear any caches in the current directory and any subdirectories'
complete -c ruff -n "__fish_use_subcommand" -f -a "generate-shell-completion" -d 'Generate shell completion'
complete -c ruff -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ruff -n "__fish_seen_subcommand_from check" -l format -d 'Output serialization format for violations' -r -f -a "{text	,json	,junit	,grouped	,github	,gitlab	,pylint	,azure	}"
complete -c ruff -n "__fish_seen_subcommand_from check" -l target-version -d 'The minimum Python version that should be supported' -r -f -a "{py37	,py38	,py39	,py310	,py311	}"
complete -c ruff -n "__fish_seen_subcommand_from check" -l config -d 'Path to the `pyproject.toml` or `ruff.toml` file to use for configuration' -r -F
complete -c ruff -n "__fish_seen_subcommand_from check" -l select -d 'Comma-separated list of rule codes to enable (or ALL, to enable all rules)' -r
complete -c ruff -n "__fish_seen_subcommand_from check" -l ignore -d 'Comma-separated list of rule codes to disable' -r
complete -c ruff -n "__fish_seen_subcommand_from check" -l extend-select -d 'Like --select, but adds additional rule codes on top of the selected ones' -r
complete -c ruff -n "__fish_seen_subcommand_from check" -l extend-ignore -d 'Like --ignore. (Deprecated: You can just use --ignore instead.)' -r
complete -c ruff -n "__fish_seen_subcommand_from check" -l per-file-ignores -d 'List of mappings from file pattern to code to exclude' -r
complete -c ruff -n "__fish_seen_subcommand_from check" -l exclude -d 'List of paths, used to omit files and/or directories from analysis' -r
complete -c ruff -n "__fish_seen_subcommand_from check" -l extend-exclude -d 'Like --exclude, but adds additional files and directories on top of those already excluded' -r
complete -c ruff -n "__fish_seen_subcommand_from check" -l fixable -d 'List of rule codes to treat as eligible for autofix. Only applicable when autofix itself is enabled (e.g., via `--fix`)' -r
complete -c ruff -n "__fish_seen_subcommand_from check" -l unfixable -d 'List of rule codes to treat as ineligible for autofix. Only applicable when autofix itself is enabled (e.g., via `--fix`)' -r
complete -c ruff -n "__fish_seen_subcommand_from check" -l line-length -d 'Set the line-length for length-associated rules and automatic formatting' -r
complete -c ruff -n "__fish_seen_subcommand_from check" -l dummy-variable-rgx -d 'Regular expression matching the name of dummy variables' -r
complete -c ruff -n "__fish_seen_subcommand_from check" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c ruff -n "__fish_seen_subcommand_from check" -l stdin-filename -d 'The name of the file when passing it through stdin' -r -F
complete -c ruff -n "__fish_seen_subcommand_from check" -l fix -d 'Attempt to automatically fix lint violations'
complete -c ruff -n "__fish_seen_subcommand_from check" -l no-fix
complete -c ruff -n "__fish_seen_subcommand_from check" -l show-source -d 'Show violations with source code'
complete -c ruff -n "__fish_seen_subcommand_from check" -l no-show-source
complete -c ruff -n "__fish_seen_subcommand_from check" -l show-fixes -d 'Show an enumeration of all autofixed lint violations'
complete -c ruff -n "__fish_seen_subcommand_from check" -l no-show-fixes
complete -c ruff -n "__fish_seen_subcommand_from check" -l diff -d 'Avoid writing any fixed files back; instead, output a diff for each changed file to stdout. Implies `--fix-only`'
complete -c ruff -n "__fish_seen_subcommand_from check" -s w -l watch -d 'Run in watch mode by re-running whenever files change'
complete -c ruff -n "__fish_seen_subcommand_from check" -l fix-only -d 'Fix any fixable lint violations, but don\'t report on leftover violations. Implies `--fix`'
complete -c ruff -n "__fish_seen_subcommand_from check" -l no-fix-only
complete -c ruff -n "__fish_seen_subcommand_from check" -l ignore-noqa -d 'Ignore any `# noqa` comments'
complete -c ruff -n "__fish_seen_subcommand_from check" -l respect-gitignore -d 'Respect file exclusions via `.gitignore` and other standard ignore files'
complete -c ruff -n "__fish_seen_subcommand_from check" -l no-respect-gitignore
complete -c ruff -n "__fish_seen_subcommand_from check" -l force-exclude -d 'Enforce exclusions, even for paths passed to Ruff directly on the command-line'
complete -c ruff -n "__fish_seen_subcommand_from check" -l no-force-exclude
complete -c ruff -n "__fish_seen_subcommand_from check" -s n -l no-cache -d 'Disable cache reads'
complete -c ruff -n "__fish_seen_subcommand_from check" -l isolated -d 'Ignore all configuration files'
complete -c ruff -n "__fish_seen_subcommand_from check" -s e -l exit-zero -d 'Exit with status code "0", even upon detecting lint violations'
complete -c ruff -n "__fish_seen_subcommand_from check" -l exit-non-zero-on-fix -d 'Exit with a non-zero status code if any files were modified via autofix, even if no lint violations remain'
complete -c ruff -n "__fish_seen_subcommand_from check" -l update-check -d 'Does nothing and will be removed in the future'
complete -c ruff -n "__fish_seen_subcommand_from check" -l no-update-check
complete -c ruff -n "__fish_seen_subcommand_from check" -l statistics -d 'Show counts for every rule with at least one violation'
complete -c ruff -n "__fish_seen_subcommand_from check" -l add-noqa -d 'Enable automatic additions of `noqa` directives to failing lines'
complete -c ruff -n "__fish_seen_subcommand_from check" -l show-files -d 'See the files Ruff will be run against with the current settings'
complete -c ruff -n "__fish_seen_subcommand_from check" -l show-settings -d 'See the settings Ruff will use to lint a given Python file'
complete -c ruff -n "__fish_seen_subcommand_from check" -s v -l verbose -d 'Enable verbose logging'
complete -c ruff -n "__fish_seen_subcommand_from check" -s q -l quiet -d 'Print lint violations, but nothing else'
complete -c ruff -n "__fish_seen_subcommand_from check" -s s -l silent -d 'Disable all logging (but still exit with status code "1" upon detecting lint violations)'
complete -c ruff -n "__fish_seen_subcommand_from check" -s h -l help -d 'Print help'
complete -c ruff -n "__fish_seen_subcommand_from rule" -l format -d 'Output format' -r -f -a "{text	,json	}"
complete -c ruff -n "__fish_seen_subcommand_from rule" -s v -l verbose -d 'Enable verbose logging'
complete -c ruff -n "__fish_seen_subcommand_from rule" -s q -l quiet -d 'Print lint violations, but nothing else'
complete -c ruff -n "__fish_seen_subcommand_from rule" -s s -l silent -d 'Disable all logging (but still exit with status code "1" upon detecting lint violations)'
complete -c ruff -n "__fish_seen_subcommand_from rule" -s h -l help -d 'Print help'
complete -c ruff -n "__fish_seen_subcommand_from config" -s v -l verbose -d 'Enable verbose logging'
complete -c ruff -n "__fish_seen_subcommand_from config" -s q -l quiet -d 'Print lint violations, but nothing else'
complete -c ruff -n "__fish_seen_subcommand_from config" -s s -l silent -d 'Disable all logging (but still exit with status code "1" upon detecting lint violations)'
complete -c ruff -n "__fish_seen_subcommand_from config" -s h -l help -d 'Print help'
complete -c ruff -n "__fish_seen_subcommand_from linter" -l format -d 'Output format' -r -f -a "{text	,json	}"
complete -c ruff -n "__fish_seen_subcommand_from linter" -s v -l verbose -d 'Enable verbose logging'
complete -c ruff -n "__fish_seen_subcommand_from linter" -s q -l quiet -d 'Print lint violations, but nothing else'
complete -c ruff -n "__fish_seen_subcommand_from linter" -s s -l silent -d 'Disable all logging (but still exit with status code "1" upon detecting lint violations)'
complete -c ruff -n "__fish_seen_subcommand_from linter" -s h -l help -d 'Print help'
complete -c ruff -n "__fish_seen_subcommand_from clean" -s v -l verbose -d 'Enable verbose logging'
complete -c ruff -n "__fish_seen_subcommand_from clean" -s q -l quiet -d 'Print lint violations, but nothing else'
complete -c ruff -n "__fish_seen_subcommand_from clean" -s s -l silent -d 'Disable all logging (but still exit with status code "1" upon detecting lint violations)'
complete -c ruff -n "__fish_seen_subcommand_from clean" -s h -l help -d 'Print help'
complete -c ruff -n "__fish_seen_subcommand_from generate-shell-completion" -s v -l verbose -d 'Enable verbose logging'
complete -c ruff -n "__fish_seen_subcommand_from generate-shell-completion" -s q -l quiet -d 'Print lint violations, but nothing else'
complete -c ruff -n "__fish_seen_subcommand_from generate-shell-completion" -s s -l silent -d 'Disable all logging (but still exit with status code "1" upon detecting lint violations)'
complete -c ruff -n "__fish_seen_subcommand_from generate-shell-completion" -s h -l help -d 'Print help'
complete -c ruff -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from check; and not __fish_seen_subcommand_from rule; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from linter; and not __fish_seen_subcommand_from clean; and not __fish_seen_subcommand_from generate-shell-completion; and not __fish_seen_subcommand_from help" -f -a "check" -d 'Run Ruff on the given files or directories (default)'
complete -c ruff -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from check; and not __fish_seen_subcommand_from rule; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from linter; and not __fish_seen_subcommand_from clean; and not __fish_seen_subcommand_from generate-shell-completion; and not __fish_seen_subcommand_from help" -f -a "rule" -d 'Explain a rule'
complete -c ruff -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from check; and not __fish_seen_subcommand_from rule; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from linter; and not __fish_seen_subcommand_from clean; and not __fish_seen_subcommand_from generate-shell-completion; and not __fish_seen_subcommand_from help" -f -a "config" -d 'List or describe the available configuration options'
complete -c ruff -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from check; and not __fish_seen_subcommand_from rule; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from linter; and not __fish_seen_subcommand_from clean; and not __fish_seen_subcommand_from generate-shell-completion; and not __fish_seen_subcommand_from help" -f -a "linter" -d 'List all supported upstream linters'
complete -c ruff -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from check; and not __fish_seen_subcommand_from rule; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from linter; and not __fish_seen_subcommand_from clean; and not __fish_seen_subcommand_from generate-shell-completion; and not __fish_seen_subcommand_from help" -f -a "clean" -d 'Clear any caches in the current directory and any subdirectories'
complete -c ruff -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from check; and not __fish_seen_subcommand_from rule; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from linter; and not __fish_seen_subcommand_from clean; and not __fish_seen_subcommand_from generate-shell-completion; and not __fish_seen_subcommand_from help" -f -a "generate-shell-completion" -d 'Generate shell completion'
complete -c ruff -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from check; and not __fish_seen_subcommand_from rule; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from linter; and not __fish_seen_subcommand_from clean; and not __fish_seen_subcommand_from generate-shell-completion; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
