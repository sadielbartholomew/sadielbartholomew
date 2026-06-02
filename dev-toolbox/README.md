# Development Toolbox

Useful commands and short code snippets to aid with software development/engineering

## Unorganised (awaiting topic headings)

1. Search all `conda` environments to find any with a specific library installed:

```bash
for env in $(conda env list | awk '{print $1}' | grep -v '^#'); do
    echo "Checking $env..."
    conda run -n "$env" which jupyter-book 2>/dev/null
done
```

2. Convert a Jupyter Notebook to a Python script:

```console
$ jupyter nbconvert --to script <notebook>.ipynb
```

3. A non-git `diff` with the same style as `git diff`:

```console
diff --color -u
```
