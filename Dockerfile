FROM mcr.microsoft.com/dotnet/sdk:8.0

LABEL "com.github.actions.name"="Auto Release Milestone"
LABEL "com.github.actions.description"="Drafts a GitHub release based on a newly closed milestone."

LABEL version="0.1.0"
LABEL repository="https://github.com/enridaga/auto-release-milestone"
LABEL maintainer="Enrico Daga (forked from Enrico Campidoglio)"

RUN apt-get update && apt-get install -y jq
RUN dotnet tool install -g GitReleaseManager.Tool

ENV PATH /root/.dotnet/tools:$PATH
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1

COPY entrypoint.sh /
RUN ls
COPY GitReleaseManager.yaml /
ENTRYPOINT [ "/entrypoint.sh" ]
