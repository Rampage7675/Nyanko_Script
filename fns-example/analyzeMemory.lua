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
    関数名: ns.analyzeMemory(cond, base, offs)
    役割: 指定された範囲から対象となる乱数を検索します。
    引数: 
        cound(number)   : 乱数の個数を指定します。
        cound(string)   : 乱数の個数に加え、誤差許容数を:で区切って指定します。
        baseAddress     : ベースとなるアドレスを設定します。
        offset          : ベースアドレスからのアドレス差を指定します。
    戻り値: result (table)

    関数詳細: メモリ範囲内の数値を全て-256~255と-257~~256のみに見立て、その位置関係から条件に合った場所を抽出します。
    戻り値は乱数をグループ化した配列を返します。
]]

--[[使用例]]
--ネコ缶(通常)
ns.analyzeMemory(2, base, -0x300);

--ネコ缶(通常: 上の例と同じ)
ns.analyzeMemory("2", base, -0x300);

--ネコ缶(誤差許容数1)
--誤差許容数1は精度の向上が期待できますが、2以上は場合によります。
ns.analyzeMemory("2:1", base, -0x300);

--ネコ缶(gg.searchValuesでは非対応)
--例(999;0)のような場合でも、最低片方の数値が特定できます。
ns.analyzeMemory("1:1", base, -0x300);

--XP(通常)
--XPはNPと連結しているので乱数の数は4です。
ns.analyzeMemory(4, base, 0x200);
gg.getResults(2);       --XP
gg.clearResults();
gg.getResults(2, 2);    --NP
