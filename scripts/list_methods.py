# This script translate ListMethods.html (HTML4 document) to Typst format,
# on Linux you can easily write output to file using 'python3 main.py > output.txt' command

# for few methods it doesn't get signature correctly and prints 'None' instead so it needs to be replaced manually

from bs4 import BeautifulSoup

reader = open("./TrackmaniaServer_2011-02-21/ListMethods.html")
html = reader.read()
reader.close()

# Translate to Typst
html = html.replace("<i>", "_")
html = html.replace("</i>", "_")
html = html.replace("*", "\*")

soup = BeautifulSoup(html, 'html.parser')

for li in soup.find_all('li'):
    method_name = li.b.string
    signature = ''
    description = li.font.string

    for content in li.contents:
        if content.name == 'br':
            signature += content.next_sibling.strip()

    print(f"== {method_name}")
    print(f"```cpp\n{signature}\n```")
    print(description)
