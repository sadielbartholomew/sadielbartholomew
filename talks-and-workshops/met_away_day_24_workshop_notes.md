# Notes from 'New tools in weather and climate research' breakout session

Breakout session at 2024 Met. Dept. Away Day

## Notes from Group n/4, as facilitated by Sadie Bartholomew (~11 people)

### Q1) What new tools

**Question: What new tools are you using that you think might be of interest
to your colleagues?**


#### Tools for quick-look and visualisation

* Panoply - Python tool, use as a quick-look tool for netCDF
* Cartopy - another Python tool for visualisation
* Geovista - for 3D plotting
* CSET - as covered in Sylvia's talk this afternoon, developed in a workflow
  engine (Cylc 8), can parallelise
* xconv - also a quick-look tool, though quite slow.


#### AI-driven/like helper tools

* GitHub Co-pilot - e.g. to write docs for your code and for initial code
  suggestions.
* ChatGPT - including to help write text for papers, or at least generate
  initial ideas for that.


#### Model workflow related

* GCM - an old tool used on the Reading side
* Workflow engines
* Libraries such as cf-python
* Supercomputers e.g. JASMIN
* Models e.g. running radiative transfer models
* Model-specific tools e.g. for wrf-python for working with WRF data/outputs
* ESMValTool and other validation tools.


#### Languages, environments, misc. tools

* IDEs for writing text and code
* languages themselves - Python, C, IDL
* A whole operating system! ClimUbuntu, an OS designed for Climate Science
* conda and conda-forge for environments to get dependencies.


### Q2) Finding and investigating new tools

**Question: How do you find out about new tools and whether or not to investigate
using them? How do you investigate if you do?**

* Web forums
* Mailing lists
* A Google search
* "Thinking more globally, not just on the Reading side"
* Often have very model-specific questions, so localised advice
  (e.g. from colleagues) is best
* Asking around
* Openly-available tools on GitHub, GitLab or Trac etc., e.g. using the
  global search on GitHub
* When people who already know about the tool help you or tell you what to do
* Drop-in sessions, e.g. as held by Maria Broadbridge and team.


### Q3) Blockers and how to address them

**Question: What are the blockers to exploiting new tools and what can we
do about them?**

#### Part 1 answers:

**Question: What are the blockers to exploiting new tools?**

* Not having admin control over the environments -
  when need permission from management or intitutional access to
  something and have to go through management or IT, it blocks progress.
  * Someone advised: dual-boot your laptop so you can avoid Reading
    institutional control on the Linux portion.
* Package managers struggling to get consistent environments 
* Solving environments, with conda or (especially) on the RACC
* Someone else advised: virtual environments can help
* Managing multiple environments
* Not enough storage
* Not having the time (to explore for the best tool / use tools the best way /
  tidy up code etc.)- just wanting to do something quickly and not being
  able to figure it out
* No time available to explore new tools
* Old code and libraries e.g. Python 2, for running older/previous code. Not
  beig able to access/use those.
* Worries that code 'needs tidying up' before share it / put it anywhere
  publicly viewable.
  * We agree this is a common worry, but important nonetheless.
* Thinking code is too specific that nobody else but myself would ever
  use/need it, hence not putting it anywhere shareable or reviewing how
  understandable etc. it is
* Some applications aren't useful for applying code standards e.g. when it is
  just a quick script you use yourself: there's 'a time and a place' for those.
  * There is agreement here, but I point out that often code starts as something
    people think nobody else will ever want to need to use, but the scope gets
    extended so that they do, so consider that.
* Need to put in extra effort [to find new tools]
* Lack of version control, use of instead e.g. sharing code by email (list) etc.


#### Part 2 answers:

**Question: ...and what can we do about them?**

* Putting code somewhere it can be viewed openly / sharing it, esp.
  open-sourcing code
* For traceability and QA
* Someone really wanted Climate/Reading related/specific advice - to help them
  understand how to use the tools in practice for our work, in particular.
* RE solving envinroments point:
  * Advice (from me): mamba can help when conda struggles, mamba is better
    for this by far.


### Extra/misc. notes

#### Questions, ideas, suggestions on the topic stemming from any question

* Could there be a session planned to show example of *how to use* some/all
  these tools?
* Could there be an email list or similar to ask questions relating to tools
  like we have discussed today?
* Idea: can we have a list of people self-assigned to tools/topics who we can
  go to for advice on those tools/topics?


----
