
abbr --add n    "nvim"

abbr --add ta   "tmux a"
abbr --add tn   "tmuxinator new"
abbr --add te   "tmuxinator edit"
abbr --add ts   "tmuxinator start"

abbr --add ga   "git add"
abbr --add gs   "git status"
abbr --add gc   "git checkout"
abbr --add gC   "git commit"
abbr --add gb   "git branch"
abbr --add gd   "git diff"
abbr --add gln  "git log --name-only"
abbr --add gp   "git push"
abbr --add gf   "git fetch"
abbr --add gim  "git-is-merged"

abbr --add stash    "git stash"
abbr --add commit   "git commit -m"
abbr --add check   "git checkout"
abbr --add diff     "git diff"
abbr --add restore  "git restore"
abbr --add reset    "git reset"
abbr --add rebase   "git rebase"


abbr --add rb   "rm -rd build"
abbr --add cm   "cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .."

abbr --add bq-schema "bq show --schema --project_id=mk2-prod sbRDOuWobz16XG953Vms.data | jq"


abbr --add sf   "source ~/.config/fish/config.fish"

abbr --add b   "bigquery"
abbr --add f   "fish"

abbr --add gc-artifact-repos "gcloud artifacts repositories list --format=json | jq -r '[\"NAME\", \"FORMAT\", \"updateTime\", \"createTime\"], (.[] | [.name, .format, .updateTime, .createTime]) | @tsv' | column -t"
abbr --add gc-packages "gcloud artifacts  packages list --location=europe-west1 --repository=python-packages"
abbr --add gc-package-version "gcloud  artifacts  versions list --location=europe-west1 --repository=python-packages --package=fogfit"
