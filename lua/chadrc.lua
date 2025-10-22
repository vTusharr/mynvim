-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",

	 hl_override = {
	 	Comment = { italic = true },
	 	["@comment"] = { italic = true },
	 },
}

M.options = {
  -- PowerShell configuration (official from :h shell-powershell)
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NonInteractive -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering='plaintext';Remove-Alias -Force -ErrorAction SilentlyContinue tee;",
  shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode',
  shellpipe = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode',
  shellquote = "",
  shellxquote = "",
}

 M.nvdash = { load_on_startup = true }
 M.ui = {
       tabufline = {
          lazyload = true
      }
 }

return M
