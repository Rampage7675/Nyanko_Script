-- タイムゾーン取得 -> baset
local t = os.time();
local baset = os.difftime(t, os.time(os.date("!*t", t)));
baset = ("%d"):format(baset);

-- ベース値(Hex)作成 -> basex
local x, basex = ("%08x"):format(baset & 0xffffffff), {};
for t in x:gmatch("%x%x") do
    table.insert(basex, 1, t);
end
basex = "h "..table.concat(basex, " ");

-- ベースアドレス取得 -> base
gg.clearResults();
local fs, base = gg.getRangesList("split_config.arm64_v8a.apk:bss");
gg.setRanges(fs[1] and -2080896 or 48);
gg.searchNumber(basex, 1, false, 536870912, fs[1] and fs[1].start or 0, fs[1] and fs[1].start +0xffff or -1);
gg.refineNumber(gg.getResults(1)[1].value, 1);
local res = gg.getResults(gg.getResultsCount());
for i = 1, #res do
    if not res[i+2] then
        base = res[i].address;
        break;
    end
    local cash = res[i+2].address-res[i+1].address;
    if cash > 0x3000 and cash < 0x4fff and (function()
        gg.clearResults();
        gg.searchNumber(("-256~255;"):rep(2)..("-257~~256;"):rep(2).."-256~255;-256~255::21", 4, false, 2^29, base, base +0x120);
        return gg.getResultsCount() == 6;
    end) then
        base = res[i].address;
        break;
    end
end

if not base then
    gg.alert("数値の初期設定に失敗しました。\nアプリを再起動してください");
    return false;
end

return base, baset, basex;