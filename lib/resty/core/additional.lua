-- Copyright (C) Yichun Zhang (agentzh)


local ffi = require "ffi"
local base = require "resty.core.base"


local C = ffi.C
local error = error
local get_request = base.get_request


local ngx_ffi_fs_mod_date

ffi.cdef[[
    unsigned long ngx_ffi_fs_mod_date(const char* path, size_t len);
]]
ngx_ffi_fs_mod_date = C.ngx_ffi_fs_mod_date

ngx.fs_mod_date = function(path) 
    return tonumber(ngx_ffi_fs_mod_date(path, #path))
end

return {
    version = base.version
}
