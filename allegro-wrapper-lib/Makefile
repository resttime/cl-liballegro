# The Allegro monolith library is of the format *.a
ALLEGRO_LIBRARY=liballegro-5.0.8-monolith-mt.a

wrapper.dll: wrapper.o $(ALLEGRO_LIBRARY)
	gcc -shared -o wrapper.dll wrapper.o $(ALLEGRO_LIBRARY)

wrapper.o: wrapper.c
	gcc -I"./include" -c -fPIC wrapper.c
	
clean:
	rm -rf wrapper.o wrapper.dll