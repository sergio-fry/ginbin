# Ginbin

Build interactive menu from most used shell commands.

## Install

```bash
gem install ginbin
```

## Usage

Create config ~/.ginbin.yml:

```yaml
commands:
  - title: "Connect to server"
    cmd: ssh my-server.com -t "cd /opt/app && bash -l"

  - title: "Build report"
    cmd: /usr/bin/report

  # short command desc without titlwe
  - echo `date`

  - menu: Submenu
    commands:
      - echo 1
      - echo 2

      - menu: Sub Sumenu
        commands:
          - ssh server1
          - ssh server2

```

Then run `ginbin`

It is also possible to have project-specific commands. Just put another .ginbin.yml inside current dir.
