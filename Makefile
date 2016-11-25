FILES = orgchart.ps
.SUFFIXES	: .txt .ps
.SUFFIXES	: .m4 .ps

.m4.ps:
	m4 $< | groff -p -P-l -t > $@

all:	$(FILES)

clean:
	rm -fr $(FILES)
