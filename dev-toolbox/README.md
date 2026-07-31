# Development Toolbox

Useful commands and short code snippets to aid with software development/engineering.
Organised into sections:

1. [Environments](#environments)
2. [Jupyter](#jupyter)
3. [Utility comamnds](#utility-commands)
4. [Git](#git)
5. [Hardware](#hardware)
6. [Data](#data)
7. [Online and in-browser](#online-and-in-browser)
8. [Python](#python)
9. [Networking and devices](#networking-and-devices)
10. [Display and customisation](#display-and-customisation)
10. [Emacs](#emacs)

## Environments

* Show what the current `conda` environment has by way of versions for given libraries:

    ```console
    $ conda list | grep -E "<lib 1>|<lib 2>|<lib3, etc.>"
    ```

* Search all `conda` environments to find any with a specific library installed:

    ```bash
    for env in $(conda env list | awk '{print $1}' | grep -v '^#'); do
        echo "Checking $env..."
        conda run -n "$env" which <library> 2>/dev/null
    done
    ```

## Jupyter

*  Convert a Jupyter Notebook to a Python script:

    ```console
    $ jupyter nbconvert --to script <notebook>.ipynb
    ```

## Utility comamnds

* See or summarise options for, and usage of, a given command:

    ```console
    $ tldr <command>   # requires 'tldr' install, but summarises concisely & in colour
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

* Kill a frozen program/GUI by running then pointing and clicking on the window:

    ```console
    $ xkill
    ```

* `grep` for something (regular expressions supported) at the start or end of a line only:

    ```console
    $ grep '^<start of line RE>' <filename/path>
    $ grep '<end of line RE>$' <filename/path>
    ```

## Git

* Save your own skin after a git blunder!

    ```console
    $ git reflog
    $ git reset --hard HEAD@{<number of HEAD ref. from above to reset to>}
    ```

* Fetch a branch without first having to add an organisation or user as a remote with `git remote add`:

    ```console
    $ git fetch git://github.com/<org/username here>/<repo here>.git branch_name
    ```

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
    $ uname -a
    ```

* See info including MAC (and IP) addresses of network-related devices:

    ```console
    $ ip link
    $ ip addr  # includes associated IP addresses
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

## Python

* Run Python code within the command line, especially useful for
  short snippets or calculations:

    ```console
    $ python -c "<standalone runnable python snippet>"
    ```

* Basic debugging in Python:

    ```python
    import pdb
    import traceback
    traceback.print_stack()  # see stack trace from call
    pdb.set_trace()  # start PDB
    ```

* Run a Python script in development mode, for extra runtime checks and warnings etc.:

    ```console
    $ python -X dev <script>
    ```


## Networking and devices

* Troubleshooting network hardware:

    ```bash
    lsusb  # is the hardware detected?
    ip -br link  # has a network interface been created?
    nmcli device  # is NetworkManager managing and connecting to it?
    ethtool <identifier e.g. enp0...>  # is the Ethernet link up and at what speed?
    ```

* Testing connectivity:

    ```bash
    ping <router-ip>        # can I reach my local network?
    ping 1.1.1.1            # can I reach the Internet? (use globally available 1.1.1.1)
    ping <reliable hostname e.g. google.com>        # is DNS working?
    tracepath <reliable hostname e.g. google.com>    # what is the route packets take?
    ```

* Determine which process owns a port:

    ```bash
    ss -ltnp | grep :<port number>
    fuser <port number>/tcp
    ```

## Display and customisation

* Inspect fonts and/or install a new font:

    ```bash
    fc-list | grep -i "<FontName>"  # 0. Check if font installed already
    # 1. Download font ZIP file and extract, or clone font GitHub repo
    mkdir -p ~/.local/share/fonts/<FontName>  # 2. Make dir for font
    cp <path to TFF>/*.ttf ~/.local/share/fonts/<FontName>/  # 3. Copy TFF into dir
    fc-cache -fv  # 4. Refresh font cache, ignore warnings
    fc-match "<FontName>"  # 5. Verify font installed
    fc-scan <ttf path e.g. from fc-list> # 6. To see details about font
    ```

## Emacs

* Evaluate command:

    ```text
    M-: <command>
    ```

* Wrap all lines to window size without inserting any newlines etc.:

    ```text
    M-x visual-line-mode
    ```

* Detect any whitespace and/or delete any trailing whitespace and convert any tabs to whitespace:

    ```text
    M-x whitespace-mode
    M-x delete-trailing-whitespace
    M-x untabify
    ```

* Sort lines alphabetically:

    ```text
    M-x sort-lines
    ```

* Delete duplicate lines:

    ```text
    M-x delete-duplicate-lines
    ```
