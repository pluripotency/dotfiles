## tomlファイルを編集すると勝手に内容が書き換わってしまう理由は

---

  この現象が発生している原因は、複数のプラグインと設定が連鎖して「編集中に自動保存 →
  LSPによる自動フォーマット」が実行されているためです。

  特に以下の3つの設定が組み合わさることで発生しています。
  ──────
  ### 1. 主要因: auto-save.nvim × conform.nvim × taplo (LSP) の連鎖

  #### ① auto-save.nvim による勝手な保存

  init.lua:209-227 で auto-save.nvim が有効になっています。

    event = { 'InsertLeave', 'TextChanged' },
    triger_events = {
      defer_save = { 'InsertLeave' },
      ...
    }

  インサートモードを抜けた瞬間（InsertLeave）などに自動でファイル保存（BufWritePre）がトリガーされます。

  #### ② conform.nvim の自動フォーマット（LSPフォールバック）

  init.lua:52-66 の format_on_save 設定：

    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true, python = true }
      local filename = vim.api.nvim_buf_get_name(bufnr)
      if disable_filetypes[vim.bo[bufnr].filetype] or filename:match 'whichkey.lua' then
        return nil
      end
      return {
        timeout_ms = 500,
        lsp_format = 'fallback',
      }
    end,

  • 無効化リスト disable_filetypes に toml が含まれていません。
  • lsp_format = 'fallback' が指定されているため、個別フォーマッタ（stylua 等）が定義されていないファイル形式では
  LSPのフォーマット機能がフォールバックとして呼び出されます。

  #### ③ taplo (TOML用 LSP) による全体整形

  init.lua:274-287 で、LSPサーバーとして taplo が登録され起動しています。

  • taplo はTOML用のLSPで、強力なオートフォーマット（キーの整列・インデント調整・並び替え）機能を持っています。
  • 編集途中でインサートモードを抜けるたびに、自動保存 → taplo
  のフォーマットが走り、不完全な構文やインデントが勝手に書き換えられてしまいます。
  • ※TOML以外の「一部のファイル種別」でも同様に、disable_filetypes に入っていない言語（Go や TypeScript
  など）でLSPがフォーマット機能を持っている場合に勝手に整形が走ります。
  ──────
  ### 2. 副次的要因: TOMLに対する JSON用インデント設定

  my.lua:122-130 に以下の設定があります：

    -- TOML indentation configuration
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'toml',
      callback = function()
        vim.cmd 'runtime! indent/json.vim'
        vim.opt_local.indentexpr = 'GetJSONIndent(v:lnum)'
        vim.opt_local.indentkeys = '0{,0},0),0],!^F,o,O,e'
      end,
    })

  TOMLファイルに対して JSON用のインデント計算スクリプト（GetJSONIndent） が割り当てられており、indentkeys に o,O,e
  などが設定されています。そのため、改行や入力のたびにNeovimがインデントを再計算してカーソルや行頭スペースが勝手にズレる原因に
  なります。
  ──────
  ### 対処方法の例

  #### A. TOML（および勝手に整形されたくないファイル）を自動保存フォーマットから除外する

  init.lua:53 の disable_filetypes に toml を追加します：

    local disable_filetypes = { c = true, cpp = true, python = true, toml = true }

  または、LSPによるフォーマット自体を自動保存で行わないように lsp_format = 'never' に変更する。

  #### B. 不適切なTOMLインデント設定を削除・修正する

  my.lua:122-130 の FileType autocmd をコメントアウトまたは削除します。

  #### C. auto-save.nvim を見直す

  勝手に保存される挙動そのものが不要であれば、init.lua:209 の auto-save.nvim を無効化するか、一時的に :ASToggle
  でオフにできます。
