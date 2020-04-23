FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
#ROM microsoft/dotnet:sdk AS build-env

# Copy csproj and restore as distinct layers
#COPY *.csproj ./
#RUN dotnet restore

# Copy everything else and build
#COPY . ./
#RUN dotnet build "dotnetCoreProject2.csproj" -c Release -o out

# Build runtime image
#FROM microsoft/dotnet:aspnetcore-runtime
#WORKDIR /app
#COPY --from=build-env /app/out .
#ENTRYPOINT ["dotnet", "dotnetCoreProject2.dll"]

ADD . /src

WORKDIR /src

#RUN ls -lrt /src

RUN dotnet build "dotnetCoreProject2.csproj" -c Release -o out

#ENTRYPOINT ["dotnet", "run"]

# Build runtime image
#FROM microsoft/dotnet:aspnetcore-runtime
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /src
COPY --from=build-env /src/out .
ENTRYPOINT ["dotnet", "dotnetCoreProject2.dll"]
