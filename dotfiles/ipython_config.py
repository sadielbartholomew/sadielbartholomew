# ---------------------------------------------------------------------------
# Default IPython config: put under '~/.ipython/profile_default'
# ---------------------------------------------------------------------------

c = get_config()

# Load these modules on start-up:
c.InteractiveShellApp.exec_lines = [
    'import pdb',
    'import os',
    'import sys',
    'import copy',
    'import inspect',
    'import logging',
    'import pprint',
]

# Debugging...
# Set to 10 for debug level when updating, but 40 for error level for usage
c.InteractiveShellApp.log_level = 40
# Crash report when IPython errors internally
c.BaseIPythonApplication.verbose_crash = True

# Disable banner on initialisation
c.TerminalIPythonApp.display_banner = False

# Disable truncation of large collections
c.PlainTextFormatter.max_seq_length = 0

c.InteractiveShell.autoindent = True
c.InteractiveShell.confirm_exit = False
c.InteractiveShell.editor = 'emacs'
c.InteractiveShell.xmode = 'Context'

# Colours
#   TODO: create own colour theme with emacs theme colour scheme, as the dark
#   themes provided by pygments are all ugly except grayscale ones e.g. algol
c.InteractiveShell.colors = 'Linux'  # colour of tracebacks and objects
c.TerminalInteractiveShell.highlighting_style = 'algol'  # ...of prompt, syntax

c.TerminalInteractiveShell.prompts_class.justify = True
c.PrefilterManager.multi_line_specials = False

# TODO: add aliases
