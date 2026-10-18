# Space Engineers Dedicated Debian Docker Container

This is an updated fork of [Devidian's docker-spaceengineers](https://github.com/Devidian/docker-spaceengineers)

Created by [Devidian](https://github.com/Devidian), who used parts of projects from [7thCore](https://github.com/7thCore) and [mmmaxwwwell](https://github.com/mmmaxwwwell).

See [Credits](#credits).

## Pre-requisites

Make sure the required software is installed:
- Docker
- Git
- Steam
- Wine

## Recommended
- ProtonPlus (Install Steam compatability tools, easy access to prefix directories)

## Build Docker Image

Clone this repo into a desired path and make note of the path, i.e. `~/docker-spaceengineers`

```bash
git clone https://github.com/Furzmund/docker-spaceengineers
```

Inside the `docker-spaceengineers` directory, build the Docker image, start the server and wait until the server exits.

```bash
docker compose up -d && docker logs -f se-ds-docker
```

Now shutdown the server

```bash
docker compose stop
```

## Create Server Files

The dedicated server files should now exist, which will be used to create a new world instance.

There are a few ways to do this. The recommended way is method 1, the Create-World script.

### Method 1 - Create-World Script

First decide which compatability tool you want to use.

To see the tools available view the folders listed:

```bash
ls ~/.steam/steam/compatibilitytools.d
```
Then run the script:

```bash
./create-world.sh [VERSION]
```

***Example:***
```bash
./create-world.sh GE-Proton11-9
```

### Method 2 - Steam

Install the Space Engineers Dedicated (SED) Server" from Steam.

Follow the link below, click on "Launch" and install the SED Server.

[https://steamdb.info/app/298740/](https://steamdb.info/app/298740/)

Configure compatability in Steam using the latest Proton version.

---

### Method 3 - Use the existing SED Server in Steam

After creating the SED server container, it will have installed the SED server files in the `appdata` folder inside the repo directory.

In Steam add a Non-Steam Game and find the executable at `/REPO/PATH/appdata/space-engineers/SpaceEngineersDedicated/DedicatedServer64/SpaceEngineersDedicated.exe`

Configure compatability in Steam using the latest Proton version.

---

### Sub-Step for Methods 2 & 3

If using Steam, you will need to find the location of the Proton prefix.

*(Tip: Via ProtonPlus, in the Games tab, the prefix directory can be opened)*

Within the prefix go to `drive_c/users/steamuser/AppData/Roaming/SpaceEngineersDedicated/`

Copy the config to the server prefix

```bash
cp SpaceEngineers-Dedicated.cfg /REPO/PATH/appdata/space-engineers/instances/SE/
```

Copy the save files to the server prefix

```bash
cp -R Saves/ /REPO/PATH/appdata/space-engineers/instances/SE/
```

---
---
# old readme below here
---
---

## Build the image yourself from source

Download this repository and run `docker-compose up -d`

## FAQ

### Can I use plugins?

Yes just copy plugins to `/appdata/space-engineers/plugins` and they will be added or removed by the [entrypoint.sh](entrypoint.sh) script

### Can I run mods?

Yes as they are saved in your world, the server will download them on the first start.

### Can I contribute?

Sure, feel free to submit merge requests or issues if you have anything to improve this project. If you just have a question, use Github Discussions.

## Credits

| User                                                      | repo / fork                                                            | what (s)he did for this project |
| --------------------------------------------------------- | ---------------------------------------------------------------------- | ------------------------------- |
| [mmmaxwwwell](https://github.com/mmmaxwwwell)             | https://github.com/mmmaxwwwell/space-engineers-dedicated-docker-linux  | downgrading for dotnet48        |
| [7thCore](https://github.com/7thCore)                     | https://github.com/7thCore/sesrv-script                                | installer bash script           |
| [Diego Lucas Jimenez](https://github.com/tanisdlj)        | -                                                                      | Improved Dockerfile             |
| [EthicalObligation](https://github.com/EthicalObligation) | https://github.com/EthicalObligation/docker-spaceengineers-healthcheck | Healthcheck & Quicker startup   |
| [draconb](https://github.com/draconb)                     | -                                                                      | Hints for plugin support        |

## Known issues

- **VRage Remote Client**
  - I personally could not manage to connect with te remote client, if anyone gets a connection please tell me (and maybe how you fixed it) [see here](https://github.com/Devidian/docker-spaceengineers/issues/36)
