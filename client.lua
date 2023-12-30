function s(i, s)
    if s == nil then s = "%s" end
    local t={} ; i=1
    for r in string.gmatch(i, "([^"..s.."]+)") do
        t[i] = r
        i = i + 1
    end
    return t
end

local function a()
    local f = LoadResourceFile(GetCurrentResourceName(), "visualsettings.dat")
    local l = s(f, "\n")
    for _, n in ipairs(l) do
        if not (n:sub(1, 1) == '#' or n:sub(1, 2) == '//') and (n ~= "" or n ~= " ") and #n > 1 then
            n = n:gsub("%s+", " ")
            local c = s(n, " ")
            if c[1] ~= nil and c[2] ~= nil and tonumber(c[2]) ~= nil then
                if c[1] ~= 'weather.CycleDuration' then    
                    Citizen.InvokeNative(0x7BAE68775557AE0B, c[1], tonumber(c[2]) + .0)
                end
            end
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        a()
    end
end)
