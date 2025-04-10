#include "PCH.h"
#include "CollieCore/Memory/Public/Memory.h"
#include "CollieCore/Core/Public/Logger.h"

void Collie::AllocationMetrics::LogAllocationMetrics() const
{
    LOG_MESSAGE("Memory usage: %u bytes. Allocated: %u, freed: %u", 
        GetCurrentUsage(), TotalAllocated, TotalFreed)
}

void* operator new(size_t size)
{
#ifdef C_DEBUG
    Collie::AllocationMetrics::GetHeapAllocationMetrics().TotalAllocated += size;
#endif
    
    return malloc(size);
}

void operator delete(void* memory, size_t size)
{
#ifdef C_DEBUG
    Collie::AllocationMetrics::GetHeapAllocationMetrics().TotalFreed += size;
#endif
    
    free(memory);
}