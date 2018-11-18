
.PHONY: all install

include $(BR2_CONFIG)

ifdef BR2_PACKAGE_HELLO_CPP

all: helloc hellopp
install: $(PREFIX)/bin/helloc $(PREFIX)/bin/hellopp

else

all: helloc
install: $(PREFIX)/bin/helloc

endif



$(PREFIX)/bin/%: %
	cp $< $@

L += -lm 

ifdef BR2_PACKAGE_HELLO_PTHREAD
L += -lpthread
endif

hellopp: hello.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^ $(L) && $(OBJDUMP) -x $@ > $@.objdump
helloc: hello.c
	$(CC)  $(CFLAGS)   -o $@ $^ $(L) && $(OBJDUMP) -x $@ > $@.objdump

%.cpp: %.hpp
%.c  : %.h

