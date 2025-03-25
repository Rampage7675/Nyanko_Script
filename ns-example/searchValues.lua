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
    関数名: ns.searchValues(cound, baseAddress, offset, max)
    役割: 指定された範囲から対象となる数値を検索します。
    引数: 
        cound(number)   : 乱数の個数を指定します。
        cound(string)   : 乱数の個数に加え、誤差許容数を:で区切って指定します。
        baseAddress     : ベースとなるアドレスを設定します。
        offset          : ベースアドレスからのアドレス差を指定します。
        max             : 数値を復号した際の最大値を設定します。
    戻り値: result (table)

    関数詳細: この関数はns.analyzeMemory関数とns.certValues関数を組み合わせたメモリ解析関数です。
    検索にヒットした乱数をグループ化した後、復号認証を行って数値を絞っているので精度は高めです。
    cound(検索条件), offset(アドレス差)は実際のメモリをよく観察して設定してください。
]]

--[[使用例]]
--ネコ缶(通常)
ns.searchValues(2, base, -0x300, 58999);

--ネコ缶(通常: 上の例と同じ)
ns.searchValues("2", base, -0x300, 58999);

--ネコ缶(誤差許容数1)
--誤差許容数1は精度の向上が期待できますが、2以上は場合によります。
ns.searchValues("2:1", base, -0x300, 58999);

--ネコ缶(NG例)
--前提: ns.searchValuesはns.analyzeMemoryとns.certValuesから構成されています。
--処理➀: 例(999;0)の場合ns.analyzeMemoryのリファイン時に0が消去されるので999のみが残ります。
--処理➁: 999のみではns.certValuesの認証を突破できないため除外されます。
ns.searchValues("1:1", base, -0x300, 58999);

--XP(通常)
--XPはNPと連結しているので乱数の数は4です。
ns.searchValues(4, base, 0x200, 999999999);
gg.getResults(2);       --XP
gg.getResults(2, 2);    --NP
