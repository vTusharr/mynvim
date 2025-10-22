require "nvchad.options"

-- Quality of life improvements
local o = vim.o
local opt = vim.opt

-- Better editor settings
o.relativenumber = true              -- Relative line numbers for easier navigation
o.cursorlineopt = 'both'             -- Highlight current line
o.scrolloff = 8                      -- Keep 8 lines visible above/below cursor
o.sidescrolloff = 8                  -- Keep 8 columns visible left/right of cursor
o.wrap = false                       -- Don't wrap long lines

-- Better search
o.ignorecase = true                  -- Case-insensitive search
o.smartcase = true                   -- Unless search contains uppercase

-- Better completion
o.pumheight = 10                     -- Popup menu height
o.completeopt = "menuone,noselect"   -- Better completion experience

-- Undo and backup
o.undofile = true                    -- Persistent undo
o.backup = false                     -- No backup files
o.writebackup = false                -- No backup before overwriting

-- Better splitting
o.splitbelow = true                  -- Split below instead of above
o.splitright = true                  -- Split right instead of left

-- Faster update time
o.updatetime = 250                   -- Faster completion
o.timeoutlen = 300                   -- Faster which-key popup

-- Better clipboard (requires win32yank or clip.exe)
opt.clipboard = "unnamedplus"        -- Use system clipboard

-- Show whitespace characters (optional, uncomment if you want)
-- opt.list = true
-- opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }
