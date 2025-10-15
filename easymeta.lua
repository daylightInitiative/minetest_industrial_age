
meta = {}

local storage = core.get_mod_storage()

local function is_integer(n)
    return type(n) == "number" and math.floor(n) == n
end

function meta.set_bool(key, param)
    storage:set_int(key, param and 1 or 0)
end

function meta.get_bool(key)
    return storage:get_int(key) == 1
end

function meta.set_table(key, param)
    storage:set_string(key, core.serialize(param))
end

function meta.get_table(key)
    return core.deserialize(storage:get_string(key))
end

function init_mod_storage(registry)
    for k, v in pairs(registry) do
        local value_type = type(v)
        
        if value_type == "number" then
            if is_integer(v) then
                storage:set_int(k, v)
            else
                storage:set_float(k, v)
            end
        elseif value_type == "string" then
            storage:set_string(k, v)
        elseif value_type == "boolean" then
            meta.set_bool(k, v)
        elseif value_type == "table" then
            meta.set_table(k, v)
        end
    end
end