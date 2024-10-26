FG_SCENERY=${HOME}/.local/share/scenery/local-scenery-mods

VIEW_LAT=41.50217240
VIEW_LON=-81.71320549
VIEW_HDG=95
VIEW_ALT=700

FILES=laker.ac \
  laker.xml \
  laker1.png \
  laker2.png \
  laker-bulk/laker-bulk.ac \
  laker-bulk/laker-bulk.xml \
  laker-bulk/laker-bulk1.png \
  laker-bulk/laker-bulk2.png \
  laker-crane/laker-crane.ac \
  laker-crane/laker-crane.xml \
  laker-crane/laker-crane1.png \
  laker-crane/laker-crane2.png \
  laker-csl/laker-csl.ac \
  laker-csl/laker-csl.xml \
  laker-csl/laker-csl1.png \
  laker-csl/laker-csl2.png

install: ${FILES}
	cp ${FILES} ${FG_SCENERY}/Models/Maritime/Civilian/

generate: ${FILES}

view: install
	fgfs --aircraft=ufo --timeofday=noon --lat=${VIEW_LAT} --lon=${VIEW_LON} --altitude=${VIEW_ALT} --heading=${VIEW_HDG}


#
# Variants
#
# The variants all have the same *.ac file, but use an animation in the XML to selectively hide objects
#


# Generate the bulk variant

laker-bulk/laker-bulk.ac: laker.ac
	cat laker.ac | sed -e 's!laker1.png!laker-bulk/laker-bulk1.png!g' > laker-bulk/laker-bulk.ac

laker-bulk/laker-bulk1.png: laker1.png
	cp laker1.png laker-bulk/laker-bulk1.png 

laker-bulk/laker-bulk2.png: laker2.png
	cp laker2.png laker-bulk/laker-bulk2.png


# Generate the self-unloading variant

laker-crane/laker-crane.ac: laker.ac
	cat laker.ac | sed -e 's!laker1.png!laker-crane/laker-crane1.png!g' > laker-crane/laker-crane.ac

laker-crane/laker-crane1.png: laker1.png
	cp laker1.png laker-crane/laker-crane1.png 

laker-crane/laker-crane2.png: laker2.png
	cp laker2.png laker-crane/laker-crane2.png


# Generate the Canada Steamships Line variant

laker-csl/laker-csl.ac: laker.ac
	cat laker.ac | sed -e 's!laker1.png!laker-csl/laker-csl1.png!g' > laker-csl/laker-csl.ac

laker-csl/laker-csl1.png: laker1.png
	cp laker1.png laker-csl/laker-csl1.png 

laker-csl/laker-csl2.png: laker2.png
	cp laker2.png laker-csl/laker-csl2.png 
