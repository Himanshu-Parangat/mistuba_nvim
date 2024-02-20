return{
  'kevinhwang91/nvim-ufo',
  dependencies = {"kevinhwang91/promise-async"},
  config = function()
    local function selectProviderWithFt()
      local ftMap = {
        vim = 'indent',
        python = {'indent'},
        git = ''
      }
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          -- return a table with string elements: 1st is name of main provider, 2nd is fallback
          -- return a string type: use ufo inner providers
          -- return a string in a table: like a string type above
          -- return empty string '': disable any providers
          -- return `nil`: use default value {'lsp', 'indent'}
          -- return a function: it will be involved and expected return `UfoFoldingRange[]|Promise`

          -- if you prefer treesitter provider rather than lsp,
          -- return ftMap[filetype] or {'treesitter', 'indent'}
          return ftMap[filetype]
        end
      })
    end
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (' 󰁂 %d '):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, {chunkText, hlGroup})
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, {suffix, 'MoreMsg'})
      return newVirtText
    end

    local function customizeFoldText()
      -- global handler
      require('ufo').setup({
        fold_virt_text_handler = handler
      })
    end

    local function customizeBufFoldText()
      -- buffer scope handler
      -- will override global handler if it is existed
      local bufnr = vim.api.nvim_get_current_buf()
      require('ufo').setFoldVirtTextHandler(bufnr, handler)
    end

    local function inspectVirtTextForFoldedLines()
      require('ufo').setup({
        enable_get_fold_virt_text = true,
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate, ctx)
          for i = lnum, endLnum do
            print('lnum: ', i, ', virtText: ', vim.inspect(ctx.get_fold_virt_text(i)))
          end
          return virtText
        end
      })
    end

  end 

}
