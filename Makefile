SCRIPT = "generate.sh"

all: build


build:
	bash ${SCRIPT}

serve:
	bash ${SCRIPT} serve

open: 
	bash ${SCRIPT} open

.PHONY: clean

clean:
	find . -iname *~ -delete