# 🧮 Invoice Ninja Add-on for Home Assistant

<img src="logo.png" />

Dieses Add-on ermöglicht es dir, **[Invoice Ninja](https://www.invoiceninja.com/)** – eine Open-Source Rechnungs- und Buchhaltungsplattform – direkt innerhalb von **Home Assistant** zu betreiben.  
Es läuft vollständig integriert über **Ingress**, ohne dass du Ports nach außen öffnen musst.

---

## 🚀 Funktionen

- Vollständig integrierte Web-App über Ingress (kein Port notwendig)  
- Unterstützt die **MariaDB Add-on**-Anbindung von Home Assistant  
- Konfiguration direkt über das Home Assistant UI  
- Funktioniert auf **aarch64**, **amd64** und **armv7**  

---

## ⚙️ Installation

1. Öffne in Home Assistant den **Add-on Store**  
2. Klicke auf die **drei Punkte (⋮)** → **Repositories**  
3. Füge dein Repository hinzu:
   ```
   https://github.com/Nephilim293/invoiceninja-ha
   ```
4. Suche nach **Invoice Ninja**  
5. Installiere und starte das Add-on  
6. Öffne es über **Ingress** im Home Assistant Menü

---

## 🔑 Konfiguration

Im Add-on kannst du die wichtigsten Variablen direkt setzen:

```yaml
app_key: "dein_app_key"
db_database: "invoiceninja"
db_username: "ninja"
db_password: "geheimespasswort"
```

> 💡 Der `app_key` wird von Invoice Ninja benötigt, um Daten sicher zu verschlüsseln.

---

## 🛠️ APP_KEY erzeugen

Du kannst den benötigten `APP_KEY` über Docker generieren.  
Führe dazu auf einem Rechner mit Docker folgenden Befehl aus:

```bash
docker run --rm -it invoiceninja/invoiceninja php artisan key:generate --show
```

Kopiere den ausgegebenen Schlüssel (z. B. `base64:xxxx...`) und füge ihn im Add-on unter `app_key` ein.

📖 Weitere Infos findest du im offiziellen [Invoice Ninja App Key Guide](https://tighten.com/insights/app-key-and-you/).

---

## 🧩 Datenbank

Dieses Add-on benötigt eine **MariaDB-Instanz**, die meist als Home Assistant Add-on installiert ist.

- Standard-Host: `core-mariadb`  
- Port: `3306` (intern)  
- Benutzer und Passwort müssen in der Konfiguration gesetzt werden.

Beispiel für die MariaDB-Integration:

```yaml
db_database: invoiceninja
db_username: ninja
db_password: geheim123
```

---

## 🐞 Fehlerbehebung

Falls der Container mit einer Fehlermeldung wie  
`nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Address in use)`  
abbricht:

- Stelle sicher, dass keine anderen Add-ons Port 80/8099 belegen.  
- Da Ingress genutzt wird, sind keine offenen Ports nötig — ggf. `EXPOSE`-Einträge im Dockerfile entfernen.  
- Starte Home Assistant nach der Installation neu.

---

## 📜 Lizenz & Support

Dies ist ein **Community Add-on**, basierend auf dem Open-Source-Projekt [Invoice Ninja](https://github.com/invoiceninja/invoiceninja).

Bei Problemen oder Funktionswünschen:  
👉 [GitHub Issues öffnen](https://github.com/Nephilim293/invoiceninja-ha/issues)

---

**Maintainer:** [Nephilim293](https://github.com/Nephilim293/invoiceninja-ha)  
📧 Kontakt: info@andromeda-network.de
