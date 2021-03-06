<p align="center"><img src="https://github.com/v1s1t0r999/blob/main/imgs/icons/getAir2U_LOGO.png?raw=true" /></p>

# getAir2U is not the future, but present of wireless attacks!

## :trident: Installation
``` git clone https://github.com/v1s1t0r999/getAir2U ```
``` cd getAir2U ```
``` bash getAi2U.sh ```
``` !!ENJOY!! ```

## Updates
If you want to submit a feature, do so by labeling your issue as an "enhancement" or submit a PR. I don't have enough time to make daily changes to fluxion, sorry.

## :scroll: Changelog
Fluxion gets weekly updates with new features, improvements and bugfixes.
Be sure to check out the [changelog here] (https://github.com/v1s1t0r999/getAir2U/wiki/changelog).

## :octocat: How to contribute
All contributions are welcome! Code, documentation, graphics or even design suggestions are welcome; use GitHub to its fullest. Submit pull requests, contribute tutorials or other wiki content -- whatever you have to offer, it would be appreciated!

## :book: How it works
* Scan the networks.
* Capture a handshake (can't be used without a valid handshake, it's necessary to verify the password)
* Use WEB Interface *
* Launch a FakeAP instance to imitate the original access point
* Spawns a MDK3 process, which deauthenticates all users connected to the target network, so they can be lured to connect to the FakeAP and enter the WPA password.
* A fake DNS server is launched in order to capture all DNS requests and redirect them to the host running the script
* A captive portal is launched in order to serve a page, which prompts the user to enter their WPA password
* Each submitted password is verified by the handshake captured earlier
* The attack will automatically terminate, as soon as a correct password is submitted

## :heavy_exclamation_mark: Requirements

A Linux-based operating system. We recommend or Kali 2020.x (rolling edition). Nevertheless, the Linux Distro should support the latest aircrack-ng versions. An external wifi card is recommended.

## :octocat: Credits
1. Author: UNKNOWN(Me) <https://github.com/v1s1t0r999>
2. Maintainer: Pratik Shrivastava <https://github.com/pratik1120>

## :white_chech_mark: Disclaimer

***getAir2U is intended to be used for legal security purposes only, and you should only use it to protect networks/hosts you own or have permission to test. Any other use is not the responsibility of the developer/maintainer or anyone related to this repo.  Be sure that you understand and are complying with the getAir2U licenses and laws in your area.  In other words, don't be stupid, don't be an asshole, and use this tool responsibly and legally.***
