local M = {}

local function set_highlights()
  vim.api.nvim_set_hl(0, "ModernTabActive", {
    fg = "#fbf1c7",
    bg = "#504945",
    bold = true,
  })
  vim.api.nvim_set_hl(0, "ModernTabInactive", {
    fg = "#a89984",
    bg = "#3c3836",
  })
  vim.api.nvim_set_hl(0, "ModernTabFill", {
    fg = "#665c54",
    bg = "#282828",
  })
end

local function label(tabpage)
  local window = vim.api.nvim_tabpage_get_win(tabpage)
  local buffer = vim.api.nvim_win_get_buf(window)
  local path = vim.api.nvim_buf_get_name(buffer)
  local name = path == "" and "[No Name]" or vim.fn.fnamemodify(path, ":t")

  -- A percent sign has special meaning in a statusline expression.
  name = name:gsub("%%", "%%%%")

  if vim.bo[buffer].modified then
    name = name .. " [+]"
  end

  return name
end

function M.render()
  local current = vim.api.nvim_get_current_tabpage()
  local parts = {}

  for index, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
    local highlight = tabpage == current and "%#ModernTabActive#" or "%#ModernTabInactive#"
    parts[#parts + 1] = highlight .. "%" .. index .. "T  " .. label(tabpage) .. "  "
  end

  parts[#parts + 1] = "%#ModernTabFill#%T"
  return table.concat(parts)
end

_G.ModernTabline = M.render
vim.o.tabline = "%!v:lua.ModernTabline()"

local group = vim.api.nvim_create_augroup("ModernTablineHighlights", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = group,
  callback = set_highlights,
})
set_highlights()

return M
