#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS base
USER app
WORKDIR /app
RUN dotnet dev-certs https --trust
ENV ASPNETCORE_URLS="http://*:8081;https://*:8082"
#ENV ASPNETCORE_HTTPS_PORTS=8082,
#ENV ASPNETCORE_HTTP_PORTS=8081
EXPOSE 8082
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["ExperimentsApp/ExperimentsApp.csproj", "ExperimentsApp/"]
RUN dotnet restore "./ExperimentsApp/ExperimentsApp.csproj"
COPY . .
WORKDIR "/src/ExperimentsApp"
RUN dotnet build "./ExperimentsApp.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS unit-tests
WORKDIR /src
COPY ["./ExperimentsApp.Tests/ExperimentsApp.Tests.csproj", "ExperimentsApp.Tests/" ]
WORKDIR /src/ExperimentsApp.Tests
RUN dotnet restore "./ExperimentsApp.Tests.csproj"
#ENV VAR1
#RUN dotnet tests ExperimentsApp.Tests.csproj --logger "console;verbosity=detailed" --results-directory ./test-results
#CMD ["dotnet", "test", "./ExperimentsApp.Tests.csproj", "--logger", "console;verbosity=detailed", "--results-directory", "./test-results"]
CMD echo "MI VARIABLE ES ${VAR1}"

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./ExperimentsApp.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ExperimentsApp.dll"]