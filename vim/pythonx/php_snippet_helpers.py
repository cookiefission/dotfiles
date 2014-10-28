import os
import re
import json

def load_composer():
    return json.load(open('composer.json'))

def get_path_map():
    composer = load_composer()
    autoload = composer['autoload']['psr-4']
    return { path: namespace for namespace, path in autoload.iteritems() }

def map_path(path, path_map):
    for pathname in path_map:
        path = path.replace(pathname, path_map[pathname], 1)
    return path

def get_namespace(path):
    path_map = get_path_map()
    namespace = map_path(path, path_map)

    m = re.search(r'[A-Z].+(?=/)', namespace)
    if m:
        return m.group().replace('/', '\\')
    return ""

def get_classname(fn):
    return re.match(r'.*(?=\.)', fn).group()
