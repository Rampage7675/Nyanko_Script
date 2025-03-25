--[[暗号関連]]
local function decrypt(vals)
    local sum = 0;
    local v1 = vals[1].value + (vals[1].value < 0 and 2^32 or 0);
    local v2 = vals[2].value + (vals[2].value < 0 and 2^32 or 0);
    for i = 24, 0, -8 do
        local x1, x2 = math.floor(v1/2^(i)), v2%2^8;
        v1, v2 = v1%2^i, math.floor(v2/2^8);
        x1 = math.tointeger(x1 - (2^7 <= x1 and 2^8 or 0));
        x2 = math.tointeger(x2 - (2^7 <= x2 and 2^8 or 0));
        local xor = x1 ~ x2;
        sum = sum + (xor + (xor < 0 and 2^8 or 0))*2^i;
    end
    return sum;
end

local function encrypt(num)
    local v2 = math.random(2^29) + (num/2^30 == 0 and 2^30 or 0);
    local v1 = decrypt({{["value"] = num}, {["value"] = v2}});
    v1 = v1 - (2^31 <= v1 and 2^32 or 0);
    return (2^31 <= v1 and v1 - 2^32 or v1), v2;
end

local function certValues(res, max)
    local ret = {};
    for i = 1, #res-1 do
        local t = decrypt({res[i], res[i+1]}) or -1;
        if 0 <= t and t <= max then
            table.insert(ret, {["value"] = t, res[i], res[i+1]});
        end
    end
    return ret;
end

--[[検索関連]]
local function analyzeMemory(cond, base, offs)
    local cnt, err = tostring(cond):match("(%d+):(%d+)");
    cnt, err = tonumber(cnt or cond), tonumber(err or 0);
    gg.clearResults();
    gg.searchNumber("-256~255;"..("-257~~256;"):rep(cnt).."-256~255::"..4*(cnt+err)+5, 4, false, 2^29, (function()
        local t = base + offs;
        return table.unpack(t < base and {t, base} or {base, t});
    end)());
    gg.refineNumber("-257~~256", 4);
    local res, ret = gg.getResults(10^5), {{}};
    for s, t in ipairs(res) do
        table.insert(ret[#ret], t);
        if res[s+1] and res[s+1].address - t.address > 0x4 then
            table.insert(ret, {});
        end
    end
    return ret;
end

local function searchValues(cond, base, offs, max)
    local res, ret = analyzeMemory(cond, base, offs), {};
    for _, s in ipairs(res) do
        for _, t in ipairs(certValues(s, max)) do
            table.insert(ret, t and t[1]);
            table.insert(ret, t and t[2]);
        end
    end
    gg.loadResults(ret);
    return ret;
end

--[[数値編集]]
local function saveValues(editval, res, name)
    res = res or gg.getResults(math.floor(gg.getResultsCount()/2)*2);
    for i = 1, #res-1, 2 do
        res[i].freeze = true;
        res[i+1].freeze = true;
        res[i].name, res[i+1].name = name, name;
        res[i].value, res[i+1].value = encrypt(editval);
    end
    return gg.addListItems(res);
end

ns = {
    ["decrypt"] = decrypt, 
    ["encrypt"] = encrypt, 
    ["certValues"] = certValues, 
    ["analyzeMemory"] = analyzeMemory, 
    ["searchValues"] = searchValues, 
    ["saveValues"] = saveValues, 
    ["_explain"] = {
        ["decrypt"] = [[役割: 2つの整数値を使用して復号処理を行います。
        引数: result (table)
        戻り値: decrypt_number (integer)
        ]], 
        ["encrypt"] = [[役割: 1つの整数値を使用して暗号化処理を行います。
        引数: number (integer)
        戻り値: encrypt_number_1 (integer), encrypt_number_2 (integer)
        ]], 
        ["certValues"] = [[役割: 複数の整数値を復号認証して対象となる数値を絞ります。
        引数: result (table), max_number (integer)
        戻り値: result (table)
        ]], 
        ["analyzeMemory"] = [[役割: 指定された範囲から対象となる乱数を検索します。
        引数: cond (number|string), baseAddress (integer), offset (integer)
        戻り値: result (table)
        ]], 
        ["searchValues"] = [[役割: 指定された範囲から対象となる数値を検索します。
        引数: cond (number|string), baseAddress (integer), offset (integer), max (integer)
        戻り値: result (table)
        ]], 
        ["saveValues"] = [[役割: 数値の編集と保存を行います。
        引数: editval (integer), result (table), name (string)
        戻り値: gg.addListItems()
        ]], 
    }
};
return ns;
