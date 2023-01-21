#!/bin/bash
mkdir -p "${STEAMAPPDIR}" || true  

# Override SteamCMD launch arguments if necessary
# Used for subscribing to betas or for testing
if [ -z "$STEAMCMD_UPDATE_ARGS" ]; then
	bash "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "$STEAMAPPDIR" +login anonymous +app_update "$STEAMAPPID" +quit
else
	steamcmd_update_args=($STEAMCMD_UPDATE_ARGS)
	bash "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "$STEAMAPPDIR" +login anonymous +app_update "$STEAMAPPID" "${steamcmd_update_args[@]}" +quit
fi

# Switch to workdir
cd "${STEAMAPPDIR}"

# We assume that if the config is missing, that this is a fresh container
if [ ! -f server_config.cfg ]
then
    echo "Existing serve_config not found"
    echo "Copying initial config to server_config.cfg"
    cp initial_server_config.cfg server_config.cfg
    sed -i 's/server_name=.*/server_name='"${SERVER_NAME}"'/g' server_config.cfg
    sed -i 's/password=.*/password='"${SERVER_PASSWORD}"'/g' server_config.cfg
else
    echo "Existing server_config found!"
fi

bash xvfb-run exec wine Wreckfest_x64.exe -s server_config=server_config.cfg