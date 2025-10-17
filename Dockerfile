FROM invoiceninja/invoiceninja:latest

# Stellen Sie sicher, dass das rootfs kopiert wird,
# auch wenn Sie es hier auskommentiert haben!
COPY rootfs /

# Keine CMD erforderlich, da s6-overlay die Dienste startet
# und das run-Skript den Prozess in den Vordergrund bringt.
