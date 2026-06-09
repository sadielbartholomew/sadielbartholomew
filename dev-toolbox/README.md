# Development Toolbox

Useful commands and short code snippets to aid with software development/engineering.
Organised into sections:

1. [Python environments](#python-environments)
2. [Jupyter](#jupyter)
3. [Commands and utilities](#commands-and-utilities)
4. [Git](#git)
5. [Hardware](#hardware)
6. [Data](#data)
7. [Online and in-browser](#online-and-in-browser)

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

* See or summarise options for, and usage of, a given command:

    ```console
    $ tldr <command>   # requires 'tldr' install, but summarises in colour!
    $ <command> --help
    $ man <command>  # only works if a manual is defined

    ```

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

 * List everything (in a 'tree' like visualisation) under the current directory, N levels deep only or
    directories (not files etc.) only:

    ```console
    $ tree -L N  # N levels deep in parent-child hierarchy only e.g. N=2
    $ tree -d      # directories only
    ```

 * Year calendar but show only the current month and next N-1, e.g. N=3 for 3 month view:

    ```console
    $ cal -n N
    ```

* Character count of a code line or sequence etc.:

    ```console
    $ echo -n "<code line>" | wc -c
    ```


## Git

* To cherry-pick all the commits from commit A to commit B (where A is older than B):

    ```console
    $ git cherry-pick A^..B
    $ git cherry-pick A..B  # or, ignoring A itself
    ```

* Push directly to a non-main/feature upstream branch from the
  current local branch:

    ```console
    $ git push upstream $(git rev-parse --abbrev-ref HEAD):<feature branch name>
    ```


## Hardware

* Report Linux info. e.g. OS, machine name, architecture:

    ```console
    $ uname -m
    ```

## Data

 * Metadata-only view of a netCDF file, showing only the headers:

    ```console
    $ ncdump -h <filename>.nc
    ```

## Online and in-browser

* Open all files (as a background process) in the current directory in one window of a given browser:

    ```console
    $ firefox * &
    $ google-chrome * &
    ```
