abbr --add curl-reupload curl 'https://europe-west1-mk2-test.cloudfunctions.net/http_bq_company_reupload \
    -H "Authorization: bearer $(gcloud auth print-identity-token)" \
    -d \'{"company_id":"nwNLRXhWFPi9pIq5tJ0o"}\' \
    -H "Content-Type: application/json"'

abbr --add curl-delete-tables 'curl https://europe-west1-mk2-test.cloudfunctions.net/http_delete_migration_tables \
            -H "Authorization: bearer $(gcloud auth print-identity-token)" \
            -d \'{"company_id":"nwNLRXhWFPi9pIq5tJ0o"}\' \
            -H "Content-Type: application/json"'

