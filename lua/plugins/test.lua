return {
  { "olimorris/neotest-rspec" },
  { "zidhuss/neotest-minitest" },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-rspec", "neotest-minitest" } },
  },
}
