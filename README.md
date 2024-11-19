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

Based on [fastapi fullstack template](https://github.com/fastapi/full-stack-fastapi-template)
