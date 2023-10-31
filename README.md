# hex2dfu

這是一個將 Intel Hex 格式的檔案轉換成 DFU 格式的檔案的程式。
可以使用 `git submodule update --init --recursive` 取得原始碼。

### Usage

```bash
git submodule add https://github.com/leoli0605/hex2dfu.git hex2dfu
```

- 將 `*.hex` 轉成 `*.dfu`： `./hex2dfu.sh` 會將 `build` 資料夾下的所有 `*.hex` 轉成 `*.dfu`。
- 將 `*.dfu` 燒錄到開發板: `./DfuSeDownload.sh` 會自動將 `build` 資料夾下最新的 `*.dfu` 燒錄到開發板。

### TODO

- [ ] 優化 `*.sh` 的使用者體驗
