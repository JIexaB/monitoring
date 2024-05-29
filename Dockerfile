FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS basenet
WORKDIR /app
EXPOSE 80

#FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS buildnet
#WORKDIR /src
#COPY ["netProj/myproj.csproj","netProj/"]
#RUN dotnet restore "netProj/myproj.csproj"
#COPY . .
#WORKDIR "/src/netProj"
#RUN dotnet build "myproj.csproj" -c Release -o /app/build

#FROM buildnet AS publishnet
#RUN dotnet publish "myproj.csproj" -c Release -o /app/publish

FROM basenet AS finalnet
WORKDIR /app
#COPY --from=publishnet /app/publish .
#ENTRYPOINT ["dotnet", "myproj.dll"]

FROM node:14 AS buildreact
WORKDIR /app

#COPY [ "reactProj/package*.json ./
#RUN npm install

#COPY . .
#RUN npm run build

FROM nginx:stable-alpine
#COPY --from=buildreact /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
