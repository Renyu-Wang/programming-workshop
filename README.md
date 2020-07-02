# A programming workshop 

Learn how to run jobs on HPCC and related tools to boost programming
efficiency, including git/github, emacs, tmux, Makefile,
oh-my-zsh. There are also some optional topics like VS Code, Docker, auctex.


## Content
### Material
- All material are saved or linked in this repo. To download it, run
`git clone https://github.com/QEC-pages/programming-workshop.git`
or `git clone git@github.com:QEC-pages/programming-workshop.git` with [ssh](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)
- To synchronize the update, run `git pull` within the folder
  - If you have edited files locally, `git pull` may produce a conflict. Before learning `git`, a work-around is running `git clone ...` in a new empty folder.

### Session 1: HPCC basics
- HPCC
  - HPCC is the cluster computer at UCR. Before the workshop, try to
    finish the following two steps to make sure you can access it
    through `ssh` and run basic linux command
  - [obtain an account](https://hpcc.ucr.edu/rates.html)
  - [get started](https://hpcc.ucr.edu/manuals_linux-cluster_start.html)
  - a tip: [ssh without pasword](http://www.linuxproblem.org/art_9.html)
  - [job management](https://ccrma.stanford.edu/guides/package/emacs/emacs.html)
  - parallel computing with openmp
    - e.g. parfor in [c++](https://medium.com/swlh/introduction-to-the-openmp-with-c-and-some-integrals-approximation-a7f03e9ebb65), gap, matlab, python, etc
  - nodes specification
    - `sinfo`
	- https://dashboard.hpcc.ucr.edu
  - Everything else in this workshop shall work in any unix-like
    environment. But usually we rely on the computing power of HPCC to
    do heavy calculations.
	
### Session 2: Linux basics
- Editor and Window management
  - [emacs](https://ccrma.stanford.edu/guides/package/emacs/emacs.html)
    - `emacs filename` open file
	- `C-x C-s` save 
	- `C-x C-c` exit
    - `.emacs` see [sameple](config/.emacs)
    - `emacs --daemon` and `emacsclient` [read more](https://www.emacswiki.org/emacs/EmacsClient)
  - [tmux](https://tmuxcheatsheet.com/)
	- `module load tmux`
	- `tmux` start a new seesion
	- `tmux a` attach to previous session
    - `.tmux.conf` see [sample](config/.tmux/conf)
	- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) save window layout
  - VS Code and rmate (not to be covered here, HPCC is not VS Code-friendly)
- Makefile
  - Makefile is a shortcut for all kinds of commands.
  - [introduction](https://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/)
  - see [example 1](Makefile) and [example 2](sample/Makefile)
  

### session 3: Git-related and C++ coding style
- Git/GitHub
  - `git` is a version control software, and github is one of the online hosts.
  - [Git](https://itnext.io/become-a-git-pro-in-just-one-blog-a-thorough-guide-to-git-architecture-and-command-line-interface-93fbe9bdb395)
   - basic commands
```shell
mkdir my-first-repo
cd my-first-repo
git init
echo "hello git" >> README.md
git add README.md
git commit -m "my first commit"
```
   - show info
```
git status
git log
git config --list
```
   - you might need to set up name and email
```
git config --global user.name "Some Name"
git config --global user.email "Some@email.com"
```

  - [GitHub](https://github.com/QEC-pages) We will create several repos in the QEC-pages to demonstrate how to collaborate through branches and pull requests.
    - issue, pull request, [ssh key](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh), [release](https://help.github.com/en/enterprise/2.13/user/articles/creating-releases)
	- Edit GitHub repo locally
```
git clone ...
git push
```
	- Move your local repo to GitHub
	  - This happen when the code or repo is already on your local machine
	  - Create an empty repo on Github and then you will see the instruction there.
	  

- oh-my-zsh
  - [homepage](https://ohmyz.sh/)
  - `oh-my-zsh` is a version of `zsh`, an ultimate alternative to `bash`. It helps to work with git in terminal.
  - we will also make use of `~/.bashrc` and similar files here.
- C++
  - [Quick compilation with multiple files](https://www.cs.fsu.edu/~myers/c++/notes/compilation.html)
  - comment style with [Doxygen](https://www.doxygen.nl/index.html)
- Homework
  - Send a pull request to this repo [programming workshop](https://github.com/QEC-pages/programming-workshop), where you don't have write access. (e.g. fix some typo, add a link to s resource page, or improving the text format.)
  - Make some commit and create a new branch in this repo [min weight decoder](https://github.com/QEC-pages/min-weight-decoder), where you should have been granted write access.
  - Optional: write a min weight decoder for the Hamming code, classical [7,4,3] first, and then quantum [[7,1,3]] 



### session 4: Try a real project.
- Min weight decoder
- Random Window decoder
  - build a C++ project with random window decoder

  
### Session 5: Some fancy trick (optional)
- [Docker](https://www.docker.com/)
  - Debug the program, instead of the environment.
- [Gitpod](https://www.gitpod.io/)
  - Bring docker online
- [GitHub Action](https://help.github.com/en/actions/creating-actions/creating-a-docker-container-action)
  - Automation with docker
  - Example: generate doxygen document for a C++ repo automatically
- [Github Page](https://pages.github.com/)
  - A static website to present your repo
