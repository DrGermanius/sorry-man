const std = @import("std");

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    const input = try stdin.readByte();

    try stdout.print("  {c}  \n", .{input});
    try stdout.print(" {c}{c}{c} \n", .{ input, input, input });
    try stdout.print("{c}{c}{c}{c}{c}\n", .{ input, input, input, input, input });
    try stdout.print(" {c}{c}{c} \n", .{ input, input, input });
    try stdout.print("  {c}  \n", .{input});
}
