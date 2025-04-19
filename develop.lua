--[[Nyanko_Script DE]]
local req = gg.makeRequest("https://github.com/Rampage7675/Nyanko_Script/raw/refs/heads/main/funcs/security.lua");
if req and req.code == 200 then
    gg.setVisible(false);
    exe = load(req.content)();
    exe(gg.makeRequest("https://github.com/Rampage7675/Nyanko_Script/raw/refs/heads/main/funcs/setup.lua").content);
    exe(gg.makeRequest("https://github.com/Rampage7675/Nyanko_Script/raw/refs/heads/main/funcs/library.lua").content);
else
    print("インターネットに接続してください");
    return false;
end

--[[動作検証]]
print("Base value: "..baset..("(%s)"):format(basex));
print("Base address: "..("0x%08x"):format(base & 0xffffffff));

--テスト(ネコ缶)
gg.clearResults();
gg.setRanges(gg.REGION_C_BSS);
ns.searchValues(2, base, -0x200, 58999);
ns.saveValues(9999, gg.getResults(100));
gg.toast("ネコ缶成功");
