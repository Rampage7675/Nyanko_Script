# Nyanko_Script DE
にゃんこスクリプトを作成する際に便利な開発環境を提供します。  
下記のプログラムをコピペしてご使用ください。
```lua
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
```
参照: [Nyanko_Script DE](https://github.com/Rampage7675/Nyanko_Script/blob/main/develop.lua)  

---

# NS関数の使い方  
NS関数はそれぞれ暗号関連、検索関連、編集関連に分かれています。  
Nyanko_Script DEを導入すると、`ns.関数名(引数)`という形で使用できます。  
オープンソースで公開しているので気になる方は[NS関数(プログラム)](https://github.com/Rampage7675/Nyanko_Script/blob/main/funcs/library.lua)をご観覧ください。  
各関数の解説及び使用例は節末の参照リンクから観覧できます。  
また、各関数の概要は`print(ns._explain)`を実行して確認することもできます。  
  
参照: [NS関数(索引)](https://github.com/Rampage7675/Nyanko_Script/tree/main/fns-example)

---

# Nyanko_Script
  
Nyanko_Script DEを使用したにゃんこスクリプトです。  
ダウンロードしてご使用ください。
  
参照:  [Nyanko_Script](https://github.com/Rampage7675/Nyanko_Script/blob/main/index.lua)

---

## サポート  
[Discord](https://discord.gg/zXYYnBt4N4)
  
> 不明な点がありましたらこちらにお問い合わせください。  
  
[YouTube](https://www.youtube.com/@Rampage_7675)
  
> スクリプトの開発過程などを配信しています。  

---

## 開発者
にゃんこIPc, Rampage  
