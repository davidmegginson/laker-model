FG_SCENERY=${HOME}/.local/share/scenery/local-scenery-mods

FILES=laker.ac \
  laker.xml \
  laker1.png \
  laker2.png \
  laker-bulk.ac \
  laker-bulk.xml \
  laker-bulk1.png \
  laker-bulk2.png \
  laker-crane.ac \
  laker-crane.xml \
  laker-crane1.png \
  laker-crane2.png \
  laker-csl.ac \
  laker-csl.xml \
  laker-csl1.png \
  laker-csl2.png

install: ${FILES}
	cp ${FILES} ${FG_SCENERY}/Models/Maritime/Civilian/

view: install
	fgfs --aircraft=ufo --lat=41.50217240 --lon=-81.71320549 --altitude=700 --heading=95

laker-bulk.xml: laker.xml
	cat laker.xml | sed -e 's/laker.ac/laker-bulk.ac/g' -e 's/laker2.png/laker-bulk2.png/g' > laker-bulk.xml

laker-bulk1.png: laker1.png
	cp laker1.png laker-bulk1.png 

laker-bulk2.png: laker2.png
	cp laker2.png laker-bulk2.png 

laker-crane.xml: laker.xml
	cat laker-crane.xml | sed -e 's/laker.ac/laker-crane.ac/g' -e 's/laker2.png/laker-crane.png/g' > laker-crane.xml

laker-crane1.png: laker1.png
	cp laker1.png laker-crane1.png 

laker-crane2.png: laker2.png
	cp laker2.png laker-crane2.png 

laker-csl.xml: laker.xml
	cat laker-csl.xml | sed -e 's/laker.ac/laker-csl.ac/g' -e 's/laker2.png/laker-csl.png/g' > laker-csl.xml

laker-csl1.png: laker1.png
	cp laker1.png laker-csl1.png 

laker-csl2.png: laker2.png
	cp laker2.png laker-csl2.png 

