const std = @import("std");
const test_wayland = @import("test_wayland_with_ziglang");
const c = test_wayland.c;

pub fn main() !void {
    const display: *c.wl_display = c.wl_display_create().?;

    const socket_name: []const u8 = std.mem.span(c.wl_display_add_socket_auto(display));
    std.debug.print("{s}\n", .{socket_name});
    std.debug.assert(std.mem.eql(u8, socket_name, "wayland-0"));

    std.log.info("hello, wayland", .{});
    c.wl_display_run(display);
}
