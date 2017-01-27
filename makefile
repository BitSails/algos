#https://www.youtube.com/watch?v=aw9wHbFTnAQ 

# makefile version 2.1.01.27.2017

CFLAGS=-std=c++14 -c -Wall

# build the searching project

search: search.o 
	@printf "\033[36mLinking \"search it\"...\n\033[0m"
	g++ search.o -o search.out
	@printf "\n\033[34mRun by typing 'make run-search'\n\n\033[0m"

search.o: search.cpp
	@printf "\033[36mCompiling \"search it\"...\n\033[0m"
	g++ $(CFLAGS) search.cpp
	
# ...................................................................

# get the data needed 
data:
	wget http://s3.amazonaws.com/alexa-static/top-1m.csv.zip
	zcat top-1m.csv.zip | cut -d, -f2 > top1Mweb
	@echo "#" >> top1Mweb # add sentinel to file
	
# ...................................................................
	
sort: sort.o
	@printf "\033[36mLinking \"sort it\"...\n\033[0m"
	g++ sort.o -o sort.out
	@printf "\n\033[34mRun by typing 'make run-sort'\n\n\033[0m"

sort.o: sort.cpp
	@printf "\033[36mCompiling \"sort it\"...\n\033[0m"
	g++ $(CFLAGS) sort.cpp

# ...................................................................

# if user types make run by accident
run:
	@printf "Error: Use 'make run-search' or 'make run-sort'\n\n"

# ...................................................................

# Correct way to run programs

run-search:
	@./search.out

run-sort:
	@./sort.out

# ...................................................................

# remove temp files

clean:
	rm -f *.out *.o 


