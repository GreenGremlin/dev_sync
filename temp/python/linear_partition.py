# https://github.com/dahlia/libsass-python

from math import fsum, floor

DEBUG = False

sample_image_ratios = (.4,.8,1.2,1.0,.5,.4,1.1,.6,1.5,1.8,1.2,.7,.4,.8,1.1)
image_sizes = (
  (500, 400),
  (590, 988),
  (1008, 422),
  (500, 400),
  (500, 400),
  (1008, 422),
  (590, 988)
)

# Finds the largest scale at which the layout will fit into it's
# "ideal" width.
def find_layout_threshold(items, num_rows):
    ideal_width = fsum(items) / num_rows
    widest_item = max(items)

    if len(items) <= 1 or num_rows >= len(items):
        return ideal_width / float(widest_item)

    # start at the ideal width, unless there is an item
    # wider than the ideal width
    layout_width = max((ideal_width, widest_item))

    if DEBUG: print('starting width: ' + `layout_width`)
    if DEBUG: print('num rows: ' + `num_rows`)

    layout = generate_layout_spec(items, layout_width)
    if DEBUG: print(`layout['row_count']` + ': ' + `layout_width`)

    # find the most narrow box that will contain the layout
    while layout['row_count'] > num_rows:
        layout_width += layout['least_excess']
        if DEBUG: print(' - ' + `layout_width` + ' - ')
        layout = generate_layout_spec(items, layout_width)

    next_width = layout_width + layout['least_excess']
    return (ideal_width / float(next_width), ideal_width / float(layout_width))

# Generates a layout specification for a given width
# @returns dict
#     row_count: the number of rows at the given width
#     least_excess:
def generate_layout_spec(items, max_width):

    def fill_layout(layout_spec, item_width):
        row_width = layout_spec['row_width'] + item_width

        # current item wraps to the next row
        if row_width > max_width:
            # additional width needed to fit the next item on this row
            excess = row_width - max_width
            if excess < layout_spec['least_excess']:
                layout_spec['least_excess'] = excess

            if DEBUG: print(`layout_spec['row_count']` + ' - ' + `layout_spec['row_width']`)
            layout_spec['row_width'] = item_width
            layout_spec['row_count'] += 1

        # current item fits in the current row
        else:
            layout_spec['row_width'] = row_width

        return layout_spec

    initial_layout_spec = {
      'row_width': 0,
      'row_count': 1,
      'least_excess': max(items)
    }

    layout = reduce(fill_layout, items, initial_layout_spec)
    if DEBUG: print(`layout['row_count']` + ' - ' + `layout['row_width']`)
    return layout


image_ratios = [w / float(h) for (w, h) in image_sizes]
print(image_ratios)
print([int(floor(ratio * 1000)) for ratio in image_ratios])
print(sorted(set(image_ratios)))
print(sum(image_ratios))

for i in range(len(image_ratios)):
    threshold = find_layout_threshold(image_ratios, i + 1)
    if DEBUG: print('___')
    print(`i+1` + ' | ' + `threshold`)
    if DEBUG: import pdb; pdb.set_trace();

print 'average ratio: ' + `fsum(image_ratios) / len(image_ratios)`
