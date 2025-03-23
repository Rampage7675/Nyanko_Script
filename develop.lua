--[[Nyanko_Script DS]]
local req = gg.makeRequest("https://github.com/Rampage7675/Nyanko_Script/raw/refs/heads/main/funcs/security.lua");
if req and req.code == 200 then
    exe = load(req.content)();
    exe(gg.makeRequest("https://github.com/Rampage7675/Nyanko_Script/raw/refs/heads/main/funcs/setup.lua").content);
    exe(gg.makeRequest("https://github.com/Rampage7675/Nyanko_Script/raw/refs/heads/main/funcs/library.lua").content)
else
    print("インターネットに接続してください");
    return false;
end

--main code
print("Base value: "..baset..("(%s)"):format(basex));
print("Base address: "..("0x%08x"):format(base & 0xffffffff));
