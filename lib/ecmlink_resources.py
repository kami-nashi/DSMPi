import requests
from pathlib import Path
import bs4
import re
import platform


def find_ecmlink(arch):
    '''
    Finds the latest version, based on aarch64 or x64 options
    '''

    base_url = 'https://www.ecmtuning.com'
    downloads_url = '/downloads.php'
    download_link = ''
    
    response = requests.get(base_url + downloads_url)
    #response.raise_for_status()  # Raise an exception for HTTP errors
    soup = bs4.BeautifulSoup(response.text, 'html.parser')

    # Find all anchor tags with href attributes
    links = soup.find_all('a', href=True)

    # Filter and print download links
    for link in links:
        href = link['href']

        # Check if the href is a valid download link (e.g., ends with .zip, .exe, etc.)
        if re.search(r'\.tar\.gz$', href, re.IGNORECASE) and re.search(arch, href, re.IGNORECASE):
            download_link = href

    # If there isn't a link for the arch specified, return none and print an error msg
    if not download_link:
        print(f"Warning: No download link found for architecture: {arch}")
        return None

    return base_url + download_link


def download_ecmlink(arch, filename=None):
    '''
    Downloads the file from the given URL into ~/software.
    Creates the folder if it doesn't exist.
    '''
    import requests
    from pathlib import Path

    # Get the user's home directory and ensure ~/software exists
    home_dir = Path.home()
    software_dir = home_dir / 'software'
    software_dir.mkdir(parents=True, exist_ok=True)

    url = find_ecmlink(arch)

    # Use filename from URL if not provided
    if not filename:
        filename = url.split('/')[-1]

    destination_path = software_dir / filename

    try:
        with requests.get(url, stream=True) as response:
            response.raise_for_status()
            with open(destination_path, 'wb') as f:
                for chunk in response.iter_content(chunk_size=8192):
                    if chunk:
                        f.write(chunk)
        print(f"Download complete: {destination_path}")
        return destination_path
    except requests.exceptions.RequestException as e:
        print(f"Download failed: {e}")
        return None
    

def gather():
    arch = platform.machine()
    if 'x86_64' in arch:
        arch = 'x64'
    
    current_version = find_ecmlink(arch)
    if current_version:
        download_ecmlink(arch)
