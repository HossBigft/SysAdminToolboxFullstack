To clone this repo
```
git clone --recurse-submodules LINK
cd repo
git submodule update --rebase --remote
```

To run dev build execute in root repo dir
`docker compose watch`

To update all submodules execute in root repo dir
`git submodule update --rebase --remote`

To add all changes and generate commit message from submodule commits
```
git add .
git diff --submodule HEAD| git commit -F-
```

To run dev version
```
#once per session to start ssh agent and add all keys to it
source ./scripts/start_ssh_agent.sh
#then start containers
docker compose watch
```

Based on [fastapi fullstack template](https://github.com/fastapi/full-stack-fastapi-template)
