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
    関数名: ns.saveValues(editval, res, name)
    役割: 1つの整数値を使用して暗号化処理を行います。
    引数: 
        editval (integer)   : 変更値を設定します。
        result (table)      : 数値を格納した配列を受け渡します(任意)
        name (string)       : 数値に名前を付けます(任意)
    戻り値: true

    関数詳細: 受け取った数値を暗号化した変更値で書き換えます。
    result以降の引数は指定しなくても自動収集してくれます。
]]

--[[使用例]]
--ネコ缶(通常)
ns.searchValues(2, base, -0x300, 58999);
ns.saveValues(58000, gg.getResults(2));

--ネコ缶(省略)
--resultを指定しない場合数値は検索結果に残っている数値を収集します。
--もし数値が奇数個あった場合、関数は一番下の1を除外して偶数個のみを書き換えます。
ns.searchValues("2:1", base, -0x300, 58999);
ns.saveValues(58000);
