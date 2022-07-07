echo Deleting current version...
if [ -d roblox-claimable-group-finder ]; then 
  rm -rf roblox-claimable-group-finder
fi
if [ -d lib ]; then 
  rm -rf lib
fi
if [ -f finder.py ]; then 
  rm finder.py
fi
if [ -f README.md ]; then 
  rm -rf README.md
fi
if [ -f LICENSE ]; then 
  rm -rf LICENSE
fi

echo Getting latest version...
git clone https://github.com/h0nde/roblox-claimable-group-finder.git

echo Extracting...
mv roblox-claimable-group-finder/* ./

echo Getting proxies...
if [ -f proxies.txt ]; then 
  rm -rf proxies.txt
fi
wget -O proxies.txt https://api.proxyscrape.com/v2/?request=displayproxies&protocol=http&timeout=10000&country=all&ssl=all&anonymity=all

echo Cleaning up...
rm -rf	roblox-claimable-group-finder

echo Running script...
python finder.py --workers 16 --proxy-file proxies.txt --webhook-url "$WEBHOOK_URL"
