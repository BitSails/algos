#include <iostream>
#include <vector>


// Prints the array to stdout
void printArray(const std::vector<int> &array);

// Returns the sorted array with the bubble sort algorithm
std::vector<int> bubbleSort(const std::vector<int> &array);


int main(int argc, char **argv)
{
	std::cout << "Please enter the number of terms in the array :\n> ";

	// Get the length of the array by user input
	size_t arrayLength;
	std::cin >> arrayLength;

	// Create the array
	std::vector<int> array;
	array.reserve(arrayLength);

	// Set all values
	for (size_t i = 0U; i < arrayLength; ++i)
	{
		std::cout << "Term " << i << " : ";

		// User input
		int term;
		std::cin >> term;

		array.emplace_back(term);
	}

	// Print the unordered array
	std::cout << "Unordered array : ";
	printArray(array);

	// Sort
	array = bubbleSort(array);

	// Print the sorted array
	std::cout << "Sorted array : ";
	printArray(array);
}

void printArray(const std::vector<int> &array)
{
	// Print empty array
	if (array.empty())
	{
		std::cout << "[]\n";
		return;
	}

	// First term
	std::cout << "[" << array[0];

	// Display each term
	for (size_t i = 1U; i < array.size(); ++i)
		std::cout << ", " << array[i];

	// End
	std::cout << "]\n";
}

// Swaps two elements of an array by their index
inline void swap(std::vector<int> &array, const size_t FIRST, const size_t SECOND)
{
	const int TMP = array[FIRST];
	array[FIRST] = array[SECOND];
	array[SECOND] = TMP;
}

std::vector<int> bubbleSort(const std::vector<int> &array)
{
	std::vector<int> sorted = std::vector<int>(array);

	// For each element
	for (size_t e = 0; e < sorted.size(); ++e)
		// For each element without the first
		for (size_t i = 1; i < sorted.size(); ++i)
			// Test whether we have to swap elements
			if (sorted[i - 1] > sorted[i])
				swap(sorted, i - 1, i);

	return sorted;
}

