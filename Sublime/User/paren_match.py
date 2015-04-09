# import sublime, sublime_plugin, re

# class ParenMatch(sublime_plugin.EventListener):
#     parens_closed = re.compile(r"^(?:[^()])*([(])(?:(?:[^()])*[(](?:[^()]|[(](?:[^()]|[(](?:[^()]|[(][^()]*[)])*[)])*[)])*[)])([)])(?:[^(])*$")

#     def on_query_context(view, key, operator, operand, match_all):

#         # Walk through each region in the selection
#         for region in view.sel():
#             # Only interested in empty regions, otherwise they may span multiple
#             # lines, which doesn't make sense for this command.
#             if region.empty():
#                 # Expand the region to the full line it resides on, excluding the newline
#                 line = view.line(region)
#                 # Extract the string for the line, and add a newline
#                 match = parens_closed.match(line)

#                 return match

#         return False
