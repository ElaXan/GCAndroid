from tqdm import tqdm
from check import check_file
from color import color
import requests
import sys

color = color()

def download_file(url, path):
    try:
        if not (check_file(path)):
            r = requests.get(url, stream=True)
            size = int(r.headers.get('Content-Length', 0))
            block_size = 1024
            progress_bar = tqdm(total=size, unit='iB', unit_scale=True)
            with open(path, 'wb') as f:
                for data in r.iter_content(block_size):
                    progress_bar.update(len(data))
                    f.write(data)
            exit(0)
        else:
            print(f"File already downloaded")
            exit(0)
    except Exception as e:
        print(f"\033[F\033[2K[{color.red}X{color.white}] Failed to download file from {url}\n{e}")
        exit(1)
        
if __name__ == "__main__":
    if len(sys.argv) == 1:
        print("Usage: python3 download.py <url> <path>")
        exit(1)
    elif len(sys.argv) == 2:
        print("Usage: python3 download.py <url> <path>")
        exit(1)
    elif len(sys.argv) == 3:
        download_file(sys.argv[1], sys.argv[2])