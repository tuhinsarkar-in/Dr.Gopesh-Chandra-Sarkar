import re


with open('c:/Users/Tuhin Sarkar/Downloads/Dr.Gopesh-Chandra-Sarkar-main/Dr.Gopesh-Chandra-Sarkar-main/gallery.html', encoding='utf-8') as f:
    html = f.read()
imgs = re.findall(r'<img[^>]+src=[\'"](.*?)[\'"][^>]*>', html)
for img in imgs[:10]:
    print(img)
