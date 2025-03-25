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

-- maincode
function Main()
    local mp = gg.multiChoice({
        "ネコ缶", 
        "XP", 
        "終了"
    }, nil, "にゃんこ大戦争");
    
    if not mp then
        return false;
    end
    
    if mp[1] then
        gg.clearResults();
        ns.searchValues(2, base, -0x128, 58999);
        local res = gg.getResults(2);
        ns.saveValues(58000, res);
        gg.toast("ネコ缶成功");
    end
    
    if mp[2] then
        gg.clearResults();
        ns.searchValues(4, base, 0x54, 999999999);
        local res = gg.getResults(2);
        ns.saveValues(200000000, res);
        gg.toast("XP成功");
    end
    
    if mp[3] then
        gg.setVisible(true);
        os.exit();
    end
end

gg.setVisible(true);
while true do
    if gg.isVisible() then
        gg.setVisible(false);
        Main();
    end
end
