# What is Wreckfest?

Wreckfest is a racing video game developed by Bugbear Entertainment and published by THQ Nordic.<br/>
Wreckfest is described as the spiritual successor to the FlatOut series and a cross between FlatOut,<br/>
Destruction Derby and cult 1989 PC racer Street Rod.[1] A notable feature of the game engine is the <br/>
use of soft-body damage modelling, which enables location-based damage that affects the driving dynamics of vehicles in a realistic fashion.

> [Wreckfest](https://store.steampowered.com/app/228380/Wreckfest/)

<img src="https://order.wreckfestgame.com/wp-content/themes/wreckfest/img/logos/wreckfest-logo.png" alt="logo" width="323"/></img>

# How to use this image

## Hosting a simple game server

Running on the _host_ interface (recommended):<br/>

```console
$ docker run -d --net=host -e SERVER_NAME="EXAMPLE_NAME" -e SERVER_PASSWORD="EXAMPLE_PASSWORD" --name=wreckfest-dedicated ghcr.io/divn/wreckfestdocker:master
```

If u dont set SERVER_NAME and SERVER_PASSWORDS they will be defaults
"defaultservername"
"defaultserverpassword"

**It's also recommended using "--cpuset-cpus=" to limit the game server to a specific core & thread.**<br/>
**The container will automatically update the game on startup, so if there is a game update just restart the container.**

Big thanks to https://github.com/CM2Walki for debian image with steamcmd
