from concurrent.futures import ThreadPoolExecutor
from urllib.request import urlopen
import time
import os


def download_image(url):
    image_data = None
    with urlopen(url) as f:
        image_data = f.read()

    if not image_data:
        raise Exception(f"Ошибка: невозможно скачать изображение {url}")

    filename = os.path.basename(url)

    with open(f'/Users/mac/Documents/{filename}', 'wb') as image_file:
        image_file.write(image_data)
        print(f'{filename} скачан по пути "/Users/mac/Documents/{filename}...')

start = time.perf_counter()

urls = ['https://upload.wikimedia.org/wikipedia/commons/9/9d/Python_bivittatus_1701.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/4/48/Python_Regius.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/d/d3/Baby_carpet_python_caudal_luring.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/f/f0/Rock_python_pratik.JPG',
        'https://upload.wikimedia.org/wikipedia/commons/0/07/Dulip_Wilpattu_Python1.jpg']

with ThreadPoolExecutor() as executor:
      executor.map(download_image, urls)

finish = time.perf_counter()

print(f'Выполнение заняло {finish-start} секунд.')




# or code here v2
import requests
import os

def download_image(url, directory, filename):
    response = requests.get(url)
    filepath = os.path.join(directory, filename)
    
    with open(filepath, "wb") as file:
        file.write(response.content)
    
    print(f"Изображение сохранено по пути: {filepath}")

# Пример использования
image_url = "https://example.com/image.jpg"  # URL изображения, которое нужно скачать
save_directory = "/path/to/save/directory"  # Путь к директории, в которую нужно сохранить изображение
image_filename = "image.jpg"  # Имя файла, под которым нужно сохранить изображение

download_image(image_url, save_directory, image_filename)
