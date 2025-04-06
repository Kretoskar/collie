workspace "Collie"
    architecture "x86_64"
	startproject "CollieRuntime"

    configurations
	{
		"Debug",
		"Release",
		"Dist"
	}
	
	flags
	{
		"MultiProcessorCompile"
	}

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

group "Dependencies"
	
group ""

group "Collie"
    include "CollieCore"
    include "CollieRuntime"
group ""