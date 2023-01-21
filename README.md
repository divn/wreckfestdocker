# What is Wreckfest?
MORDHAU is a multiplayer medieval slasher. Create your mercenary and fight in brutal battles where you will experience fast paced combat, castle sieges, cavalry charges, and more. <br/>
This Docker image contains the dedicated server of the game. <br/>

> [Wreckfest](https://store.steampowered.com/app/228380/Wreckfest/)

<img src="https://order.wreckfestgame.com/wp-content/themes/wreckfest/img/logos/wreckfest-logo.png" alt="logo" width="323"/></img>

# How to use this image

## Hosting a simple game server
Running on the *host* interface (recommended):<br/>
```console
$ docker run -d --net=host -e SERVER_NAME="EXAMPLE_NAME" -e SERVER_PASSWORD="EXAMPLE_PASSWORD" --name=wreckfest-dedicated **********
```
If u dont set SERVER_NAME and SERVER_PASSWORDS they will be defaults
"defaultservername"
"defaultserverpassword"

**It's also recommended using "--cpuset-cpus=" to limit the game server to a specific core & thread.**<br/>
**The container will automatically update the game on startup, so if there is a game update just restart the container.**

Big thanks to https://github.com/CM2Walki for debian image with steamcmd
