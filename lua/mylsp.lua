require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "vuels", "jdtls" },
    automatic_enable = true,
})

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})
lspconfig.vuels.setup({})

-- java

lspconfig.jdtls.setup({
    cmd = {
        "jdtls",
        "-configuration", vim.fn.expand("~/.cache/jdtls/config"),
        "-data", vim.fn.expand("~/.cache/jdtls/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")),
        -- 添加本地Maven仓库配置
        "-Dmaven.repo.local=" .. vim.fn.expand("~/.m2/repository"),
        "-Djava.configuration.maven.userSettings=" .. vim.fn.expand("~/.m2/settings.xml"),
    },
    root_dir = lspconfig.util.root_pattern("pom.xml", "gradle.build", ".git"),
    settings = {
        java = {
            home = vim.fn.expand("$JAVA_HOME"), -- 使用本地JDK
            configuration = {
                updateBuildConfiguration = "interactive"
            },
            maven = {
                downloadSources = true,                            -- 改为false，避免自动下载
                downloadJavadoc = true,                            -- 改为false
                userSettings = vim.fn.expand("~/.m2/settings.xml") -- 使用本地Maven设置
            },
            eclipse = {
                downloadSources = true, -- 改为false
                downloadJavadoc = true
            },
            implementationsCodeLens = {
                enabled = true
            },
            referencesCodeLens = {
                enabled = true
            },
            references = {
                includeDecompiledSources = true -- 保留，用于反编译查看
            },
            format = {
                enabled = true
            }
        }
    },
    init_options = {
        bundles = {}
    }
})
