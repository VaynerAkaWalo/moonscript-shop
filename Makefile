run:
	$(MAKE) compile && docker compose up --build && $(MAKE) clean

compile:
	moonc *.moon

clean:
	rm -f *.lua && rm -f *.compiled
