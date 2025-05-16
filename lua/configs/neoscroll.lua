local neoscroll = require('neoscroll')
neoscroll.setup({
  -- All these keys will be mapped to their corresponding default scrolling animation
  mappings = {
    "zt",
    "zz",
    "zb",
  },
  hide_cursor = true, -- Hide cursor while scrolling
  stop_eof = true, -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the window
  cursor_scrolls_alone = false, -- The cursor will keep on scrolling even if the window cannot scroll anymore
  easing_function = "cubic", -- Default easing function
  pre_hook = nil, -- Function to run before the scrolling animation starts
  post_hook = nil, -- Function to run after the scrolling animation ends
})
local keymap = {
  ["<C-f>"] = function() neoscroll.ctrl_u({ duration = 250; easing = 'sine' }) end;
  ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 250; easing = 'sine' }) end;
  -- ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 450; easing = 'circular' }) end;
  -- ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 450; easing = 'circular' }) end;
  ["<A-k>"] = function() neoscroll.scroll(-0.1, { move_cursor=false; duration = 100 }) end;
  ["<A-j>"] = function() neoscroll.scroll(0.1, { move_cursor=false; duration = 100 }) end;
}
local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
    vim.keymap.set(modes, key, func)
end
