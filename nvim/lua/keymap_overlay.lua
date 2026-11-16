-- Replace keymaps, then put the previous ones back.
-- Each entry is { mode, lhs, rhs, opts }. mode may be a string or a list.
-- The returned function restores once.

local function apply(maps)
  local saved = {}

  for _, spec in ipairs(maps) do
    local modes = type(spec[1]) == "table" and spec[1] or { spec[1] }
    for _, mode in ipairs(modes) do
      local previous = vim.fn.maparg(spec[2], mode, false, true)
      saved[#saved + 1] = { mode = mode, lhs = spec[2], previous = previous.lhs and previous or nil }
      vim.keymap.set(mode, spec[2], spec[3], spec[4])
    end
  end

  return function()
    for _, entry in ipairs(saved) do
      pcall(vim.keymap.del, entry.mode, entry.lhs)
      if entry.previous then
        vim.fn.mapset(entry.previous)
      end
    end
    saved = {}
  end
end

return { apply = apply }
