local home = os.getenv('HOME')
local plugins = io.popen('find ' .. '"' .. home .. '/.config/nvim/lua/after.init' .. ' -type f')
if plugins == nil then
    return
end

for plugin in plugins:lines() do
    local part1, part2 = string.match(plugin, home .. "/[.]config/nvim/lua/after.init/(.*)_(.*)[.]lua")
    if part1 ~= nil and part2 ~= nil then
        plugin = part1 .. '_' .. part2
    else
        plugin = ''
    end
    if plugin ~= '' then
        print(require(plugin))
        require(plugin).config()
    end
end