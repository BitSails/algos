#https://www.youtube.com/watch?v=aw9wHbFTnAQ 

# makefile version 2.0.11.02.2016

CFLAGS=-std=c++14 -c -Wall

# build the searching project

search: search.o 
	@printf "\033[36mLinking \"search it\"...\n\033[0m"
	g++ search.o -o search.out
	@printf "\nrun by typing './search.out'\n"

search.o: search.cpp
	@printf "\033[36mCompiling \"search it\"...\n\033[0m"
	g++ $(CFLAGS) search.cpp
# ...................................................................

# get the data needed 
data:
	wget http://s3.amazonaws.com/alexa-static/top-1m.csv.zip
	zcat top-1m.csv.zip | cut -d, -f2 > top1Mweb
# ...................................................................
	
sort: sort.o
	@printf "\033[36mLinking \"sort it\"...\n\033[0m"
	g++ sort.o -o sort.out
	@printf "\nrun by typing './sort.out'\n"

sort.o: sort.cpp
	@printf "\033[36mCompiling \"sort it\"...\n\033[0m"
	g++ $(CFLAGS) sort.cpp

# ...................................................................

# if user types make run by accident
run:
	@printf "type the name of the executable to run \n./search.out\n./sort.out\n\n"

clean:
	rm -f *.out *.o 
