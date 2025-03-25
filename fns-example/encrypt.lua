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
    関数名: ns.encrypt(num)
    役割: 1つの整数値を使用して暗号化処理を行います。
    引数: 
        number (integer)    : 数値の変更値を受け渡します
    戻り値: encrypt_number_1 (integer), encrypt_number_2 (integer)

    関数詳細: 受け取った数値を暗号(Xor暗号)化します。
    戻り値は2つとも-257~~256の乱数です。
]]

--[[使用例]]
print(ns.encrypt(58999));
