#include "PCH.h"

int main(int argc, char* argv[])
{
	Collie::HString h = Collie::HString("x");
	Collie::HString a = Collie::HString("x");
	
	LOG_ERROR(h.Get())
	LOG_WARNING(a.Get())
}