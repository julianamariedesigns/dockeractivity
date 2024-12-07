#FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine AS builder
# Use the ARM-compatible .NET SDK image
FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS builder

WORKDIR /src
COPY . .

RUN chmod +x restore.sh && ./restore.sh
RUN chmod +x build.sh  && ./build.sh

# app image
#FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine
# Use the ARM-compatible ASP.NET runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine AS runtime 


ENV Widgetario__ProductsApi__Url="http://products-api/products" \
    Widgetario__StockApi__Url="http://stock-api:8080/stock" \
    #DOTNET_VERSION="3.1" \
    #APP_VERSION="1.0.0"
    DOTNET_VERSION="6.0" \
    APP_VERSION="1.0.0"

WORKDIR /app
COPY --from=builder /out/ .

# Specify the command to run your application
ENTRYPOINT ["dotnet", "Widgetario.Web.dll"]