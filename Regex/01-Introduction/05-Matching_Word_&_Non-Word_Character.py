Regex_Pattern = r"\w{3}\W\w{10}\W\w{3}"

import re

print(str(bool(re.search(Regex_Pattern, input()))).lower())