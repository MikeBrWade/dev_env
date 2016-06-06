#!/bin/tcsh

set filec
set autolist
unset autologout

# ============================================================================
#                                CORE FSW ENV 
# ============================================================================
source /proj/fswcore/env/fswcore.env
source /proj/fswcore/env/pyam.cshrc
setenv timecontroller_geometry 80x24+1550+0
setenv TERM xterm-256color
setenv LS_COLORS "di=37:fi=00"
setenv LD_LIBRARY_PATH /home/mwade/lib:$LD_LIBRARY_PATH
# ============================================================================
#                               GENERAL PURPOSE 
# ============================================================================
alias rs 'source ~/.cshrc'
alias mk 'mkdir -pv'
alias rmdir 'rm -rf'
alias fsys_mounted 'mount | column -t'
alias ascii 'man ascii'
alias grep 'grep --color=always'
alias gr 'grep -ERsHn \!:1 \!:2 | grep -v .svn'
alias fs 'find . -path "*/.svn" -prune -o -print0 | xargs -0 grep -EsHn --color=always \!:1'
alias r 'reset'
alias c 'clear'
alias n 'nautilus '
alias p 'python'
alias p3 'python3'
alias whois 'whois -h jpl'
setenv EDITOR vim
alias hgr 'history | grep \!:1'
alias vim vim74
alias sshx 'ssh -XY mwade@\!:1'
alias xclip '/home/mwade/bin/xclip'
alias test 'ls'

# ============================================================================
#                                 TMUX
# ============================================================================
alias tmux '/home/mwade/bin/tmux'
alias tmux1 '/home/mwade/local/bin/tmux new -s mwade1'
alias tmuxls 'tmux list-sessions;tmux list-clients'
alias tmuxd 'tmux detach-client -s \!:1'
alias tmuxkill 'tmux kill-session -t \!:1'
alias tmuxkillall 'tmux kill-server'
alias tmuxat 'tmux attach -t \!:1'
alias tmuxb 'tmux show-buffer | xclip'

# ============================================================================
#                                SCM RELATED 
# ============================================================================
setenv YAM_EDITOR vim
setenv SVN_EDITOR vim
alias svn_stat 'reset;pwd;svn status * | grep -v debug- | grep -v _ac_ | grep -v .pyc | grep -v module_opcodes.xml | grep -v ac_dp_infiles.txt | grep -v ac_dep | grep -v _aci_params_ | grep -v .pydevproject | grep -v dp_dep | grep -v command.xml. | grep -v mk/hash/ | grep -v .cproject | grep -v .project | grep -v xml_frag | grep -v flight-vxworks-ppc-gnu-4.1.2-ut | grep -v .svn | grep -v mk/dep | grep -v mk/json | grep -v /doc/'
alias ss 'svn_stat'
alias ssall 'reset;svn status ~/dev/*/src/* | grep -v debug- | grep -v _ac_ | grep -v .pyc | grep -v module_opcodes.xml | grep -v ac_dp_infiles.txt | grep -v ac_dep | grep -v _aci_params_ | grep -v .pydevproject | grep -v dp_dep | grep -v command.xml. | grep -v mk/hash/ | grep -v .cproject | grep -v .project | grep -v xml_frag | grep -v flight-vxworks-ppc-gnu-4.1.2-ut | grep -v .svn | grep -v mk/dep | grep -v mk/json | grep -v /doc/'
alias repo 'cd /proj/fswcore/fsw/tools/pyam/Module-Releases/'
alias lastcommit 'find /proj/fswcore/fsw/tools/pyam/Module-Releases/ -maxdepth 2 -type l -name Latest -printf "%h/%l/ChangeLog\0" | xargs -0 grep -n -m 1 -A 3 \!:1'
alias cdrepo 'cd ~/repo/\!:1/'
alias lsrepo 'll ~/repo/\!:1/'
alias pysave 'cd \!:1;svn commit -m \!:3;cd ..; pyam save \!:1 --bug-id=FSWCORE-\!:2 --to-work'
alias pysync 'cd \!:1;svn commit -m \!:2;cd ..; pyam sync \!:1'
alias pyecho 'echo \!:1; echo \!:2; echo "\!:*"'
alias vyam 'vim ../YAM.config'

# ============================================================================
#                              FSYS NAVIGATION 
# ============================================================================
alias lll 'ls -lha --color=tty'
alias ll 'ls -lah --color=tty'
alias ls 'ls --color=tty'
alias cll 'clear;pwd;ll'
alias rll 'reset;pwd;ll'
alias cd. 'cd ../'
alias cd.. 'cd ../../'
alias cd... 'cd ../../../'
alias cd.... 'cd ../../../../'
alias tarx 'tar -xvf'
alias tarc 'tar -cvf'
alias ff 'find \!:2 -type f -name \!:1'
alias grsymppc 'objdumpppc -T \!:1 | grep \!:2'
alias ncdu '/home/mwade/bin/ncdu'

# ========================a====================================================
#                               CORE DEV TOOLS 
# ============================================================================
alias coredev '/home/mwade/_scripts/launch_dev.sh \!:*'
alias coremon '/home/mwade/_scripts/launch_monitor.sh \!:*'
alias findhash './mk/hash/find_hash.sh'
alias cds 'cd /proj/fswcore/fsw/dev/mwade/fswcore-core-pkg-mwade0\!:1/src/'
alias dumplib '/home/mwade/_scripts/dumplib.sh'
alias list_gcov 'find /proj/fswcore/fsw/dev/mwade/fswcore-core-pkg-mwade0\!:1/obj/linux-*-x86-debug-gnu-4.4.0/core*/libs/libcore*/ -name "*.g*"'
alias linux 'reset; make clean_linux ; make linux'
alias ut 'reset ; make clean_cov; make clean_ut_linux ; make clean_linux ; make linux ; make ut_linux ; make run_ut_linux; make run_ut_valgrind ; make cov'
alias ut_run 'reset;make run_ut_linux ; make run_ut_valgrind ; make cov'
alias lllib 'r ; ll ../lib/linux-*-x86-debug-gnu-4.4.0/*/ | grep -v " \."'
alias lllibs lllib
alias llobj 'r ; ll ../obj/linux-*-x86-debug-gnu-4.4.0/*/*/* | grep -v " \."'
alias llobjs llobj
alias llgpj 'r;echo APP ; cat app.gpj ; echo ""; echo SYS ; cat sys.gpj ; echo ""; echo SHARED ; cat shared.gpj ; echo ""; echo DLL ; cat dll.gpj'
alias sizeobj   'r ; gsize -all -zero ../obj/\!:1\-\!:2\-integrity-11.4.2/\!:3/*.o'
alias sizestats 'p ~/_scripts/check_size_stats.py'
alias sizesinobj 'gnm -defined_only \!:1 | sort -r -k 3 -n -t "|" | head -n \!:2'
alias sbstoxml 'p /proj/fswcore/fsw/dev/cgjones/dict_gen/sbs_to_xml.py pwr_config/pwr_config_ac_sbs.c ../xml/smap/current/mm_channel.xml'
alias grobjs 'find ../obj/flight-*-integrity-11.4.2/*/* -type f -name "*.o" -print0 | xargs -0 objdumpppc -t | grep -E "elf32|\!:2"'
alias telapc 'telnet corefsw-apc'
alias apcon '~/_scripts/apc_state.sh | grep -A 2 CDH; ~/_scripts/apc_cdh_on.sh | grep -E "Immediate On|CDH"; ~/_scripts/apc_probe_on.sh | grep -E "Immediate On|probe"; echo ""; ~/_scripts/apc_state.sh | grep -A 2 CDH'

alias apcoff '~/_scripts/apc_state.sh | grep -A 2 CDH; ~/_scripts/apc_cdh_off.sh | grep -E "Immediate Off|CDH" ; ~/_scripts/apc_probe_off.sh | grep -E "Immediate Off|probe"; echo""; ~/_scripts/apc_state.sh | grep -A 2 CDH'
alias apcls '~/_scripts/apc_state.sh | grep -A 2 CDH'



alias reportsb 'pwd;python /home/mwade/_scripts/update_sandbox.py report'
alias updatesb 'pwd;python /home/mwade/_scripts/update_sandbox.py update'
alias gopen 'pwd;/nfs/apps/ghs-multi-6.1.6/mprojmgr fsw/default_\!:1.gpj &'
#alias objdumpppc 'objdumpppc -xdSsgtr'
alias vim1 'vim -p pwr_worker/pwr_drv.h pwr_worker/pwr_drv.c pwr_worker/pwr_mtlm.h pwr_worker/pwr_mtlm.c'
alias vim2 'vim -p ~/.cshrc ~/.vimrc ~/.login ~/.tmux.conf ~/_scripts/check_servers_loop.py ~/_scripts/launch_dev.sh ~/_scripts/launch_monitor.sh'

# ============================================================================
#                                COMPARE TOOLS 
# ============================================================================
alias bc '/home/mwade/bin/bcompare'
alias bcs '/home/mwade/bin/bcompare /proj/fswcore/fsw/dev/mwade/fswcore-core-pkg-mwade0\!:1/src/\!:3*/ /proj/fswcore/fsw/dev/mwade/fswcore-core-pkg-mwade0\!:2/src/\!:3*/'
alias difflast '/home/mwade/bin/difflast.sh \!*'

# ============================================================================
#                                  METRICS 
# ============================================================================
alias sloc 'r;pwd;/proj/fswcore/fsw/tools/bin/slic -Lc *'
alias slocs 'r;pwd;/proj/fswcore/fsw/tools/bin/slic -Lc -t *'

# ============================================================================
#                                WSTS / TESTBED
# ============================================================================
alias wsts 'r;./ptf/runtests.sh -i mwade -r -t isimppc_cutecom -p 12345 ptf/std/wsts-no-gds.py'
alias wstsgds 'r;./ptf/runtests.sh -i mwade -r -t isimppc_cutecom -p 12345 ptf/std/wsts-gds.py'
alias dump1553 'tail --retry -f /tmp/tests.mwade/wsts-no-gds.results/europa_* | grep -v "f811"'
alias llwsts 'll /tmp/tests.mwade/wsts-no-gds.results/'
alias dump1553gds 'tail --retry -f /tmp/tests.mwade/wsts-gds.results/europa_* | grep -v "f811"'
alias llwstsgds 'll /tmp/tests.mwade/wsts-gds.results/'

# ============================================================================
#                               MAKE SYSTEM 
# ============================================================================
alias clean 'make clean_wsts;make clean_flight'
alias cleansb 'rm -rf ../lib/;rm -rf ../obj/;rm -rf ../dep; rm -rf ../hash; rm -rf ../include;rm -rf ../json;cd fsw;clean;cd ..'
alias mev '/nfs/apps/ghs-multi-6.1.6/mevgui'
alias fmake 'r;time ~/bin/ctags --python-kinds=+cfmvi --c-kinds=+cdefgmnstuv -R;cd fsw;clean;time make;cd.'
alias pmake 'r;time ~/bin/ctags --python-kinds=+cfmvi --c-kinds=+cdefgmnstuv -R;cd fsw;time make;cd.'


# ============================================================================
#                            VNC / REMOTE ACCESS
# ============================================================================
set VNC_COMMON_OPTS = "-UserPasswdVerifier=UnixAuth -AcceptCutText=1 -SendCutText=1 -IdleTimeout=0 -Permissions=mwade:f -randr 2160x1360,2160x1440,2560x1375,2560x1440,3840x2160,3840x2095"
alias vnc1 'vncserver :99 $VNC_COMMON_OPTS'
alias vnc2 'vncserver :98 $VNC_COMMON_OPTS'
alias vnc_home 'xrandr -s 3840x2095'
alias vnc_home_full 'xrandr -s 3840x2160'
alias vnc_work 'xrandr -s 2560x1375'
alias vnc_work_full 'xrandr -s 2560x1440'
alias vnc_work_sp3 'xrandr -s 2160x1360'
alias vnc_work_sp3_full 'xrandr -s 2160x1440'
alias killvnc 'ps -ef | grep mwade | grep Xvnc-core | grep -v grep | awk "{print $2}" | xargs kill'

# ============================================================================
#                           SERVER / STATUS
# ============================================================================
alias watchservers 'watch -n 60 ~/_scripts/check_fruit.sh'
alias checkservers2 'pushd ~/_scripts/;./check_fruit.sh;popd'
alias checkservers 'python /home/mwade/_scripts/check_servers.py'
alias whoson 'ssh mwade@\!:1 "ps haeo user | sort | uniq -c | sort -nr"'
alias htop '/home/mwade/bin/htop'


