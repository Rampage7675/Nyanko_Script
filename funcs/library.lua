ns = {
    ["decrypt"] = decrypt, 
    ["encrypt"] = encrypt, 
    ["certValues"] = certValues, 
    ["analyzeMemory"] = analyzeMemory, 
    ["searchValues"] = searchValues, 
    ["saveValues"] = saveValues, 
    ["_explain"] = {
        ["decrypt"] = [[役割: 2つの整数値を使用して復号処理を行います。
        引数: result (table)
        戻り値: decrypt_number (integer)
        ]], 
        ["encrypt"] = [[役割: 1つの整数値を使用して暗号化処理を行います。
        引数: number (integer)
        戻り値: encrypt_number_1 (integer), encrypt_number_2 (integer)
        ]], 
        ["certValues"] = [[役割: 複数の整数値を復号認証して対象となる数値を絞ります。
        引数: result (table), max_number (integer)
        戻り値: result (table)
        ]], 
        ["analyzeMemory"] = [[役割: 指定された範囲から対象となる乱数を検索します。
        引数: cond (number|string), baseAddress (integer), offset (integer)
        戻り値: result (table)
        ]], 
        ["searchValues"] = [[役割: 指定された範囲から対象となる数値を検索します。
        引数: cond (number|string), baseAddress (integer), offset (integer), max (integer)
        戻り値: result (table)
        ]], 
        ["saveValues"] = [[役割: 数値の編集と保存を行います。
        引数: editval (integer), result (table), name (string)
        戻り値: gg.addListItems()
        ]], 
    }
};
return ns;
