import sublime
import sublime_plugin
import re
import math


class SnapLinesToIndentLevel(sublime_plugin.TextCommand):
    def run(self, edit, snap_direction=1):
        view = self.view
        tab_size = view.settings().get('tab_size')
        use_spaces = view.settings().get('translate_tabs_to_spaces')

        lines = []
        for sel in view.sel():
            lines += view.lines(sel)
        lines.reverse()

        for line_region in lines:
            content = view.substr(line_region)
            match = re.match("^\s*", content)

            if not match:
                continue

            whitespace = match.group(0)
            spaces = map(lambda c: 1 if c == ' ' else tab_size,
                list(whitespace))

            curr_indent = sum(spaces)
            indent_offset = float(curr_indent) / tab_size

            if indent_offset == 0:
                continue

            #backward
            if snap_direction == -1:
                indent_level = math.floor(indent_offset) * tab_size
            else:
                indent_level = math.ceil(indent_offset) * tab_size

            indent_content = ''
            if use_spaces:
                indent_content = ' ' * int(indent_level)
            else:
                indent_content = '\t' * int(indent_level / tab_size)

            replace_region = sublime.Region(line_region.a,
                line_region.a + len(whitespace))
            view.replace(edit, replace_region, indent_content)
