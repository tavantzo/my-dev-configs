dockerKiller() {
  docker ps -q -f name=$1 | xargs -I {} docker kill -s 9 {}
}
docker-cleanup(){
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
    docker volumes $(docker volume -q --filter dangling=true -q 2>/dev/null) 2>/dev/null
}
docker-stats() {
    docker stats $(docker ps | awk '{if(NR>1) print $NF}')
}
alias rmorig='find ./ -type f -iname "*.orig" -exec rm {} \;'
alias ll='ls -alh'
alias tmux-new='tmux new -n main'
alias docker-kill=dockerKiller
