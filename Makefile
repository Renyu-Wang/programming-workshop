#=============      task commands        ================
sbatch:
	sbatch sbatch.sh
sbatch-dry-run:
	sbatch --test sbatch.sh


#=============      hpcc commands        ================
srun:
	srun --mem=16G --ntasks=1 --cpus-per-task=16 --time=0-08:00:00 --mail-user=wzeng002@ucr.edu --mail-type=ALL,TIME_LIMIT_80,TIME_LIMIT_90 --export=ALL,ON_SRUN=TRUE -p batch,intel --pty zsh -l 
srun-short:
	srun --mem=64G --ntasks=1 --cpus-per-task=64 --time=0-02:00:00 --mail-user=wzeng002@ucr.edu --mail-type=ALL,TIME_LIMIT_80,TIME_LIMIT_90 --export=ALL,ON_SRUN=TRUE -p short,batch,intel --pty zsh -l 
#--X11
group_info:
	sacct -u mwoolls
	sacct -u wzeng002
	groups
	group_cpus
nodes_info:
	sinfo
job_status:
	scontrol show job 1265309
job_list:
	squeue -u $(USER) --start
job_history:
#	#sacct -u $USER -l >>temp.log
	sacct -u $(USER) -S 2020-05-31 -E 2020-06-30 | grep product | tail -15
#	#sacct -u $(USER) -S 2020-05-31 -E 2020-06-30 -l | less -S # Type 'q' to quit
#	#sacct -u $(USER) -S 2020-05-30 -E 2020-05-31 -l 
job_history_all:
	sacct -u $(USER) -S 2020-05-31
# Be very careful when running this, it will kill all your jobs.
job_kill_all:
	squeue --user $(USER) --noheader --format '%i' | xargs scancel


#=============      ssh conection        ================
#connect the server in MSE 312, cherenkov
cherenkov:
	ssh weileizeng@cherenkov.dyn.ucr.edu
# enable X11 forwarding. make sure x11 clinet (like XQuartz) is open. -v verbose mode; -Y untrusted X11 client
cherenkov-Y:
	ssh -Yv weileizeng@cherenkov.dyn.ucr.edu
#add remote tunnel to access raspberry website through cherenkov.dyn.edu
cherenkov-domain:
	ssh -v weileizeng@cherenkov.dyn.ucr.edu -R cherenkov.dyn.ucr.edu:8080:localhost:9000

# this is a poor man's web vpn
# step 1: connect to ssh with this cmd (rsa already set up)
# step 2: change socks proxy server to 127.0.0.1:7777
cherenkov-vpn:
	ssh -D 7777 weileizeng@cherenkov.dyn.ucr.edu
# connect to biocluster in UC Riverside
hpcc:
	ssh wzeng002@cluster.hpcc.ucr.edu
#the domain name changed from biocluster to cluster.hpcc in 2019
#-v  debug mode
#-Y enable x11 forwarding
#-X disbale x11 forwarding
hpcc-rmate:
	ssh -R /rhome/wzeng002/.rmate.socket:localhost:52698 cluster.hpcc.ucr.edu

