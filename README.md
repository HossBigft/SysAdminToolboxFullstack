To clone this repo
```
git clone --recurse-submodules git@github.com:HossBigft/SysAdminToolboxFullstack.git
cd SysAdminToolboxFullstack
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

To run version that uses docker containers to mimic plesk&ns servers
`bash ./scripts/start_local_stack.sh`

Based on [fastapi fullstack template](https://github.com/fastapi/full-stack-fastapi-template)
