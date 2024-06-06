#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Long;

# 脚本版本
my $version = "1.0";

# 显示帮助信息
sub show_help {
    print <<EOF;
Usage: $0 [options] <input_file> <output_file> <old_string> <new_string>

Options:
    -h, --help      Show this help message
    -v, --version   Show the version of the script

Arguments:
    <input_file>    Path to the input file
    <output_file>   Path to the output file
    <old_string>    String to be replaced
    <new_string>    String to replace with
EOF
    exit;
}

# 显示版本信息
sub show_version {
    print "$0 version $version\n";
    exit;
}

# 替换文本内容的函数
sub replace_text {
    my ($input_file, $output_file, $old_string, $new_string) = @_;

    # 打开输入文件
    open(my $input_fh, '<', $input_file) or die "Could not open file '$input_file' $!";

    # 打开输出文件
    open(my $output_fh, '>', $output_file) or die "Could not open file '$output_file' $!";

    # 逐行读取输入文件
    while (my $line = <$input_fh>) {
        # 替换字符串并写入输出文件
        $line =~ s/\Q$old_string\E/$new_string/g;  # 使用 \Q 和 \E 来转义特殊字符
        print $output_fh $line;
    }

    # 关闭文件句柄
    close($input_fh);
    close($output_fh);

    print "Replacement complete.\n";
}

# 解析命令行选项
my $help = 0;
my $version_opt = 0;

GetOptions(
    'help|h'    => \$help,
    'version|v' => \$version_opt,
) or die "Error in command line arguments\n";

# 显示帮助信息或版本信息
show_help() if $help;
show_version() if $version_opt;

# 检查参数数量
if (@ARGV != 4) {
    die "Usage: $0 [options] <input_file> <output_file> <old_string> <new_string>\n";
}

# 获取参数
my ($input_file, $output_file, $old_string, $new_string) = @ARGV;

# 调用函数进行替换
replace_text($input_file, $output_file, $old_string, $new_string);
