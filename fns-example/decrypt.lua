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
    関数名: ns.decrypt(vals)
    役割: 2つの整数値を使用して復号処理を行います。
    引数: 
        result (table): 数値を格納した配列を受け渡します。
    戻り値: decrypt_number (integer)

    関数詳細: にゃんこの数値暗号(Xor暗号)を復号した値を返します。
]]

--[[使用例]]
--ネコ缶との併用
ns.analyzeMemory(2, base, -0x300, 58999);
print(ns.decrypt(gg.getResults(2)));
