#include <iostream>
#include <cmath>

int main(int argc, char *argv[0]) {
	for (auto i=0; i<argc; i++)
		std::cout << i << ':' << argv[i] << std::endl;
	double b = cos(23.56);
	return 0;
}

