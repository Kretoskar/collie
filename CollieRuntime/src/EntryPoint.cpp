#include "PCH.h"

int main(int argc, char* argv[])
{
	Collie::AllocationMetrics::GetHeapAllocationMetrics().LogAllocationMetrics();
	
	std::string s = "asd";
	Collie::AllocationMetrics::GetHeapAllocationMetrics().LogAllocationMetrics();

	{
		std::unique_ptr<char> c = std::make_unique<char>();
		Collie::AllocationMetrics::GetHeapAllocationMetrics().LogAllocationMetrics();
	}

	Collie::AllocationMetrics::GetHeapAllocationMetrics().LogAllocationMetrics();
}