function bwwu() {
    touch $BITWARDENCLI_APPDATA_DIR_WORK/.bw_session
    source $BITWARDENCLI_APPDATA_DIR_WORK/.bw_session
    if [[ -z "${BW_SESSION}" ]]; then
        BW_STATUS=$(bww status | jq -r .status)
    else
        BW_STATUS=$(bww status --session $BW_SESSION | jq -r .status)
    fi
    case "$BW_STATUS" in
    "unauthenticated")
        echo "Logging into BitWarden"n
        BW_SESSION=$(bww login --raw)N
        echo "BW_SESSION=$BW_SESSION" > $BITWARDENCLI_APPDATA_DIR_WORK/.bw_session
        ;;
    "locked")
        echo "Unlocking Vault"
        bw_SESSION=$(bww unlock --raw)
        echo "BW_SESSION=$BW_SESSION" > $BITWARDENCLI_APPDATA_DIR_WORK/.bw_session
        ;;
    "unlocked")
        echo "Vault is unlocked"
        ;;
    *)
        echo "Unknown Login Status: $BW_STATUS"
        return 1
        ;;
    esac
    bww sync --session $BW_SESSION
}

function bwwg() {
    source $BITWARDENCLI_APPDATA_DIR_WORK/.bw_session
    echo 'Copying to clipboard...'
    bww get --session $BW_SESSION $1 $2 | xclip -selection c
    echo "Copied!"
}

function bwwe() {
    source $BITWARDENCLI_APPDATA_DIR_WORK/.bw_session
    echo $(bww get --session $BW_SESSION $1 $2)
}

function bwpu() {
    touch $BITWARDENCLI_APPDATA_DIR_PERSONAL/.bw_session
    source $BITWARDENCLI_APPDATA_DIR_PERSONAL/.bw_session
    if [[ -z "${BW_SESSION}" ]]; then
        BW_STATUS=$(bwp status | jq -r .status)
    else
        BW_STATUS=$(bwp status --session $BW_SESSION | jq -r .status)
    fi
    case "$BW_STATUS" in
    "unauthenticated")
        echo "Logging into BitWarden"n
        BW_SESSION=$(bwp login --raw)N
        echo "BW_SESSION=$BW_SESSION" > $BITWARDENCLI_APPDATA_DIR_PERSONAL/.bw_session
        ;;
    "locked")
        echo "Unlocking Vault"
        BW_SESSION=$(bwp unlock --raw)
        echo "BW_SESSION=$BW_SESSION" > $BITWARDENCLI_APPDATA_DIR_PERSONAL/.bw_session
        ;;
    "unlocked")
        echo "Vault is unlocked"
        ;;
    *)
        echo "Unknown Login Status: $BW_STATUS"
        return 1
        ;;
    esac
    bwp sync --session $BW_SESSION
}

function bwpg() {
    source $BITWARDENCLI_APPDATA_DIR_PERSONAL/.bw_session
    echo 'Copying to clipboard...'
    bwp get --session $BW_SESSION $1 $2 | xclip -selection c
    echo "Copied!"
}

function bwpe() {
    source $BITWARDENCLI_APPDATA_DIR_PERSONAL/.bw_session
    echo $(bwp get --session $BW_SESSION $1 $2)
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
