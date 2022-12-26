const std = @import("std");
const max_size = 8192;
const carriage_return = "\r";

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();
    const bueno = try stdin.readUntilDelimiterAlloc(
        std.heap.page_allocator,
        '\n',
        max_size,
    );
    defer std.heap.page_allocator.free(bueno);

    const items = std.mem.trim(u8, bueno, carriage_return);
    for (items) |v, i| {
        // ignore all non-numeric chars
        if (v < 47 or v > 58) {
            continue;
        }
        const num = std.fmt.charToDigit(items[(items.len - 1) - i], 10) catch {
            try stdout.print("invalid char: {d} \n", .{v});
            return;
        };
        try stdout.print("{d} ", .{num});
    }
}
