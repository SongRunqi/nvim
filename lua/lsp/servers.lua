-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "vuels", "jdtls" },
    automatic_enable = true,
})

local lspconfig = require("lspconfig")

-- Lua Language Server
lspconfig.lua_ls.setup({})

-- Vue Language Server
lspconfig.vuels.setup({})

-- Java Language Server
lspconfig.jdtls.setup({
    cmd = {
        "jdtls",
        "-configuration", vim.fn.expand("~/.cache/jdtls/config"),
        "-data", vim.fn.expand("~/.cache/jdtls/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")),
        "-Dmaven.repo.local=" .. vim.fn.expand("~/.m2/repository"),
        "-Djava.configuration.maven.userSettings=" .. vim.fn.expand("~/.m2/settings.xml"),
    },
    root_dir = lspconfig.util.root_pattern("pom.xml", "gradle.build", ".git"),
    settings = {
        java = {
            home = vim.fn.expand("$JAVA_HOME"),
            configuration = {
                updateBuildConfiguration = "interactive"
            },
            maven = {
                downloadSources = true,
                downloadJavadoc = true,
                userSettings = vim.fn.expand("~/.m2/settings.xml")
            },
            eclipse = {
                downloadSources = true,
                downloadJavadoc = true
            },
            implementationsCodeLens = {
                enabled = true
            },
            referencesCodeLens = {
                enabled = true
            },
            references = {
                includeDecompiledSources = true
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
