function bwu() {
    source $HOME/.bw_session
    if [[ -z "${BW_SESSION}" ]]; then
        BW_STATUS=$(bw status | jq -r .status)
    else
        BW_STATUS=$(bw status --session $BW_SESSION | jq -r .status)
    fi
    case "$BW_STATUS" in
    "unauthenticated")
        echo "Logging into BitWarden"n
        BW_SESSION=$(bw login --raw)N
        echo "BW_SESSION=$BW_SESSION" > $HOME/.bw_session
        ;;
    "locked")
        echo "Unlocking Vault"
        BW_SESSION=$(bw unlock --raw)
        echo "BW_SESSION=$BW_SESSION" > $HOME/.bw_session
        ;;
    "unlocked")
        echo "Vault is unlocked"
        ;;
    *)
        echo "Unknown Login Status: $BW_STATUS"
        return 1
        ;;
    esac
    bw sync --session $BW_SESSION
}

function bwg() {
    source $HOME/.bw_session
    echo 'Copying to clipboard...'
    bw get --session $BW_SESSION $1 $2 | xclip -selection c
    echo "Copied!"
}

function bwe() {
    source $HOME/.bw_session
    echo $(bw get --session $BW_SESSION $1 $2)
}

function checkout-latest-tag() {
    # Get new tags from remote
    git fetch --tags

    # Get latest tag name
    latestTag=$(git describe --tags `git rev-list --tags --max-count=1`)

    # Checkout latest tag
    git checkout $latestTag
}

function drminame {
   docker rmi -f $(docker images | grep $1 | awk -F " " '{ print $3 }' | uniq)
}

function run-multiple-times {
    number=$1
    shift
    for i in `seq $number`; do
      $@
    done
}

function doupdate {
    sudo apt update && sudo apt upgrade -y
}

function run_parallel {

	for cmd in "$@"; do {
  		echo "Process \"$cmd\" started";
  		$cmd & pid=$!
  		PID_LIST+=" $pid";
	} done

	trap "kill $PID_LIST" SIGINT

	echo "Parallel processes have started";

	wait $PID_LIST

	echo
	echo "All processes have completed";
}
