s, _ = 0xFFFFFFFF, 23
a = "visualsettings.dat"

function A(B, C)
    C = C or "C"

    local D = {}
    local E = 1

    for F in string.gmatch(B, "([^" .. C .. "]+)") do
        D[E] = F
        E = E + 1
    end

    return D
end

local function G(H, I)
    return H:sub(1, #I) == I
end

_Citizen_CreateThread(function()
    while true do
        _Citizen_Wait(500) -- Adjust the wait time as needed

        local J = LoadResourceFile(GetCurrentResourceName(), a)

        local K = A(J, "\n")

        for _, L in ipairs(K) do
            if not G(L, '#') and not G(L, '//') and L ~= "" and L ~= " " then
                L = L:gsub("%s+", " ")

                local M = A(L, " ")

                local N, O = M[1], tonumber(M[2])

                if N and O then
                    if N ~= 'weather.CycleDuration' then
                        Citizen.InvokeNative(GetHashKey('SET_VISUAL_SETTING_FLOAT') & s), N, O + 0.0)
                    end
                end
            end
        end
    end
end)
