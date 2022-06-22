local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/Users/zhanghf/Documents/workspace/' .. project_name

-- format
local function nvim_create_augroup(group_name,definitions)
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definitions) do
        local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
        vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
end

local function java_lsp_before_save()
    local defs = {}
    local ext = vim.fn.expand('%:e')
    table.insert(defs,{"BufWritePre", '*.'..ext,
        "lua vim.lsp.buf.formatting_sync(nil,1000)"})
    table.insert(defs,{"BufWritePre", '*.'..ext,
        "lua require'jdtls'.organize_imports()"})
    nvim_create_augroup('java_lsp_before_save',defs)
end

local opts = { noremap=true, silent=true }
local on_attach = function(client, bufnr)
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    require'jdtls.setup'.add_commands()
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>Declarations<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>Definitions<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>Implementations<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>References<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>TypeDefinitions<cr>', opts)

    -- java
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'crv', require('jdtls').extract_variable(), opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'v', 'crv', [[<esc><cmd>lua require('jdtls').extract_variable(true)<cr'>]], opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'crc', require('jdtls').extract_constant(), opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'v', 'crc', [[<esc><cmd>lua require('jdtls').extract_constant(true)<cr>]], opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'v', 'crc', [[<esc><cmd>lua require('jdtls').extract_method(true)<cr>]], opts)

    java_lsp_before_save()
end

local jar_patterns = {
    '/Users/zhanghf/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
    '/Users/zhanghf/src/vscode-java-decompiler/server/*.jar',
    '/Users/zhanghf/src/vscode-java-test/java-extension/com.microsoft.java.test.plugin/target/*.jar',
    '/Users/zhanghf/src/vscode-java-test/java-extension/com.microsoft.java.test.runner/target/*.jar',
    '/Users/zhanghf/src/vscode-java-test/java-extension/com.microsoft.java.test.runner/lib/*.jar',
    -- '/dev/testforstephen/vscode-pde/server/*.jar'
}
-- npm install broke for me: https://github.com/npm/cli/issues/2508
-- So gather the required jars manually; this is based on the gulpfile.js in the vscode-java-test repo
local plugin_path = '/Users/zhanghf/src/vscode-java-test/java-extension/com.microsoft.java.test.plugin.site/target/repository/plugins/'
local bundle_list = vim.tbl_map(
    function(x) return require('jdtls.path').join(plugin_path, x) end,
    {
        'org.eclipse.jdt.junit4.runtime_*.jar',
        'org.eclipse.jdt.junit5.runtime_*.jar',
        'org.junit.jupiter.api*.jar',
        'org.junit.jupiter.engine*.jar',
        'org.junit.jupiter.migrationsupport*.jar',
        'org.junit.jupiter.params*.jar',
        'org.junit.vintage.engine*.jar',
        'org.opentest4j*.jar',
        'org.junit.platform.commons*.jar',
        'org.junit.platform.engine*.jar',
        'org.junit.platform.launcher*.jar',
        'org.junit.platform.runner*.jar',
        'org.junit.platform.suite.api*.jar',
        'org.apiguardian*.jar'
    }
)
vim.list_extend(jar_patterns, bundle_list)
local bundles = {}
for _, jar_pattern in ipairs(jar_patterns) do
    for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), '\n')) do
        if not vim.endswith(bundle, 'com.microsoft.java.test.runner-jar-with-dependencies.jar')
            and not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar') then
            table.insert(bundles, bundle)
        end
    end
end
local extendedClientCapabilities = require('jdtls').extendedClientCapabilities;
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true;

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {

        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:/Users/zhanghf/.m2/repository/org/projectlombok/lombok/1.18.22/lombok-1.18.22.jar',
        '-jar', '/usr/local/opt/jdtls/libexec/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',

        '-configuration', '/usr/local/opt/jdtls/libexec/config_mac',

        '-data', workspace_dir,
    },

    root_dir = require('jdtls.setup').find_root({
        '.git',
        'pom.xml',
        'gradlew'}),

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-1.8",
                        path = "/usr/local/opt/openjdk@8/",
                    },
                    {
                        name = "JavaSE-11",
                        path = "/usr/local/opt/openjdk@11/",
                    },
                    {
                        name = "JavaSE-16",
                        path = "/usr/local/opt/openjdk@16",
                    },
                    {
                        name = "JavaSE-18",
                        path = "/usr/local/opt/openjdk@18",
                    },
                }
            };
        }
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        bundles = bundles;
        extendedClientCapabilities = extendedClientCapabilities;
    },

    on_attach = on_attach,
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
