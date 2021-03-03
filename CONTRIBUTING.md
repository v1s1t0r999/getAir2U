# Contributing

Hi there! We are thrilled that you would like to contribute to this project. Your help is essential for keeping it great.

When contributing to this repository, please first discuss the change you wish to make via issue,
email, or any other method with the owners of this repository before making a change. Please read the Issue Creation Policy shown below before creating it.

Please note we have a [Code of Conduct], please follow it in all your interactions with the project.

---

## Issue Creation Policy

1. Please, consider to contact us on [IRC] or [Discord] channel before opening an issue. More info at [Wiki Contact Section]
2. Filling the issue template with *ALL* the requested info is mandatory. Otherwise the issue can be marked as "invalid" and closed immediately.
3. Issues must be opened in English.
4. If an issue is opened and more info is needed, `getAir2U` staff will request it. If there is no answer in 7 days or the OP is not collaborating, the issue will be closed.
5. If the issue is not related to getAir2U or the root cause is out of scope, it will be closed. `getAir2U` staff is not a helpdesk support service.
6. Try to be sure that your problem is related to getAir2U and that is not a driver issue. A good practice is always to try to perform the same operation without using `getAir2U` in order to see if the problem or the behavior can be reproduced. In that case, probably the issue should not be created.
7. Don't talk or mention references to other tools. If you want to talk about other similar tools you can do it on their pages/github. `getAir2U` issues are to talk about `getAir2U`.

## Collaborating Translators

1. Ask ALWAYS before start a translation to add a new language (by mail at [aditya.funs.11@gmail.com], by Instagram at [@Pratik_Senpai], by [IRC] or [Discord] channel). Contact to the development team in order to know what are you going to do. You'll be informed about how to proceed.
2. Once new language is approved or if you are going to update an existing one, update the date under shebang on every commit.
3. Translate the strings located in `language_strings.sh` and the existing phrases _language_strings_handling_messages function_ in `getAir2U.sh`.
4. If you want to create a pull request with a new language to be added, at least the 80% of the phrases must be translated and the rest must be done with at least _an automatic-translation_ system and marked with PoT (Pending of Translation) mark.
5. Remember that pull requests done over master branch will be rejected. Read the git workflow policy first.
6. After verification of and acceptation of the pull request, you can be added as a collaborator on the project to push directly on the repository instead of submitting pull requests.
7. Knowledge about `git` is mandatory (at least basic commands) to push directly into the project repository.

## Collaborating Developers and Plugins Development

#### For direct interaction with the repository (plugins development excluded):

1. First of all ask ALWAYS before performing a development. Ask to the developement team to set what is going to be
2. Tweak *"getAir2U_DEVELOPMENT_MODE"* variable to "true" for faster development skipping intro and initial checks or change *"getAir2U_DEBUG_MODE"* variable for verbosity.
3. Respect the **4 width tab indentation**, code style and the **UTF-8 encoding**.
4. Use **LF** (Unix) line break type (not CR or CRLF).
5. Use [Shellcheck] to search for errors and warnings on code. (Thanks [xtonousou] for the tip :wink:). To avoid false positive warnings you must launch shellcheck using `-x` argument to follow source files and from the directory where `getAir2U.sh` is. For example: `~# cd /path/to/getAir2U && shellcheck -x getAir2U.sh`
6. Increase the version numbers in `getAir2U.sh`, in [Readme] and in [Changelog] to the new version that the script represents. The versioning scheme we use is *X.YZ*. Where:
  - *X* is a major release with a new menu (e.g. WPS menu)
  - *Y* is a minor release with a new feature for an existing menu or a new submenu for an existing feature
  - *Z* is a minor release with new bug fixes, small modifications or code improvements
7. Split your commits into parts. Each part represents a unique change on files.
8. Direct push to [Master] is not allowed. Pull Requests to [Master] are not allowed. Should be done over [Dev] or any other branch. They require revision and approvement. Read the git workflow policy first. 
9. All the development and coding must be in English.

*Be sure to merge the latest from "upstream" before submitting a pull request!*

#### For plugins development:

1. Read carefully the [Wiki Plugins Development Section].
2. Plugins Pull Requests will never be accepted. Plugins MUST be external to this repository.
3. Develop your plugin following the guidelines and using the plugin template to keep the needed structure.
4. If you want to add your plugin to [Wiki Plugins Hall of Fame Section], follow the instructions explained there. Don't open an issue.

We also have a private Telegram group for *trusted collaborators* for more agile discussion about developments, improvements, etc. 
To be added on it you must prove first you are a *trusted collaborator* with your contributions.
Anything can be also discussed on public [IRC] or [Discord] channel. More info at [Wiki Contact Section].

## WPS PIN Database Collaborators

1. Send MAC of the BSSID and the default PIN to [aditya.funs.11@gmail.com]. If you are going to push directly into the repository, keep reading the next points.
2. Add PINs ordered by the key in the associative array located in the `known_pins.db` file. (Keys are the first 6 BSSID digits).
3. Update the `pindb_checksum.txt` file with the calculated checksum of the already modified database file using `md5sum` tool.
4. Update the date under shebang.

*PINs should be from devices that generate generic ones.*

## Beta Testers

1. Download the main version from the [Master] branch or the beta testing version from the development branch called [Dev]. Temporary branches may be existing for specific features that can also be tested.
2. Report any issues or bugs by Instagram at [@Pratik_Senpai], mail [aditya.funs.11@gmail.com], on [IRC] or [Discord] channel or submit Github issue requests [Here] reading first the Issue Creation Policy.

## Git Workflow Policy

1. Direct push to [Master] is not allowed.
2. Pull Requests to [Master] are not allowed.
3. Usually, commits and pull requests should be done on [Dev] branch. If you have any doubt, don't hesitate to ask first.
4. Temporary branches may be existing for specific features, be pretty sure that the branch you are going to commit on is the right one. Ask first if you have any doubt.
5. Any branch will be finally merged to [Dev], there it will be reviewed and tested deeply before being merged to [Master].
6. All merges from [Dev] to [Master] are a new `getAir2U` release. This merges to [Master] will be performed and reviewed exclusively by [v1s1t0r]/[Pratik_Senpai].

---

## Donate

If you enjoyed the script, feel free to donate. Support the project through Paypal or sending a fraction any of these cryptocurrencies. Any amount, not matter how small (1, 2, 5 $/€) is welcome:

<table>
  <tr>
    <td>
      <b>Paypal</b>: <em>aditya.funs.11#64;gmail.com</em> <br/>
      <b>Bitcoin</b>: <em>1NSzwqtBBdo4CrvynPZmd85xfbL7hw3Ptu</em> <br/>
      <b>Bitcoin Cash</b>: <em>1GyUesBgwHKZBeFvkT5nfteecPdH6bAEaL</em> <br/>
      <b>Dash</b>: <em>XgKL8GTsdKAL2fypiMRFFL8m4wWTm1Netn</em> <br/>
      <b>Ethereum</b>: <em>0xf88107ba5e10776a37ec089a7ed2bac57638eea7</em> <br/>
      <b>Litecoin</b>: <em>LX1ytoQhRzUAuArpkNRjnfTmwYuxxJezTn</em> <br/>
      <b>ZCash</b>: <em>t1dt1ZDCgDUt9pqnyzkZd9GE2NpZBfMVsXq</em>
    </td>
  </tr>
</table>

<br/>

<div align="center">
    <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=7ELM486P7XKKG"><img src="https://raw.githubusercontent.com/v1s1t0r999/getAir2U/master/imgs/banners/paypal_donate.png" alt="Paypal" title="Paypal"/></a>
    <a href="https://www.buymeacoffee.com/v1s1t0r999"><img src="https://raw.githubusercontent.com/v1s1t0r999/getAir2U/master/imgs/banners/buymeacoffee.png" alt="Buy me a coffee" title="Buy me a coffee"/></a>
</div>

<br/>

<div align="center">
  <table>
    <tr>
      <td>
        Bitcoin QR code:
      </td>
      <td>
        Bitcoin Cash QR code:
      </td>
      <td>
        Dash QR code:
      </td>
    </tr>
    <tr>
      <td>
        <img src="https://raw.githubusercontent.com/v1s1t0r999/getAir2U/master/imgs/banners/bitcoin_qr.png" alt="Bitcoin" title="Bitcoin"/>
      </td>
      <td>
        <img src="https://raw.githubusercontent.com/v1s1t0r999/getAir2U/master/imgs/banners/bitcoincash_qr.png" alt="Bitcoin Cash" title="Bitcoin Cash"/>
      </td>
      <td>
        <img src="https://raw.githubusercontent.com/v1s1t0r999/getAir2U/master/imgs/banners/dash_qr.png" alt="Dash" title="Dash"/>
      </td>
    </tr>
    <tr>
      <td>
        Ethereum QR code:
      </td>
      <td>
        Litecoin QR code:
      </td>
      <td>
        ZCash QR code:
      </td>
    </tr>
    <tr>
      <td>
        <img src="https://raw.githubusercontent.com/v1s1t0r999/getAir2U/master/imgs/banners/ethereum_qr.png" alt="Ethereum" title="Ethereum"/>
      </td>
      <td>
        <img src="https://raw.githubusercontent.com/v1s1t0r999/getAir2U/master/imgs/banners/litecoin_qr.png" alt="Litecoin" title="Litecoin"/>
      </td>
      <td>
        <img src="https://raw.githubusercontent.com/v1s1t0r999/getAir2U/master/imgs/banners/zcash_qr.png" alt="ZCash" title="ZCash"/>
      </td>
    </tr>
  </table>
</div>

<!-- MDs -->
[Readme]: README.md
[Changelog]: CHANGELOG.md
[Code of Conduct]: CODE_OF_CONDUCT.md

<!-- Github -->
[Shellcheck]: https://github.com/koalaman/shellcheck "shellcheck.hs"
[Here]: https://github.com/v1s1t0r999/getAir2U/issues/new/choose
[Master]: https://github.com/v1s1t0r999/getAir2U/tree/master
[Dev]: https://github.com/v1s1t0r999/getAir2U/tree/dev
[xtonousou]: https://github.com/xtonousou "xT"
[v1s1t0r]: https://github.com/v1s1t0r999
[Pratik_Senpai]: https://github.com/Pratik_Senpai
[Wiki Contact Section]: https://github.com/v1s1t0r999/getAir2U/wiki/Contact
[Wiki Plugins Development Section]: https://github.com/v1s1t0r999/getAir2U/wiki/Plugins%20Development
[Wiki Plugins Hall of Fame Section]: https://github.com/v1s1t0r999/getAir2U/wiki/Plugins%20Hall%20of%20Fame

<!-- Other -->
[@Pratik_Senpai]: https://Instagram.com/Pratik_Senpai
[Discord]: https://discord.gg/sQ9dgt9
[IRC]: https://webchat.freenode.net/
