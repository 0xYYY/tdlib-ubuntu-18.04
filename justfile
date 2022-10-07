latest_run_id := `PAGER=cat gh run list --workflow "Build TDLib" --limit 1 --json databaseId --jq ".[0].databaseId"`

build:
    gh workflow run build-tdlib.yml --field tdlib=v1.8.0

status:
    gh run view {{latest_run_id}}

download:
    gh run download {{latest_run_id}} --name libtdjson.so
