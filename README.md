# getAir2U(UC) [![Version-shield]](https://raw.githubusercontent.com/v1s1t0r999/getAir2U/main/CHANGELOG.md) [![Bash4.2-shield]](http://tldp.org/LDP/abs/html/bashver4.html#AEN21220) [![License-shield]](https://raw.githubusercontent.com/v1s1t0r999/getAir2U/main/LICENSE.md) [![Docker-shield]](https://hub.docker.com/r/v1s1t0r999/getair2u.dockerfile/)
[![Paypal-shield]](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=7ELM486P7XKKG) [![Cryptocurrencies-shield]](https://github.com/v1s1t0r999/getAir2U/wiki/Contributing-&-Code-of-Conduct)


> The latest linux script to hack wireless network.

![Banner]

---

Welcome to getAir2U's wiki. Below is all the information you'll ever need

- *I. Content & Features*
  - [Home]
  - [Features]


- *II. Requirements*
  - [Requirements]
  - [Compatibility]
	 - [Cards and Chipsets]
	 - [Wayland]
	 - [Consistent Network Device Naming]
	 - [Kali Nethunter]
  - [Essential Tools]
  - [Optional Tools]
	 - [BeEF Tips]
	 - [Hashcat Tips]
	 - [Bettercap Tips]
  - [Update Tools]
  - [Internal Tools]
  - [Known incompatibilities]


- *III. Getting started*
  - [Installation & Usage]
  - [Options]
  - [Docker]
	 - [Linux]
	 - [Mac OSX]
	 - [Windows]
  - [Other Sources]
  - [FAQ & Troubleshooting]


- *IV. Project & Development*
  - [Plugins system]
	 - [Plugins development]
	 - [Plugins Hall of Fame]
  - [Supported Languages]
  - [Contributing & Code of Conduct]
  - [Changelog]
  - [Disclaimer & License]
  - [Contact]


- *V. Acknowledgments & References*
  - [Hat Tip To]
  - [Inspiration]

---

![Hits-badge]

[Banner]: https://github.com/v1s1t0r999/getAir2U/blob/main/imgs/icons/getAir2U_LOGO.png
[Github's Wiki]: https://github.com/v1s1t0r999/getAir2U/wiki

[Home]: https://github.com/v1s1t0r999/getAir2U/wiki
[Features]: https://github.com/v1s1t0r999/getAir2U/wiki/Features
[Screenshots]: https://github.com/v1s1t0r999/getAir2U/wiki/Screenshots
[Wallpapers]: https://github.com/v1s1t0r999/getAir2U/wiki/Wallpapers
[Requirements]: https://github.com/v1s1t0r999/getAir2U/wiki/Requirements
[Compatibility]: https://github.com/v1s1t0r999/getAir2U/wiki/Compatibility
[Cards and Chipsets]: https://github.com/v1s1t0r999/getAir2U/wiki/Cards%20and%20Chipsets
[Wayland]: https://github.com/v1s1t0r999/getAir2U/wiki/Wayland
[Consistent Network Device Naming]: https://github.com/v1s1t0r999/getAir2U/wiki/Consistent%20Network%20Device%20Naming
[Kali Nethunter]: https://github.com/v1s1t0r999/getAir2U/wiki/Kali%20Nethunter
[Essential Tools]: https://github.com/v1s1t0r999/getAir2U/wiki/Essential%20Tools
[Optional Tools]: https://github.com/v1s1t0r999/getAir2U/wiki/Optional%20Tools
[BeEF Tips]: https://github.com/v1s1t0r999/getAir2U/wiki/BeEF%20Tips
[Hashcat Tips]: https://github.com/v1s1t0r999/getAir2U/wiki/Hashcat%20Tips
[Bettercap Tips]: https://github.com/v1s1t0r999/getAir2U/wiki/Bettercap%20Tips
[Update Tools]: https://github.com/v1s1t0r999/getAir2U/wiki/Update%20Tools
[Internal Tools]: https://github.com/v1s1t0r999/getAir2U/wiki/Internal%20Tools
[Known incompatibilities]: https://github.com/v1s1t0r999/getAir2U/wiki/Known%20incompatibilities
[Installation & Usage]: https://github.com/v1s1t0r999/getAir2U/wiki/Installation%20&%20Usage
[Options]: https://github.com/v1s1t0r999/getAir2U/wiki/Options
[Docker]: https://github.com/v1s1t0r999/getAir2U/wiki/Docker
[Linux]: https://github.com/v1s1t0r999/getAir2U/wiki/Docker%20Linux
[Mac OSX]: https://github.com/v1s1t0r999/getAir2U/wiki/Docker%20Mac%20OSX
[Windows]: https://github.com/v1s1t0r999/getAir2U/wiki/Docker%20Windows
[Other Sources]: https://github.com/v1s1t0r999/getAir2U/wiki/Other%20Sources
[FAQ & Troubleshooting]: https://github.com/v1s1t0r999/getAir2U/wiki/FAQ%20&%20Troubleshooting
[Plugins system]: https://github.com/v1s1t0r999/getAir2U/wiki/Plugins%20System
[Plugins development]: https://github.com/v1s1t0r999/getAir2U/wiki/Plugins%20Development
[Plugins Hall of Fame]: https://github.com/v1s1t0r999/getAir2U/wiki/Plugins%20Hall%20of%20Fame
[Supported Languages]: https://github.com/v1s1t0r999/getAir2U/wiki/Supported%20Languages
[Contributing & Code of Conduct]: https://github.com/v1s1t0r999/getAir2U/wiki/Contributing-&-Code-of-Conduct
[Changelog]: https://github.com/v1s1t0r999/getAir2U/wiki/Changelog
[Disclaimer & License]: https://github.com/v1s1t0r999/getAir2U/wiki/Disclaimer%20&%20License
[Contact]: https://github.com/v1s1t0r999/getAir2U/wiki/Contact
[Hat Tip To]: https://github.com/v1s1t0r999/getAir2U/wiki/Hat%20Tip%20To
[Inspiration]: https://github.com/v1s1t0r999/getAir2U/wiki/Inspiration

[Version-shield]: https://img.shields.io/badge/version-1.0.0-blue.svg?style=flat-square&colorA=273133&colorB=0093ee "Latest version"
[Bash4.2-shield]: https://img.shields.io/badge/bash-4.2%2B-blue.svg?style=flat-square&colorA=273133&colorB=00db00 "Bash >=4.2"
[License-shield]: https://img.shields.io/badge/license-GPL%20v3%2B-blue.svg?style=flat-square&colorA=273133&colorB=bd0000 "GPL v3+"
[Docker-shield]: https://img.shields.io/docker/cloud/automated/v1s1t0r999/getAir2U.svg?style=flat-square&colorA=273133&colorB=a9a9a9 "Docker rules!"
[Paypal-shield]: https://img.shields.io/badge/donate-paypal-blue.svg?style=flat-square&colorA=273133&colorB=b008bb "Paypal"
[Cryptocurrencies-shield]: https://img.shields.io/badge/donate-cryptocurrencies-blue.svg?style=flat-square&colorA=273133&colorB=f7931a "Cryptocurrencies"

[Hits-badge]: https://hitcounter.pythonanywhere.com/count/tag.svg?url=https%3A%2F%2Fgithub.com%2Fv1s1t0r999%2FgetAir2U "v1s1t0rs"

