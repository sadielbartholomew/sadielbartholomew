# Development Toolbox

Useful commands and short code snippets to aid with software development/engineering.
Organised into sections:

1. [Python environments](#python-environments)
2. [Jupyter](#jupyter)
3. [Commands and utilities](#commands-and-utilities)
4. [Git](#git)
5. [Hardware](#hardware)

## Python environments

* Search all `conda` environments to find any with a specific library installed:

    ```bash
    for env in $(conda env list | awk '{print $1}' | grep -v '^#'); do
        echo "Checking $env..."
        conda run -n "$env" which jupyter-book 2>/dev/null
    done
    ```

## Jupyter

*  Convert a Jupyter Notebook to a Python script:

    ```console
    $ jupyter nbconvert --to script <notebook>.ipynb
    ```

## Commands and utilities

* A non-git `diff` with the same style as `git diff`:

    ```console
    $ diff --color -u
    ```

* Find and replace all occurences of an expression in `.` (though needs care with certain
   special characters if `<before>` or `<after>` contain them, two forms give more flexibility):

    ```console
    $ find . -type f | xargs sed -i 's/<before>/<after>/g'
    $ # or e.g:
    $ find . -type f | xargs sed -i 's~<before>~<after>~g'
    ```

## Git

* To cherry-pick all the commits from commit A to commit B (where A is older than B):

    ```console
    $ git cherry-pick A^..B
    ```

## Hardware

* Report Linux info. e.g. OS, machine name, architecture:

    ```console
    $ uname -m
    ```
