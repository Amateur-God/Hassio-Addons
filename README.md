# Amateur-God's ADB-Server Home assistant Addon

<!--[![GitHub Release][releases-shield]][releases]-->
![Project Stage][project-stage-shield]
[![License][license-shield]](LICENSE.md)

![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports i386 Architecture][i386-shield]

[![Github Actions][github-actions-shield]][github-actions]
![Project Maintenance][maintenance-shield]
[![GitHub Activity][commits-shield]][commits]

[![Discord][discord-shield]][discord]
<!--[![Community Forum][forum-shield]][forum]
-->
[![Docker Pulls][docker-pulls-shield]][docker-pulls]
## About

Welcome to Amateur-God's Home Assistant Add-ons. This repository hosts the ADB-Server add-on, which provides an Android Debug Bridge (ADB) server for Home Assistant, including an ingress terminal for executing commands.

## Add-ons

### ADB-Server Add-on

The ADB-Server add-on allows you to connect and control your Android devices from within Home Assistant. This is useful for automating tasks and integrating Android devices into your smart home setup.
<!--
Key features include:

- Full GitHub repository with CI/CD setup.
- Detailed Dockerfile structure.
- Usage of `config.json` and `build.json` files for configuration.
- Integration with S6 overlay for service management.
- Implementation of Bashio for streamlined scripting.
- Deployment to GitHub Container Registry.
- Comprehensive use of Docker label schema.
- Ingress terminal for executing ADB commands directly from Home Assistant.

[:books: Read the full add-on documentation][docs]-->

## Usage

### Prerequisites

- Ensure you have Home Assistant installed.
- Make sure your Android devices have ADB debugging enabled.
  - On the Android device, go to `Settings > About phone` and tap `Build number` seven times to enable developer mode.
  - Go to `Settings > Developer options` and enable `USB debugging` or `Wireless debugging`.

### Installation

1. **Add the Repository to Home Assistant:**
   - In Home Assistant, go to `Supervisor > Add-on Store`.
   - Click the three-dot menu at the top right and select `Repositories`.
   - Add the following URL: `https://github.com/Amateur-God/Hassio-Addons`.

2. **Install the ADB-Server Add-on:**
   - Find the ADB-Server add-on in the list and click on it.
   - Click on the `Install` button.

3. **Configure the Add-on:**
   - Go to the `Configuration` tab.
   - Edit the `config.json` to include the IP addresses of your Android devices and any other required configuration. For example:
     ```json
     {
       "devices": [
         {
           "name": "Living Room TV",
           "ip": "192.168.1.100"
         },
         {
           "name": "Bedroom Tablet",
           "ip": "192.168.1.101"
         }
       ],
       "additional_config": "your_additional_config_here"
     }
     ```
   - Save the configuration.

4. **Start the Add-on:**
   - Go to the `Info` tab and click the `Start` button.
   - Optionally, enable the `Start on boot` option to ensure the add-on starts automatically when Home Assistant starts.

5. **Access the Ingress Terminal:**
   - Once the add-on is running, click on `Open Web UI` to access the ingress terminal.
   - You can now execute ADB commands directly from the terminal.

### Example Commands

- **List Connected Devices:**
  ```sh
  adb devices
  ```

- **Install an APK:**
  ```sh
  adb -s <device_ip> install /path/to/app.apk
  ```

- **Send a Key Event:**
  ```sh
  adb -s <device_ip> shell input keyevent 26  # Power button event
  ```

- **Reboot the Device:**
  ```sh
  adb -s <device_ip> reboot
  ```

## Support

Got questions or need help?
<!--
You have several options to get them answered:

- The [Home Assistant Community Add-ons Discord chat server][discord] for add-on support and feature requests.-->
- The [The Viking Studios chat server][discord-vs] for general Home Assistant discussions and questions.
<!--- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]
-->
You can <!--also--> [open an issue here][issue] on GitHub.

## Contributing

We welcome contributions from the community. If you would like to contribute, please read our [contribution guidelines](.github/CONTRIBUTING.md).

Thank you for your interest and contributions! :heart_eyes:

## Authors & Contributors

This repository is maintained by [Amateur-God](https://github.com/Amateur-God). For a full list of all authors and contributors, check [the contributor's page][contributors].

<!--
## Additional Home Assistant Add-ons

Looking for more add-ons for your Home Assistant setup? Check out our [GitHub Repository][repository] for a complete list of available add-ons.
-->
## License

GNU General Public License v3.0

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see [https://www.gnu.org/licenses/](https://www.gnu.org/licenses/).

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[commits-shield]: https://img.shields.io/github/commit-activity/y/Amateur-God/Hassio-Addons.svg
[commits]: https://github.com/Amateur-God/Hassio-Addons/commits/main
[contributors]: https://github.com/Amateur-God/Hassio-Addons/graphs/contributors
[discord-vs]: https://discord.gg/2gexJGFU8j
[discord-shield]: https://img.shields.io/discord/1032437213100777502
[discord]: discord.me/vikingstudios
[docs]: https://github.com/Amateur-God/Hassio-Addons/blob/main/example/DOCS.md
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/repository-community-hass-io-add-ons/24705?u=frenck
[github-actions-shield]: https://github.com/Amateur-God/Hassio-Addons/actions/workflows/CI-CD.yaml/badge.svg
[github-actions]: https://github.com/Amateur-God/Hassio-Addons/actions
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/Amateur-God/Hassio-Addons/issues
[license-shield]: https://img.shields.io/github/license/Amateur-God/Hassio-Addons.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[reddit]: https://reddit.com/r/homeassistant
[releases-shield]: https://img.shields.io/github/release/Amateur-God/Hassio-Addons.svg
[releases]: https://github.com/Amateur-God/Hassio-Addons/releases
[repository]: https://github.com/Amateur-God/Hassio-Addons
[docker-pulls-shield]: https://img.shields.io/docker/pulls/amateurgod/adb_server
[docker-pulls]: https://hub.docker.com/r/amateurgod/adb_server
