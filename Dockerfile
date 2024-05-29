FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS baseNet
WORKDIR /app
EXPOSE 80

#FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS buildNet
#WORKDIR /src
#COPY ["netProj/myproj.csproj","netProj/"]
#RUN dotnet restore "netProj/myproj.csproj"
#COPY . .
#WORKDIR "/src/netProj"
#RUN dotnet build "myproj.csproj" -c Release -o /app/build

#FROM buildNet AS publishNet
#RUN dotnet publish "myproj.csproj" -c Release -o /app/publish

FROM baseNet AS finalNet
WORKDIR /app
#COPY --from=publishNet /app/publish .
#ENTRYPOINT ["dotnet", "myproj.dll"]

FROM node:14 AS buildReact
WORKDIR /app

#COPY [ "reactProj/package*.json ./
#RUN npm install

#COPY . .
#RUN npm run build

FROM nginx:stable-alpine
#COPY --from=buildReact /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
