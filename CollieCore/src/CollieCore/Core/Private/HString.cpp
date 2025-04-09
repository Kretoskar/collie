#include "PCH.h"

#include "CollieCore/Core/Public/HString.h"

namespace Collie
{
    char HString::hashTable[hashTableSize][hashTableMaxStringLength] = { {'\0'} };
    HString HString::None = HString();
}
