# Push Subdirectories

GitHub Action to push subdirectories to separate repositories.

### Why?
Bit Project develops its open source curriculum in a monolithic repo. However, Github Learning Labs require each individual course to have its own repo. Therefore, we use this plugin to sync each subdirectory into its own directory. 

## Usage

```yml
name: Publish Slack Repo
on: push
jobs:
  master:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: publish:slack
        uses: bitprj/push-subdir@0.3
        env:
          API_TOKEN_GITHUB: ${{ secrets.API_TOKEN_GITHUB }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          args: Slack-Apps bitprj Bitcamp-Slack main
```

The `GITHUB_TOKEN` will automatically be defined, the `API_TOKEN_GITHUB` needs to be set in the `Secrets` section of your repository options. You can retrieve the `API_TOKEN_GITHUB` [here](https://github.com/settings/tokens) (set the `repo` permission).

The action accepts four arguments - the first two are mandatory, the third and fourth are optional.

1. Name of the subdirectory that you want to push
2. GitHub username
3. Repository name that you want to push to
4. The branch name that the changes should be pushed to. Defaults to `main`. 
