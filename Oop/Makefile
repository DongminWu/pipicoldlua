
VERSION=`cat 'WhatsNew.txt' | grep "What's new in version" | sed -e 's/[^0-9\.]*//g'`

delivery:
	@echo "Version: $(VERSION)"
	rm -f Oop-*.tar.gz
	cd ..
	tar --exclude *Trait* -cvzf Oop-$(VERSION).tar.gz ../Oop/*
