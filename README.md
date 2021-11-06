# Build Environment for SpringRTS engine

## Quickstart

Build branch `BAR105` from `https://github.com/beyond-all-reason/Beyond-All-Reason` (default values):
```
docker run -it verybadsoldier/springrts-build:latest
```

The output artifacts can be found in a volume linked to the container. Accessible e.g. via the Docker Desktop application.

You can also specify a destination output folder on your host like this by linking a volume to `/publish`:

```
docker run -v D:\myspringbuild:/publish -it verybadsoldier/springrts-build:latest
```

### Building a custom Branch
```
docker run -v D:\myspringbuild:/publish -it verybadsoldier/springrts-build:latest -b MyAwesomeFeatureBranch
```

### Building from another GitHub Repository
```
docker run -v D:\myspringbuild:/publish -it verybadsoldier/springrts-build:latest -u AverageJoe
```

## Parameters
| Parameter|      Default |  Description |
|:----------:|:-------------:|:------|
| -b |  BAR105 | The branch to build from the spring project |
| -u |  beyond-all-reason     | Username on GitHub to use for the main SpringRTS repo.  The following URL will be cloned: https://github.com/<username>/spring |
| -a | beyond-all-reason |  Username on GitHub to use for the auxiliary repos.  The following URL will e.g. be cloned: https://github.com/<username>/BARbarIAn |
| -p | windows-64 |  Platform to build. Supported values: `windows-64`, `linux-64` |
   

# GitHub Project
[springrts-build on GitHub](https://github.com/verybadsoldier/docker-springrts-build)
