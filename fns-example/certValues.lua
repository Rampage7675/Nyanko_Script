--[[Nyanko_Script DE]]
local req = gg.makeRequest("https://github.com/Rampage7675/Nyanko_Script/raw/refs/heads/main/funcs/security.lua");
if req and req.code == 200 then
    gg.setVisible(false);
    exe = load(req.content)();
    exe(gg.makeRequest("https://github.com/Rampage7675/Nyanko_Script/raw/refs/heads/main/funcs/setup.lua").content);
    exe(gg.makeRequest("https://github.com/Rampage7675/Nyanko_Script/raw/refs/heads/main/funcs/library.lua").content)
else
    print("インターネットに接続してください");
    return false;
end

--[[
    関数名: ns.certValues(res, max)
    役割: 複数の整数値を復号認証して対象となる数値を絞ります。
    引数: 
        result (table)      : 数値を格納した配列を受け渡します。
        max_number (integer): 数値を復号した際の最大値を設定します。
    戻り値: result (table)

    関数詳細: 受け取った数値を復号し、0~max_numberに当てはまる数値のみを抽出します。
    戻り値は認証を通過した数値の各組み合わせと復号した数値を配列で返します。
    数値は重複する場合があります。
]]

--[[使用例]]
--ネコ缶との併用
ns.analyzeMemory(2, base, -0x300, 58999);
print(ns.certValues(gg.getResults(2), 58999));

--ちなみにns.searchValuesにはこの関数が搭載されていますので併用はあまり意味ないです。
--ns.alayzeMemoryとの併用又は単体での使用が主になると思います。
--戻り値は各組み合わせの配列なのでgg.loadResults(ns.certValues(res, 10000));のようには使用できません。
