SRC = $(wildcard lib/*.rb)
SPEC = $(wildcard spec/*.rb)
MARKING_TRANSITION_SCRIPTS = $(wildcard model/*.txt)
GIFS = $(patsubst model/%.txt,model/%.gif,$(MARKING_TRANSITION_SCRIPTS))

default: .rspec_ok $(GIFS)

model/%.gif: model/%.txt model/x-ray-machine.xml .rspec_ok
	petrinet --script $< model/x-ray-machine.xml

.rspec_ok: $(SRC) $(SPEC)
	rspec
	touch $@

clean:
	rm -f .rspec_ok model/*.{gif,txt}