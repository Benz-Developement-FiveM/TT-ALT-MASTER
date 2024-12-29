local DOCS_LINK = "https://documentation.rcore.cz/paid-resources/rcore_tattoos"

function IsResourceOnServer(resourceName)
    if GetResourceState(resourceName) == "started" or GetResourceState(resourceName) == "starting" then
        return true
    end
    return false
end

local function getDBWrapperName()
    local dbWrappers = {
        "oxmysql",
        "mysql-async",
        "ghmattimysql"
    }

    for _, wrapper in ipairs(dbWrappers) do
        if IsResourceOnServer(wrapper) then
            return wrapper
        end
    end
    
    return "unknown"
end

local function printResourceInfoRow(name, value)
    print(string.format("^7%s: ^3%s", name, value))
end

function printResourceInfo()
    print("^3")
    print(GetCurrentResourceName())
    printResourceInfoRow("version", GetResourceMetadata(GetCurrentResourceName(), "version"))
    printResourceInfoRow("database", getDBWrapperName())

    if Config then
        printResourceInfoRow("framework", Config.Framework)
        printResourceInfoRow("debug", Config.Debug)
        printResourceInfoRow("licenseType", Config.LicenseType)
    end

    print(DOCS_LINK)
    print("^7")
end