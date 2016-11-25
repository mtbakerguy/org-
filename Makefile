FILES = brad.ps
.SUFFIXES	: .txt .ps
.SUFFIXES	: .m4 .ps

.m4.ps:
	m4 $< | groff -p -P-l -t > $@

$(FILES):  orgchart.m4

all:	$(FILES)

clean:
	rm -fr $(FILES)
