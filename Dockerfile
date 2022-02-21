FROM alpine

RUN mkdir -p /assets/icons

ADD https://raw.githubusercontent.com/hedgedoc/hedgedoc/1.9.2/public/icons/android-chrome-192x192.png /assets/icon_hedgedoc.png
ADD https://raw.githubusercontent.com/vector-im/element-web/v1.10.4/res/vector-icons/180.png /assets/icon_element.png
ADD https://raw.githubusercontent.com/jitsi/jitsi-meet/stable/jitsi-meet_6865/images/jitsiLogo_square.png /assets/icon_jitsi.png
ADD https://raw.githubusercontent.com/keycloak/keycloak-misc/main/logo/keycloak_icon_256px.png /assets/icon_keycloak.png
ADD https://raw.githubusercontent.com/nextcloud/server/v23.0.2/core/img/favicon-fb.png /assets/icon_nextcloud.png

COPY possum_mood.png /assets/icons/icon-any.png

RUN apk add --no-cache --virtual .build-deps imagemagick && \
    cp /assets/icons/icon-any.png /assets/icons/icon-maskable.png && \
    convert /assets/icons/icon-any.png -resize 32x32 /assets/icons/favicon-32x32.png && \
    convert /assets/icons/icon-any.png -resize 16x16 /assets/icons/favicon-16x16.png && \
    apk del .build-deps
