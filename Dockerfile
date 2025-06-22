FROM alpine:latest

# Installer les dépendances
RUN apk add --no-cache wget unzip

# Télécharger PocketBase
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.4/pocketbase_0.22.4_linux_amd64.zip \
    && unzip pocketbase_0.22.4_linux_amd64.zip \
    && chmod +x /pocketbase \
    && rm pocketbase_0.22.4_linux_amd64.zip

# Démarrer PocketBase
CMD ["/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/pb_data"]