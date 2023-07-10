# pull-request-tut
github pull request tut. for gist

## Make branches
* for a b c
```bash
mkdir -p temp

```

## Experiment
```bash
#
echo a `date` > temp/a.txt
echo b `date` > temp/b.txt
echo c `date` > temp/c.txt
```

* initial commit. then modify them from multiple places

```bash
cd ~/VSCodeProjects
git clone git@github.com:hychan48/pull-request-tut.git
git add temp/a.txt -m "a"

cd ~/temp
git clone git@github.com:hychan48/pull-request-tut.git

```

## Vscode
```bash
git status
```

* remember to check LF/CRLF
* add .workspace / git config later