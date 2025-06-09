-- 导入 WezTerm API
local wezterm = require("wezterm")

-- 初始化配置表
-- 使用 wezterm.config_builder() 是一种推荐方式，它可能提供一些额外的便利
-- local config = {} 也是完全可以的
local config = wezterm.config_builder()

-- 1. 默认 Shell 设置
-- 仅在 Windows 系统上应用此特定配置
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	-- 推荐使用 PowerShell Core (pwsh.exe)，如果已安装并配置在 PATH 中
	config.default_prog = { "pwsh.exe", "-NoLogo" }

	-- 如果希望使用传统的 Windows PowerShell:
	-- config.default_prog = { 'powershell.exe', '-NoLogo' }

	-- 如果希望使用 CMD (命令提示符):
	-- config.default_prog = { 'cmd.exe' }

	-- 如果希望启动 WSL (Windows Subsystem for Linux) 的默认发行版:
	-- config.default_prog = { 'wsl.exe' }
	-- 若要启动特定发行版的特定 shell (例如 Ubuntu-20.04 中的 zsh):
	-- config.default_prog = { 'wsl.exe', '-d', 'Ubuntu-20.04', '-e', 'zsh' }
end

-- 2. 字体配置
config.font = wezterm.font_with_fallback({
	-- 主字体，可以根据个人喜好选择，确保包含所需字符集或 Powerline/Nerd Font 符号
	-- "Cascadia Code NF", -- 示例：优先使用带 Nerd Font 符号的 Cascadia Code
	"Sarasa Term SC Nerd", -- 更纱黑体，一款优秀的中文等宽字体，包含 Nerd Font 符号
	"JetBrains Mono", -- 备选的流行等宽字体
	"Segoe UI Emoji", -- Windows 系统自带的 Emoji 字体，确保 Emoji 能正确显示
	"Symbols Nerd Font Mono", -- 补充的 Nerd Font 符号，以防主字体缺失某些图标
})
config.font_size = 12.0 -- 根据屏幕分辨率和个人喜好调整字体大小

-- 可选：调整行高，例如 1.0 (默认), 1.1, 1.2 等
-- config.line_height = 1.1

-- 3. 配色方案和外观
config.color_scheme = "Catppuccin Mocha" -- 一个广受欢迎的深色主题
-- 其他流行主题示例:
-- config.color_scheme = 'Gruvbox dark, soft (base16)'
-- config.color_scheme = 'Solarized Dark'
-- config.color_scheme = 'Dracula'

-- 如果需要覆盖所选配色方案中的特定颜色，或者自定义颜色：
-- config.colors = {
--   background = '#1E1E2E', -- 背景色
--   foreground = '#CDD6F4', -- 前景色
--   cursor_bg = '#F5E0DC',  -- 光标背景色
--   cursor_fg = '#1E1E2E',  -- 光标前景色 (文字颜色)
--   selection_bg = 'rgba(100, 100, 150, 0.4)', -- 选区背景色 (半透明)
--   -- ANSI 颜色等其他颜色也可以在这里定义
-- }

-- 窗口透明度 (0.0 完全透明, 1.0 完全不透明)
-- config.window_background_opacity = 0.95 -- 轻微的毛玻璃效果

-- 是否使用原生外观的标签栏 (true) 或复古风格 (false)
config.use_fancy_tab_bar = true

-- 标签栏位置 (true: 底部, false: 顶部)
config.tab_bar_at_bottom = false

-- 窗口内边距
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 0, -- 底部通常不需要额外边距
}

-- 可选：自定义窗口框架（如标签栏字体、标题栏背景色）
-- config.window_frame = {
--   font = wezterm.font({ family = 'Segoe UI', weight = 'Bold' }), -- 标签栏字体
--   font_size = 10.0,                                           -- 标签栏字号
--   active_titlebar_bg = '#2B2B2B',                             -- 活动窗口标题栏背景色
--   inactive_titlebar_bg = '#1E1E1E',                           -- 非活动窗口标题栏背景色
-- }

-- 4. 按键绑定示例
config.keys = {
	-- 使用更容易按到的 Alt + Shift + V/H 进行垂直/水平分割窗格
	{
		key = "V", -- 注意这里是大写 V，通常表示 Shift+v
		mods = "ALT|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "H", -- 注意这里是大写 H，通常表示 Shift+h
		mods = "ALT|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- 使用 Alt + 方向键激活相邻窗格
	{ key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },

	-- 示例：禁用默认的 CTRL+SHIFT+Z 缩放窗格 (如果它与某些程序快捷键冲突)
	-- { key = 'Z', mods = 'CTRL|SHIFT', action = wezterm.action.DisableDefaultAssignment },

	-- 示例：使用 CTRL+SHIFT+N 创建新窗口 (覆盖默认的 SpawnWindow，确保行为一致)
	-- { key = 'N', mods = 'CTRL|SHIFT', action = wezterm.action.SpawnWindow },
}

-- 领导键 (Leader Key) 示例 (可选，如果习惯类似 Vim 的模态操作)
-- 首先定义领导键组合和超时时间
-- config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 } -- 例如 Ctrl+A 作为领导键
-- 然后在 config.keys 中添加使用 LEADER 修饰的绑定
-- table.insert(config.keys, {
--   key = 'r', -- 按下 Ctrl+A 后再按 r
--   mods = 'LEADER',
--   action = wezterm.action.ReloadConfiguration,
-- })
-- table.insert(config.keys, {
--   key = 'c', -- 按下 Ctrl+A 后再按 c
--   mods = 'LEADER',
--   action = wezterm.action.SpawnTab 'CurrentPaneDomain',
-- })

-- 5. 启动器菜单示例 (右键点击标签栏 '+' 按钮触发)
local launch_menu_items = {}
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	table.insert(launch_menu_items, {
		label = "PowerShell Core", -- 假设 pwsh.exe 在 PATH 中
		args = { "pwsh.exe", "-NoLogo" },
	})
	table.insert(launch_menu_items, {
		label = "Windows PowerShell",
		args = { "powershell.exe", "-NoLogo" },
	})
	table.insert(launch_menu_items, {
		label = "Command Prompt (CMD)",
		args = { "cmd.exe" },
	})
	table.insert(launch_menu_items, {
		label = "WSL (Default Distro)",
		args = { "wsl.exe" },
	})
	table.insert(launch_menu_items, {
		label = "Notepad",
		args = { "notepad.exe" },
	})
	table.insert(launch_menu_items, {
		label = "Calculator",
		args = { "calc.exe" },
	})
	-- 打开当前 WezTerm 配置文件进行编辑
	table.insert(launch_menu_items, {
		label = "Edit WezTerm Config",
		-- wezterm.config_dir 变量指向配置所在的目录
		args = { "notepad.exe", wezterm.config_dir .. "/wezterm.lua" },
	})
	-- 示例：添加 Visual Studio Code (如果 code.exe 在 PATH 中)
	-- table.insert(launch_menu_items, {
	--   label = 'Visual Studio Code',
	--   args = { 'code.exe' },
	-- })
end
config.launch_menu = launch_menu_items

-- 6. 其他常用设置
config.enable_scroll_bar = true -- 在 Windows 上，用户可能更习惯显示滚动条
config.audible_bell = "Disabled" -- 禁用终端蜂鸣声
config.automatically_reload_config = true -- 当配置文件被修改并保存后，自动重新加载

-- 确保返回最终的配置表
return config
