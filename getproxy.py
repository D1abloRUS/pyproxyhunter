from pyproxyhunter import ProxyHunter
hunter = ProxyHunter(pages=1, timeout=2, threads=500, get_country_info=False)

proxies = [proxy.server for proxy in hunter.hunt()]

for list in proxies:
    print(list)
