# AGENTS.md - Neovim Lua Configuration

## Build/Lint/Test Commands
- `luacheck .` - Run Lua linter
- `stylua .` - Format all Lua files
- `lua-language-server --check .` - Type check
- Test single file: `lua -e "dofile('path/to/file.lua')"`

## Code Style Guidelines
- **Indent**: 4 spaces (no tabs)
- **Line length**: 80-100 chars
- **Naming**: snake_case for vars/functions, PascalCase for modules
- **Imports**: `local module = require("module.path")`
- **Comments**: `--` for single line, `--[[ ]]` for multi-line
- **Error handling**: Use `pcall` for protected calls
- **Globals**: Declare in `.luarc.json` under `diagnostics.globals`
- **Formatting**: Use Stylua config (if present)

## Project Structure
- `init.lua` - Main entry point
- `lua/core/` - Core configuration
- `lua/plugins/` - Plugin configurations
- `lua/archive/` - Archived configurations

## Agent Guidelines
**Always consult and update `plan.md`** before making changes. This ensures continuity between different agents/models working on this Helix-like Neovim configuration mission.