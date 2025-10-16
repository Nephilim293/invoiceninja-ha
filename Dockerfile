FROM invoiceninja/invoiceninja:latest

# Kopiere optionale Anpassungen (z. B. nginx.conf oder env-Dateien)
# COPY rootfs /

# Home Assistant braucht den App-Start im Vordergrund
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8080"]
