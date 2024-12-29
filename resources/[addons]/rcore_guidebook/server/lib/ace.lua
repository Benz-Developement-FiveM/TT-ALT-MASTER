local function permissionName(name)
    return string.format('%s_%s', GetCurrentResourceName(), name)
end

Ace = {}
Ace.AddPrincipal = function(child, parent)
    dbg.info('add_principal %s %s', child, parent)
    ExecuteCommand(string.format('add_principal %s %s', child, parent))
end
Ace.RemovePrincipal = function(child, parent)
    dbg.info('remove_principal %s %s', child, parent)
    ExecuteCommand(string.format('remove_principal %s %s', child, parent))
end
Ace.Allow = function(identifier, resource)
    dbg.info('add_ace %s %s allow', identifier, resource)
    ExecuteCommand(string.format('add_ace %s %s allow', identifier, permissionName(resource)))
end
Ace.Deny = function(identifier, resource)
    dbg.info('add_ace %s %s deny', identifier, resource)
    ExecuteCommand(string.format('add_ace %s %s deny', identifier, permissionName(resource)))
end
Ace.Can = function(source, rule)
    return IsPlayerAceAllowed(source, permissionName(rule))
end
Ace.CanGroup = function(group, rule)
    return IsPrincipalAceAllowed(group, permissionName(rule))
end
