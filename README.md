# STK License Server Container #

> Unofficial STK License Server Container

This requires that you download the STK License Server from [AGI Suppoort](https://support.agi.com/downloads/?t=2) and obtain a license by contacting [AGI Support](mailto:support@agi.com).  Once you have obtained these place the daemon.tar.Z file from <STKLicenseServerDownload>\Unix\unix_x64.tar\unix_x64\products\daemon at the root level of the project. 

## Build the image ##

```docker
docker build . -t jthompson/stklicenseserver
```

## Run the container ##

To run the container

| **Flag** | **Value** |
| ----- | ------ |
| -h | `<license-host-name>` |
| -p | `2080:2080` |
| -p | `27000-27009:27000:27009` |
| -v | `<local-license-path>:/var/flexlm/stk_server_license.lic` |
| --name | `stk_license` |

### Example Run Command ###

```docker
docker run -d -h stk_license_server_01 -v C:\path\to\license\eval-STK-server-ANY-200225.lic:/var/flexlm/stk_server_license.lic -p 2080:2080 -p 27000-27009:27000-27009 --name "stk_license" stk_license_server_build
```

## Notes ##

1) Port 2080 can be changed but will also need to be changed in the server license file
    - server file: `DAEMON STKD port=2080`
2) Port range 27000-27009 can be designated to be one specific port but will also need to be updated in the server license file and the client license file
    - server file: `SERVER 127.0.0.1 ANY 27000`
    - client file: `SERVER 127.0.0.1 ANY 27000`
3) The host name of `stk_license_server_01` is purely used as an example and can be anything
