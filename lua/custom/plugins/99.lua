return {
  {
    'ThePrimeagen/99',
    config = function()
      local _99 = require('99')
      local Providers = require('99.providers')

      local cwd = vim.uv.cwd()
      local basename = vim.fs.basename(cwd)

      _99.setup({
        -- Use Claude Code as the AI provider
        provider = Providers.ClaudeCodeProvider,
        -- Supported Claude models:
        --   claude-sonnet-4-5-20250929
        --   claude-opus-4-5-20251101
        --   claude-opus-4-6
        --   claude-opus-4-1-20250805
        --   claude-opus-4-20250514
        --   claude-sonnet-4-20250514
        --   claude-3-7-sonnet-20250219
        --   claude-haiku-4-5-20251001
        --   claude-3-5-haiku-20241022
        model = 'claude-sonnet-4-5-20250929',

        -- Optional: debug logging
        logger = {
          level = _99.INFO,
          path = '/tmp/' .. basename .. '.99.debug',
          print_on_error = true,
        },

        -- Auto-discover context files walking up from current file
        md_files = {
          'AGENT.md',
          'CLAUDE.md',
        },

        -- Skill completion (note: only supports nvim-cmp, not blink.cmp)
        -- Set source to nil since you use blink.cmp
        completion = {
          source = nil,
          custom_rules = {},
        },
      })

      -- Visual mode: send selection to AI with prompt
      vim.keymap.set('v', '<leader>9v', function()
        _99.visual()
      end, { desc = '99: Visual AI request' })

      -- Cancel all active AI requests
      vim.keymap.set('n', '<leader>9s', function()
        _99.stop_all_requests()
      end, { desc = '99: Stop all requests' })

      -- View logs for debugging
      vim.keymap.set('n', '<leader>9l', function()
        _99.view_logs()
      end, { desc = '99: View logs' })

      -- Show 99 info
      vim.keymap.set('n', '<leader>9i', function()
        _99.info()
      end, { desc = '99: Show info' })
    end,
  },
}
