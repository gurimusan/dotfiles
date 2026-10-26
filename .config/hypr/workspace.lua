local monitor = require("monitor")

for i = 1, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor   = i <= 5 and monitor.main or monitor.second,
    })
end
