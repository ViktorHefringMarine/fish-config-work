abbr --add gc-artifact-repos "gcloud artifacts repositories list --format=json | jq -r '[\"NAME\", \"FORMAT\", \"updateTime\", \"createTime\"], (.[] | [.name, .format, .updateTime, .createTime]) | @tsv' | column -t"
abbr --add gc-packages "gcloud artifacts  packages list --location=europe-west1 --repository=python-packages"
abbr --add gc-package-version "gcloud  artifacts  versions list --location=europe-west1 --repository=python-packages --package=fogfit"
