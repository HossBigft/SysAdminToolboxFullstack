To clone this repo
```sh
git clone --recurse-submodules https://github.com/HossBigft/SysAdminToolboxFullstack.git && cd $(ls -d */ | head -n 1) && git submodule update --init --recursive
```

To run dev build execute in root repo dir
`docker compose watch`

To update all submodules execute in root repo dir
`git submodule foreach --recursive git pull -r`

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

Oneliner to deploy project, you need to run it after setting all values in `.env`
```sh
sh scripts/init_environment.sh && sh scripts/deploy.sh
```


Based on [fastapi fullstack template](https://github.com/fastapi/full-stack-fastapi-template)
