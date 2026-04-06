local M = {}

M.override = function(config)
  local cmp = require("cmp")

  -- disable <Tab> and <S-Tab> mappings
  config.mapping["<Tab>"] = nil
  config.mapping["<S-Tab>"] = nil

  return config
end

return M
