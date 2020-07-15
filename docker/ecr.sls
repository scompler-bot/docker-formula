{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import docker with context %}

include:
  - docker

amazon-ecr-credential-helper:
  pkg.installed

/root/.docker/config.json:
  file.managed:
    - contents: |
        { "credsStore": "ecr-login" }
    - mode: 400
    - makedirs: true
