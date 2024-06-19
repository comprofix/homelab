![Header Image](https://miro.medium.com/v2/resize:fit:4000/1*16DgdobhWUUXKzF4fwjOdw.png)

<div align = "center">

# Homelab

Homelab deployed as Infrastructure as Code (IaC) using ansible and terraform. Using Gitea Actions and Renovate bot for CI/CD to keep containers updated.
</div>


[![deploy-containers](https://gitea.comprofix.com/mmckinnon/homelab/actions/workflows/deploy-containers.yml/badge.svg)](https://gitea.comprofix.com/mmckinnon/homelab/actions)

<div align="center">

| Hypervisor | OS | Tools | Firewall |
|---|---|---|---|
| [![Proxmox](https://img.shields.io/badge/-Proxmox-%23c9d1d9?logo=Proxmox)](https://www.proxmox.com) | [![Debian](https://img.shields.io/badge/Debian-%23c9d1d9?&logo=Debian&logoColor=red)](https://www.debian.org/releases/stable/) | [![Gitea](https://img.shields.io/badge/gitea-%23c9d1d9?logo=gitea&logoColor=green)](https://about.gitea.com/) [![Docker](https://img.shields.io/badge/-Docker-%23c9d1d9?logo=docker)](https://www.docker.com/) | [![pfSense](https://img.shields.io/badge/-pfSense-%23c9d1d9?logo=pfsense&logoColor=blue)](https://www.pfsense.org/)


</div>

<div align="center">

## Apps in Repo:

<table>
    <tr>
        <th>Logo</th>
        <th>Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://www.vectorlogo.zone/logos/letsencrypt/letsencrypt-icon.svg"></td>
        <td><a href="https://certbot.eff.org/">Certbot</a></td>
        <td>Used to generate Let's Encrypt Certificates</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://code.visualstudio.com/assets/images/code-stable.png"></td>
        <td><a href="https://github.com/coder/code-server">codeserver</a></td>
        <td>Run VS Code on any machine anywhere and access it in the browser</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/amir20/dozzle/master/assets/favicon.svg"></td>
        <td><a href="https://dozzle.dev">dozzle</a></td>
        <td>Real-time logging and monitoring for Docker in the browser</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/go-gitea/gitea/main/assets/logo.svg"></td>
        <td><a href="https://docs.gitea.com/category/installation">Gitea</a></td>
        <td>Self-Hosted Git Service</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/go-gitea/gitea/main/assets/logo.svg"></td>
        <td><a href="https://docs.gitea.com/usage/actions/act-runner">Act Runner (Gitea Runner)</a></td>
        <td>Self-Hosted Runner Service</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/thomiceli/opengist/a9dd531f676d01b93bb6bd70751a69382ca563b0/public/opengist.svg"></td>
        <td><a href="https://github.com/thomiceli/opengist">Opengist</a></td>
        <td>Opengist is a self-hosted pastebin powered by Git</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/main/png/homepage.png"></td>
        <td><a href="https://gethomepage.dev/latest/">Homepage</a></td>
        <td>A modern, fully static, fast, secure fully proxied, highly customizable application dashboard with integrations for over 100 services and translations into multiple languages. Easily configured via YAML files or through docker label discovery</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/invoiceninja.svg"></td>
        <td><a href="https://invoiceninja.com/">Invoice Ninja</a></td>
        <td>Free Invoicing Software for Small Businesses</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/jellyfin.svg"></td>
        <td><a href="https://jellyfin.org/">Jellyfin</a></td>
        <td>Jellyfin is a Free Software Media System that puts you in control of managing and streaming your media.</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/jellyseerr.svg"></td>
        <td><a href="https://github.com/Fallenbagel/jellyseerr">Jellyseerr</a></td>
        <td>Jellyseerr is a free and open source software application for managing requests for your media library.</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/lidarr.svg"></td>
        <td><a href="https://lidarr.audio/">Lidarr</a></td>
        <td>Lidarr is a music collection manager for Usenet and BitTorrent users. </td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/mariadb.svg"></td>
        <td><a href="https://mariadb.org/">MariaDB</a></td>
        <td>MariaDB Server is one of the most popular open source relational databases. It’s made by the original developers of MySQL and guaranteed to stay open source.</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/mealie.svg"></td>
        <td><a href="https://mealie.io">Mealie</a></td>
        <td>Mealie is an intuitive and easy to use recipe management app.</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/osticket.svg"></td>
        <td><a href="https://osticket.com/">osTicket</a></td>
        <td>osTicket is a widely used and trusted open source support ticketing system.</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/planka.svg"></td>
        <td><a href="https://planka.app/">Planka</a></td>
        <td>Elegant open source project tracking</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/portainer.svg"></td>
        <td><a href="https://portainer.io/">Portainer</a></td>
        <td>Portainer is your container management software</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/postgres.svg"></td>
        <td><a href="https://portainer.io/">PostgreSQL</a></td>
        <td>PostgreSQL, also known as Postgres, is a free and open-source relational database management system emphasizing extensibility and SQL compliance</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/privatebin.svg"></td>
        <td><a href="https://privatebin.info/">Privatebin</a></td>
        <td>PrivateBin is a minimalist, open source online pastebin where the server has zero knowledge of pasted data.</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/prowlarr.svg"></td>
        <td><a href="https://github.com/Prowlarr/Prowlarr">Prowlarr</a></td>
        <td>Prowlarr supports management of both Torrent Trackers and Usenet Indexers.</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://icons.veryicon.com/png/o/miscellaneous/cookd-pc/kms-management.png"></td>
        <td><a href="https://github.com/Py-KMS-Organization/py-kms">py-kms</a></td>
        <td>KMS activates Microsoft products on a local network, eliminating the need for individual computers to connect to Microsoft.</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/qbittorrent.svg"></td>
        <td><a href="https://qbittorrent.org">qBittorrent</a></td>
        <td>qBittorrent is a cross-platform free and open-source BitTorrent client </td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/radarr.svg"></td>
        <td><a href="https://radarr.video">Radarr</a></td>
        <td>Radarr is a movie collection manager for Usenet and BitTorrent users.</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/readarr.svg"></td>
        <td><a href="https://readarr.com">Readarr</a></td>
        <td>Readarr is a ebook collection manager for Usenet and BitTorrent users. </td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/sabnzbd.svg"></td>
        <td><a href="https://sabnzbd.com">Sabnzbd</a></td>
        <td>Free and easy binary newsreader</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/sonarr.svg"></td>
        <td><a href="https://sonarr.tv">Sonarr</a></td>
        <td>Sonarr is a PVR for Usenet and BitTorrent users.</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/speedtest-tracker-logo.png"></td>
        <td><a href="https://sonarr.tv">Speedtest-Tracker</a></td>
        <td>Speedtest-tracker is a self-hosted internet performance tracking application that runs speedtest checks against Ookla's Speedtest service.</td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/stirling-pdf.svg"></td>
        <td><a href="https://github.com/Stirling-Tools/Stirling-PDF">Stirling-PDF</a></td>
        <td>This is a robust, locally hosted web-based PDF manipulation tool using Docker. </td>
    </tr>
    <tr>
        <td><img vertical-align=baseline width="32" src="https://raw.githubusercontent.com/walkxcode/dashboard-icons/dd34fba44b97d3d5753dda032487890cb6fa5879/svg/vaultwarden.svg"></td>
        <td><a href="https://github.com/dani-garcia/vaultwarden">Vaultwarden</a></td>
        <td>Self-Hosted implementation of the Bitwarden server API written in Rust and compatible with upstream Bitwarden clients</td>
    </tr>

</div>   