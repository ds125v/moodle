#!/bin/sh

# generate unminified so each selector should be on a line to itself
recess --compile less/moodle.less > style/generated.css

# first get rid of any line starting with .dir-rtl and ending with a comma (about 130)
perl -p -i -e 's/^.dir-rtl.*,$//' style/generated.css

# Next change any newline after a , into a space:
perl -p -i -e 's/,\n/, /' style/generated.css

# And remove rtl selectors that come after a comma and before a curly bracket (there should be about five):
perl -p -i -e 's/, .dir-rtl.*{/ {/' style/generated.css 

# Then you can collapse entire rules onto one line by getting rid of some more newlines:
perl -p -i -e 's/{\n/{ /' style/generated.css
perl -p -i -e 's/;\n/; /' style/generated.css

# Then delete any line that starts with .dir-rtl (about 170):
perl -p -i -e 's/^.dir-rtl.*$//' style/generated.css

