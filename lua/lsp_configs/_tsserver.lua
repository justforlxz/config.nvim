return {
  init_options = {
    preferences = {
      importModuleSpecifierPreference = 'project-relative'
    },
  },
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
}
