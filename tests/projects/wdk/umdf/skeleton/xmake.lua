
-- add modes: debug and release 
add_rules("mode.debug", "mode.release")

-- enable unicode
add_defines("_UNICODE", "UNICODE")

-- add target
target("skeleton")

    -- add rules
    add_rules("wdk.umdf.driver", "wdk.sign.test")

    -- add flags fro tracewpp
    add_values("wdk.tracewpp.flags", "-scan:internal.h")

    -- add files
    add_files("*.cpp", {rule = "wdk.tracewpp"})
    add_files("*.rc", "*.inx") 

    -- set umdf sdk version
    set_values("wdk.umdf.sdkver", "1.9")

    -- add exports
    add_shflags("/DEF:exports.def", {force = true})

    -- set entry
    add_shflags("/ENTRY:_DllMainCRTStartup" .. (is_arch("x86") and "@12" or ""), {force = true})

