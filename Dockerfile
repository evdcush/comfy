ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG COMFY_CLI_VERSION

USER root
RUN test -n "${COMFY_CLI_VERSION}" \
    && sed -i "s|\${PIP3_CMD} comfy-cli|\${PIP3_CMD} comfy-cli==${COMFY_CLI_VERSION}|" /comfyui-nvidia_init.bash \
    && grep -F "\${PIP3_CMD} comfy-cli==${COMFY_CLI_VERSION}" /comfyui-nvidia_init.bash
USER comfytoo
