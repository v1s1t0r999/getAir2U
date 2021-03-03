#!/usr/bin/env bash

#Global shellcheck disabled warnings
#shellcheck disable=SC2034

plugin_name="Missing dependencies auto-installation"
plugin_description="A plugin to autoinstall missing dependencies on some Operating Systems (Kali, Parrot, BlackArch)"
plugin_author="v1s1t0r"

plugin_enabled=1

plugin_minimum_ag_affected_version="10.0"
plugin_maximum_ag_affected_version=""
plugin_distros_supported=("Kali" "Parrot" "BlackArch")

#Custom function. Create the correspondence between commands and packages for each supported distro
#shellcheck disable=SC2154
function commands_to_packages() {

	local missing_commands_string_clean
	missing_commands_string_clean="${1#${1%%[![:space:]]*}}"

	declare -A commands_to_packages_correspondence

	case "${distro}" in
		"Kali"|"Parrot")
			commands_to_packages_correspondence["hcxpcapngtool"]="hcxtools"
			commands_to_packages_correspondence["hcxdumptool"]="hcxdumptool"
			commands_to_packages_correspondence["iw"]="iw"
			commands_to_packages_correspondence["awk"]="gawk"
			commands_to_packages_correspondence["airmon-ng"]="aircrack-ng"
			commands_to_packages_correspondence["airodump-ng"]="aircrack-ng"
			commands_to_packages_correspondence["aircrack-ng"]="aircrack-ng"
			commands_to_packages_correspondence["xterm"]="xterm"
			commands_to_packages_correspondence["tmux"]="tmux"
			commands_to_packages_correspondence["ip"]="iproute2"
			commands_to_packages_correspondence["lspci"]="pciutils"
			commands_to_packages_correspondence["ps"]="procps"
			commands_to_packages_correspondence["wpaclean"]="aircrack-ng"
			commands_to_packages_correspondence["crunch"]="crunch"
			commands_to_packages_correspondence["aireplay-ng"]="aircrack-ng"
			commands_to_packages_correspondence["mdk3"]="mdk3"
			commands_to_packages_correspondence["mdk4"]="mdk4"
			commands_to_packages_correspondence["hashcat"]="hashcat"
			commands_to_packages_correspondence["hostapd"]="hostapd"
			commands_to_packages_correspondence["dhcpd"]="isc-dhcp-server"
			commands_to_packages_correspondence["nft"]="nftables"
			commands_to_packages_correspondence["iptables"]="iptables"
			commands_to_packages_correspondence["ettercap"]="ettercap-text-only"
			commands_to_packages_correspondence["etterlog"]="ettercap-text-only"
			commands_to_packages_correspondence["lighttpd"]="lighttpd"
			commands_to_packages_correspondence["dnsspoof"]="dsniff"
			commands_to_packages_correspondence["wash"]="reaver"
			commands_to_packages_correspondence["reaver"]="reaver"
			commands_to_packages_correspondence["bully"]="bully"
			commands_to_packages_correspondence["pixiewps"]="pixiewps"
			commands_to_packages_correspondence["bettercap"]="bettercap"
			commands_to_packages_correspondence["beef-xss"]="beef-xss"
			commands_to_packages_correspondence["packetforge-ng"]="aircrack-ng"
			commands_to_packages_correspondence["hostapd-wpe"]="hostapd-wpe"
			commands_to_packages_correspondence["asleap"]="asleap"
			commands_to_packages_correspondence["john"]="john"
			commands_to_packages_correspondence["openssl"]="openssl"
			commands_to_packages_correspondence["tshark"]="tshark"
			commands_to_packages_correspondence["xdpyinfo"]="x11-utils"
			commands_to_packages_correspondence["ethtool"]="ethtool"
			commands_to_packages_correspondence["lsusb"]="usbutils"
			commands_to_packages_correspondence["rfkill"]="rfkill"
			commands_to_packages_correspondence["wget"]="wget"
			commands_to_packages_correspondence["ccze"]="ccze"
			commands_to_packages_correspondence["xset"]="x11-xserver-utils"
		;;
		"BlackArch")
			commands_to_packages_correspondence["hcxpcapngtool"]="hcxtools"
			commands_to_packages_correspondence["hcxdumptool"]="hcxdumptool"
			commands_to_packages_correspondence["iw"]="iw"
			commands_to_packages_correspondence["awk"]="gawk"
			commands_to_packages_correspondence["airmon-ng"]="aircrack-ng"
			commands_to_packages_correspondence["airodump-ng"]="aircrack-ng"
			commands_to_packages_correspondence["aircrack-ng"]="aircrack-ng"
			commands_to_packages_correspondence["xterm"]="xterm"
			commands_to_packages_correspondence["tmux"]="tmux"
			commands_to_packages_correspondence["ip"]="iproute2"
			commands_to_packages_correspondence["lspci"]="pciutils"
			commands_to_packages_correspondence["ps"]="procps-ng"
			commands_to_packages_correspondence["wpaclean"]="aircrack-ng"
			commands_to_packages_correspondence["crunch"]="crunch"
			commands_to_packages_correspondence["aireplay-ng"]="aircrack-ng"
			commands_to_packages_correspondence["mdk3"]="mdk3"
			commands_to_packages_correspondence["mdk4"]="mdk4"
			commands_to_packages_correspondence["hashcat"]="hashcat"
			commands_to_packages_correspondence["hostapd"]="hostapd"
			commands_to_packages_correspondence["dhcpd"]="dhcp"
			commands_to_packages_correspondence["nft"]="nftables"
			commands_to_packages_correspondence["iptables"]="iptables"
			commands_to_packages_correspondence["ettercap"]="ettercap"
			commands_to_packages_correspondence["etterlog"]="ettercap"
			commands_to_packages_correspondence["lighttpd"]="lighttpd"
			commands_to_packages_correspondence["dnsspoof"]="dsniff"
			commands_to_packages_correspondence["wash"]="reaver"
			commands_to_packages_correspondence["reaver"]="reaver"
			commands_to_packages_correspondence["bully"]="bully"
			commands_to_packages_correspondence["pixiewps"]="pixiewps"
			commands_to_packages_correspondence["bettercap"]="bettercap"
			commands_to_packages_correspondence["beef"]="beef"
			commands_to_packages_correspondence["packetforge-ng"]="aircrack-ng"
			commands_to_packages_correspondence["hostapd-wpe"]="hostapd-wpe"
			commands_to_packages_correspondence["asleap"]="asleap"
			commands_to_packages_correspondence["john"]="john"
			commands_to_packages_correspondence["openssl"]="openssl"
			commands_to_packages_correspondence["tshark"]="wireshark-cli"
			commands_to_packages_correspondence["xdpyinfo"]="xorg-xdpyinfo"
			commands_to_packages_correspondence["ethtool"]="ethtool"
			commands_to_packages_correspondence["lsusb"]="usbutils"
			commands_to_packages_correspondence["rfkill"]="rfkill"
			commands_to_packages_correspondence["wget"]="wget"
			commands_to_packages_correspondence["ccze"]="ccze"
			commands_to_packages_correspondence["xset"]="xorg-xset"
		;;
	esac

	local missing_packages_string=""
	IFS=' ' read -r -a missing_commands_array <<< "${missing_commands_string_clean}"
	for item in "${missing_commands_array[@]}"; do
		missing_packages_string+=" ${commands_to_packages_correspondence[${item}]}"
	done

	missing_packages_string_clean="${missing_packages_string#${missing_packages_string%%[![:space:]]*}}"
}

#Custom function. Create text messages to be used in missing dependencies plugin
#shellcheck disable=SC2154
function missing_dependencies_text() {

	arr["ENGLISH","missing_dependencies_1"]="\${blue_color}Even with the \${normal_color}AIRGEDDON_SILENT_CHECKS\${blue_color} option enabled, airgeddon has detected that you are missing some dependencies due to the auto install missing dependencies plugin. \${green_color}Do you want to proceed with the automatic installation? \${normal_color}\${visual_choice}"
	arr["SPANISH","missing_dependencies_1"]="\${blue_color}Incluso con la opción \${normal_color}AIRGEDDON_SILENT_CHECKS\${blue_color} habilitado, debido al plugin de auto instalación de dependencias airgeddon ha detectado que faltan algunas. \${green_color}¿Quieres proceder con la instalación automática? \${normal_color}\${visual_choice}"
	arr["FRENCH","missing_dependencies_1"]="\${blue_color}Même si l'option \${normal_color}AIRGEDDON_SILENT_CHECKS\${blue_color} est activé, en raison du plugin d'installation automatique des dépendances d'airgeddon, certaines manquent. \${green_color}Voulez-vous procéder à l'installation automatique? \${normal_color}\${visual_choice}"
	arr["CATALAN","missing_dependencies_1"]="\${blue_color}Fins i tot amb l'opció habilitada \${normal_color}AIRGEDDON_SILENT_CHECKS\${blue_color}, a causa del plugin d'acte instal·lació de dependències airgeddon ha detectat que falten algunes. \${green_color}Vols procedir amb la instal·lació automàtica? \${normal_color}\${visual_choice}"
	arr["PORTUGUESE","missing_dependencies_1"]="\${blue_color}Mesmo com a opção \${normal_color}AIRGEDDON_SILENT_CHECKS\${blue_color} habilitada, airgeddon detectou algumas ausentes devido ao plugin de instalação automática de dependências. \${green_color}Você quer prosseguir com a instalação automática? \${normal_color}\${visual_choice}"
	arr["RUSSIAN","missing_dependencies_1"]="\${blue_color}Даже при включённой опции \${normal_color}AIRGEDDON_SILENT_CHECKS\${blue_color}, airgeddon с помощью плагина auto install missing dependencies (автоматическая установка отсутствующих зависимостей) обнаружил, что вам не хватает некоторых зависимостей. \${green_color}Вы хотите продолжить автоматическую установку? \${normal_color}\${visual_choice}"
	arr["GREEK","missing_dependencies_1"]="\${blue_color}Ακόμα και με ενεργοποιημένη την επιλογή \${normal_color}AIRGEDDON_SILENT_CHECKS\${blue_color}, το airgeddon εντόπισε ότι σας λείπουν κάποια dependencies λόγω της αυτόματης εγκατάστασης του missing dependencies plugin. \${green_color}Θέλετε να συνεχίσετε με την αυτόματη εγκατάσταση; \${normal_color}\${visual_choice}"
	arr["ITALIAN","missing_dependencies_1"]="\${blue_color}Anche con l'opzione abilitata \${normal_color}AIRGEDDON_SILENT_CHECKS\${blue_color} abilitata, a causa del plugin di installazione automatica delle dipendenze, airgeddon ha rilevato che mancano alcune. \${green_color}Vuoi procedere con l'installazione automatica? \${normal_color}\${visual_choice}"
	arr["POLISH","missing_dependencies_1"]="\${blue_color}Nawet z włączoną opcją \${normal_color}AIRGEDDON_SILENT_CHECKS\${blue_color} airgeddon wykrył przy pomocy wtyczki automatyczne instalacji brakujących zależności. \${green_color}Chcesz przystąpić do automatycznej instalacji? \${normal_color}\${visual_choice}"
	arr["GERMAN","missing_dependencies_1"]="\${blue_color}Auch wenn die \${normal_color}AIRGEDDON_SILENT_CHECKS\${blue_color} Option aktiviert ist, hat airgeddon bemerkt, dass einige Abhängigkeiten fehlen aufgrund der automatischen Installation fehlenden Abhängigkeiten Plugin. \${green_color}Möchten Sie mit der automatischen Installation fortfahren? \${normal_color}\${visual_choice}"
	arr["TURKISH","missing_dependencies_1"]="\${normal_color}AIRGEDDON_SILENT_CHECKS\${blue_color} seçeneği etkin olsa bile, airgeddon bağımlılıkları eklentisi eksik nedeniyle otomatik bazı bağımlılıkları eksik olduğunu install algıladı. \${green_color}Otomatik yükleme ile devam etmek istiyor musunuz? \${normal_color}\${visual_choice}"

	arr["ENGLISH","missing_dependencies_2"]="\${blue_color}Due to the auto install missing dependencies plugin, airgeddon could try to install the necessary missing packages. \${green_color}Do you want to proceed with the automatic installation? \${normal_color}\${visual_choice}"
	arr["SPANISH","missing_dependencies_2"]="\${blue_color}Debido al plugin de auto instalación de dependencias, airgeddon podría intentar instalar los paquetes necesarios que faltan. \${green_color}¿Quieres proceder con la instalación automática? \${normal_color}\${visual_choice}"
	arr["FRENCH","missing_dependencies_2"]="\${blue_color}En raison du plugin d'installation automatique des dependances, airgeddon pourrait essayer d'installer les logiciels manquants nécessaires. \${green_color}Voulez-vous procéder à l'installation automatique? \${normal_color}\${visual_choice}"
	arr["CATALAN","missing_dependencies_2"]="\${blue_color}A causa del plugin d'acte instal·lació de dependències, airgeddon podria intentar instal·lar els paquets necessaris que falten. \${green_color}Vols procedir amb la instal·lació automàtica? \${normal_color}\${visual_choice}"
	arr["PORTUGUESE","missing_dependencies_2"]="\${blue_color}Devido ao plug-in de instalação automática de dependência, o airgeddon pode tentar instalar os pacotes ausentes necessários. \${green_color}Você quer prosseguir com a instalação automática? \${normal_color}\${visual_choice}"
	arr["RUSSIAN","missing_dependencies_2"]="\${blue_color}Благодаря плагину auto install missing dependencies (автоматическая установка отсутствующих зависимостей) airgeddon может попытаться установить необходимые недостающие пакеты. \${green_color}Вы хотите продолжить автоматическую установку? \${normal_color}\${visual_choice}"
	arr["GREEK","missing_dependencies_2"]="\${blue_color}Λόγω της αυτόματης εγκατάστασης του missing dependencies plugin, το airgeddon θα μπορούσε να προσπαθήσει να εγκαταστήσει τα απαραίτητα πακέτα που λείπουν. \${green_color}θέλετε να συνεχίσετε με την αυτόματη εγκατάσταση; \${normal_color}\${visual_choice}"
	arr["ITALIAN","missing_dependencies_2"]="\${blue_color}A causa del plugin di installazione automatica delle dipendenze, airgeddon potrebbe provare a installare i pacchetti mancanti necessari. \${green_color}Vuoi procedere con l'installazione automatica? \${normal_color}\${visual_choice}"
	arr["POLISH","missing_dependencies_2"]="\${blue_color}Z powodu wtyczki automatycznej instalacji zależności airgeddon może spróbować zainstalować niezbędne brakujące pakiety. \${green_color}Chcesz przystąpić do automatycznej instalacji? \${normal_color}\${visual_choice}"
	arr["GERMAN","missing_dependencies_2"]="\${blue_color}Mit dem Auto-Dependency-Installations-Plugin könnte airgeddon versuchen, die erforderlichen fehlenden Pakete zu installieren. \${green_color}Haben sie mit der automatischen installation fortfahren? \${normal_color}\${visual_choice}"
	arr["TURKISH","missing_dependencies_2"]="\${blue_color}Otomatik bağımlılık yükleme eklentisi nedeniyle, airgeddon gerekli eksik paketleri kurmayı deneyebilir. \${green_color}Otomatik yükleme ile devam etmek istiyor musunuz? \${normal_color}\${visual_choice}"

	arr["ENGLISH","missing_dependencies_3"]="Missing dependencies packages are trying to be installed. Please be patient..."
	arr["SPANISH","missing_dependencies_3"]="Se está intentando instalar los paquetes de las dependencias que faltaban. Por favor ten paciencia..."
	arr["FRENCH","missing_dependencies_3"]="On va essayez d'installer les dépendances des logiciels manquants. Soyez patients s'il vous plaît..."
	arr["CATALAN","missing_dependencies_3"]="S'està intentant instal·lar els paquets de les dependències que faltaven. Si us plau tinguis paciència..."
	arr["PORTUGUESE","missing_dependencies_3"]="Tentando instalar dependências ausentes dos pacotes. Por favor, seja paciente..."
	arr["RUSSIAN","missing_dependencies_3"]="Попытка установить пакеты отсутствующих зависимостей. Подождите немного..."
	arr["GREEK","missing_dependencies_3"]="Τα πακέτα με ελλειπής dependencies προσπαθούν να εγκατασταθούν. Παρακαλώ κάντε υπομονή..."
	arr["ITALIAN","missing_dependencies_3"]="Si sta cercando di installare le dipendenze dei pacchetti mancanti. Si prega di essere pazienti..."
	arr["POLISH","missing_dependencies_3"]="Próbujesz zainstalować pakiety brakujących zależności. Cierpliwości..."
	arr["GERMAN","missing_dependencies_3"]="Fehlende Pakete Abhängigkeiten werden installiert. Wir bitten um Geduld..."
	arr["TURKISH","missing_dependencies_3"]="Eksik paket bağımlılıklarını yüklemek için çalışıyoruz. Lütfen sabırlı olun..."

	arr["ENGLISH","missing_dependencies_4"]="Dependencies were successfully installed. Script can continue..."
	arr["SPANISH","missing_dependencies_4"]="Las dependencias se han instalado correctamente. El script puede continuar..."
	arr["FRENCH","missing_dependencies_4"]="Les dépendances ont etait correctement installés. Le script peut continuer..."
	arr["CATALAN","missing_dependencies_4"]="Les dependències s'han instal·lat correctament. El script pot continuar..."
	arr["PORTUGUESE","missing_dependencies_4"]="Dependências instaladas com sucesso. O script pode continuar..."
	arr["RUSSIAN","missing_dependencies_4"]="Зависимости установлены правильно. Скрипт может продолжать..."
	arr["GREEK","missing_dependencies_4"]="Τα dependencies εγκαταστάθηκαν με επιτυχία. Το script μπορεί να συνεχίσει..."
	arr["ITALIAN","missing_dependencies_4"]="Le dipendenze sono state installate correttamente. Lo script può continuare..."
	arr["POLISH","missing_dependencies_4"]="Zależności zostały zainstalowane prawidłowo. Skrypt może kontynuować..."
	arr["GERMAN","missing_dependencies_4"]="Abhängigkeiten werden erfolgreich installiert. Das Skript kann fortfahren..."
	arr["TURKISH","missing_dependencies_4"]="Bağımlılıklar düzgün bir şekilde yüklendi. Yazılım devam edebilir..."

	arr["ENGLISH","missing_dependencies_5"]="An error occurred while trying to install dependencies. This may be due to multiple causes. Make sure your internet connection is working. Anyway, you have installed all essential tools so you can continue. You'll miss only some features"
	arr["SPANISH","missing_dependencies_5"]="Ocurrió un error al intentar instalar las dependencias. Esto puede ser debido a múltiples causas. Asegúrate de que tu acceso a internet está operativo. De todas formas tienes instaladas las herramientas esenciales así que puedes continuar. Solo no podrás hacer uso de algunas funcionalidades"
	arr["FRENCH","missing_dependencies_5"]="Une erreur est survenue en essayant d'installer les dépendances. Cela peut être dû à des causes multiples. Assurez-vous que votre connexion internet fonctionne. De toute faiçon, vous avez installé tous les outils essentiels afin que vous puissiez continuer. Vous manquez seulement quelques fonctionnalités"
	arr["CATALAN","missing_dependencies_5"]="S'ha produït un error en intentar instal·lar les dependències. Això pot ser degut a múltiples causes. Assegura't que el teu accés a internet està operatiu. De totes maneres, ha instal·lat totes les eines essencials perquè pugui continuar. Es perdran només algunes de les característiques"
	arr["PORTUGUESE","missing_dependencies_5"]="Ocorreu um erro ao tentar instalar as dependências. Isto pode ter múltiplas causas. Certifique-se de sua conexão com a internet está funcionando. De qualquer forma, você possui todas as ferramentas essenciais para continuar, mas você não poderá usar alguns recursos."
	arr["RUSSIAN","missing_dependencies_5"]="Произошла ошибка при попытке установить зависимости. Это может быть связано с несколькими причинами. Убедитесь, что подключение к Интернету работает. Во всяком случае, вы установили все инструменты необходимые для базовой работы. Вам будут недоступны только некоторые функции"
	arr["GREEK","missing_dependencies_5"]="Παρουσιάστηκε σφάλμα κατά την προσπάθεια για την εγκατάσταση των dependencies. Αυτό μπορεί να οφείλεται σε πολλές αιτίες. Βεβαιωθείτε ότι η σύνδεσή σας στο internet λειτουργεί. Τέλος πάντων, έχετε εγκαταστήσει όλα τα απαραίτητα εργαλεία ώστε να μπορείτε να συνεχίσετε. Θα χάσετε μόνο μερικά features"
	arr["ITALIAN","missing_dependencies_5"]="Si è verificato un errore durante il tentativo di installare le dipendenze. Ciò può essere dovuto a molteplici cause. Assicurarsi che la connessione a internet stia funzionando. In ogni caso, sono stati installati tutti gli strumenti essenziali in modo da poter continuare. Solo non potrai usare alcune funzionalità"
	arr["POLISH","missing_dependencies_5"]="Wystąpił błąd podczas próby zainstalowania zależności. Może to być spowodowane wieloma przyczynami. Upewnij się, że połączenie internetowe działa. W każdym razie masz zainstalowane wszystkie niezbędne narzędzia, dzięki czemu można kontynuować. będziesz tęsknił tylko niektóre funkcje"
	arr["GERMAN","missing_dependencies_5"]="Fehler beim Versuch, Abhängigkeiten zu installieren. Dies kann mehrere Ursachen haben. Stellen Sie sicher, dass Ihre internetverbindung funktioniert. Doch Sie haben alle wichtigen Tools installiert, mit denen Sie fortfahren können. Sie vermissen nur einige Features"
	arr["TURKISH","missing_dependencies_5"]="Eksik paket bağımlılıklarını yüklemeye çalışırken bir hata oluştu. Bu farklı nedenlere bağlı olabilir. İnternet bağlantısının çalıştığından emin olun. Neyse, tüm gerekli araçları yüklediniz. Yalnızca bazı özellikler eksik"

	arr["ENGLISH","missing_dependencies_6"]="An error occurred while trying to install dependencies. This may be due to multiple causes. Make sure your internet connection is working. Script can't continue due the lack of some essential tools"
	arr["SPANISH","missing_dependencies_6"]="Ocurrió un error al intentar instalar las dependencias. Esto puede ser debido a múltiples causas. Asegúrate de que tu acceso a internet está operativo. El script no puede continuar debido a la falta de algunas herramientas esenciales"
	arr["FRENCH","missing_dependencies_6"]="Une erreur est survenue en essayant d'installer les dépendances. Cela peut être dû à des causes multiples. Assurez-vous que votre connexion internet fonctionne. Le script ne peut pas continuer car l'absence de certains outils essentiels"
	arr["CATALAN","missing_dependencies_6"]="S'ha produït un error en intentar instal·lar les dependències. Això pot ser degut a múltiples causes. Assegura't que el teu accés a internet està operatiu. Script no pot continuar a causa de la manca d'algunes eines essencials"
	arr["PORTUGUESE","missing_dependencies_6"]="Ocorreu um erro ao tentar instalar as dependências. Isto pode ter múltiplas causas. Certifique-se de sua conexão com a internet está funcionando. Script não pode continuar devido a falta de algumas ferramentas essenciais"
	arr["RUSSIAN","missing_dependencies_6"]="Произошла ошибка при попытке установить зависимости. Это может быть связано с несколькими причинами. Убедитесь, что подключение к Интернету работает. Скрипт не может продолжить работу из-за отсутствия некоторых необходимых инструментов"
	arr["GREEK","missing_dependencies_6"]="Παρουσιάστηκε σφάλμα κατά την προσπάθεια για την εγκατάσταση των dependencies. Αυτό μπορεί να οφείλεται σε πολλές αιτίες. Βεβαιωθείτε ότι η σύνδεσή σας στο internet λειτουργεί. Το script δεν μπορεί να συνεχιστεί λόγω έλλειψης κάποιων βασικών εργαλείων"
	arr["ITALIAN","missing_dependencies_6"]="Si è verificato un errore durante il tentativo di installare le dipendenze. Ciò può essere dovuto a molteplici cause. Assicurarsi che la connessione a internet stia funzionando. Lo script non può continuare a causa della mancanza di alcuni strumenti essenziali"
	arr["POLISH","missing_dependencies_6"]="Wystąpił błąd podczas próby zainstalowania zależności. Może to być spowodowane wieloma przyczynami. Upewnij się, czy połączenie internetowe działa. Skrypt nie może kontynuować z powodu braku pewnych podstawowych narzędzi"
	arr["GERMAN","missing_dependencies_6"]="Fehler beim Versuch, Abhängigkeiten zu installieren. Dies kann mehrere Ursachen haben. Stellen Sie sicher, dass Ihre internetverbindung funktioniert. Script kann wegen des Fehlens einiger wichtiger Tools nicht mehr weitermachen"
	arr["TURKISH","missing_dependencies_6"]="Eksik paket bağımlılıklarını yüklemeye çalışırken bir hata oluştu. Bu farklı nedenlere bağlı olabilir. İnternet bağlantısının çalıştığından emin olun. Script bazı temel araçların eksikliği nedeniyle devam edemiyor"
}

#Posthook for check_compatibity function to install missing dependencies
#shellcheck disable=SC2154,SC2086
function missing_dependencies_posthook_check_compatibility() {

	if [[ ${essential_toolsok} -ne 1 ]] || [[ ${optional_toolsok} -ne 1 ]] || [[ ${update_toolsok} -ne 1 ]]; then

		if "${AIRGEDDON_SILENT_CHECKS:-true}"; then
			ask_yesno "missing_dependencies_1" "yes"
		else
			ask_yesno "missing_dependencies_2" "yes"
		fi

		if [ "${yesno}" = "y" ]; then

			local missing_tools=()

			for item in "${!possible_package_names[@]}"; do
				if ! hash "${item}" 2> /dev/null || [[ "${item}" = "beef" ]]; then
					if [ "${item}" = "beef" ]; then
						case "${distro}" in
							"Kali"|"Parrot")
								if ! hash "beef-xss" 2> /dev/null; then
									missing_tools+=("beef-xss")
								fi
							;;
							"BlackArch")
								if ! hash "${item}" 2> /dev/null; then
									missing_tools+=("${item}")
								fi
							;;
						esac
					else
						missing_tools+=("${item}")
					fi
				fi
			done

			for item in "${internal_tools[@]}"; do
				if ! hash "${item}" 2> /dev/null; then
					missing_tools+=("${item}")
				fi
			done

			local missing_commands_string=""
			for item in "${missing_tools[@]}"; do
				missing_commands_string+=" ${item}"
			done

			commands_to_packages "${missing_commands_string}"

			echo
			language_strings "${language}" "missing_dependencies_3" "blue"
			echo

			local resultok=1
			case "${distro}" in
				"Kali"|"Parrot")
					if [ -n "${missing_packages_string_clean}" ]; then
						if ! apt update > /dev/null 2>&1; then
							resultok=0
						else
							if ! apt -y install ${missing_packages_string_clean} > /dev/null 2>&1; then
								resultok=0
							fi
						fi
					fi
				;;
				"BlackArch")
					if ! pacman -Sy > /dev/null 2>&1 && pacman --noconfirm -S ${missing_packages_string_clean} > /dev/null 2>&1; then
						resultok=0
					fi
				;;
			esac

			if [ ${resultok} -eq 1 ]; then
				compatible=1
				update_toolsok=1
				for item in "${optional_tools_names[@]}"; do
					optional_tools[${item}]=1
				done
				language_strings "${language}" "missing_dependencies_4" "yellow"
			else
				if [ ${compatible} -eq 1 ]; then
					language_strings "${language}" "missing_dependencies_5" "yellow"
				else
					language_strings "${language}" "missing_dependencies_6" "red"
					language_strings "${language}" 115 "read"
				fi
			fi
		else
			if [ "${compatible}" -ne 1 ]; then
				exit_code=1
				exit_script_option
			fi
		fi
	fi
}

#Override read_yesno function to be able to print the question correctly
#shellcheck disable=SC2154
function missing_dependencies_override_read_yesno() {

	debug_print

	echo
	missing_dependencies_text

	language_strings "${language}" "${1}" "green"
	read -rp "> " yesno
}
