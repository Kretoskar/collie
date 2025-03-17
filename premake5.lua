workspace "Collie"
	language "C++"
	architecture "x86_64"
	startproject "CollieEditor"
	configurations { "Debug", "Release" }

	filter { "configurations:Debug" }
		symbols "On"

	filter { "configurations:Release" }
		optimize "On"

	-- Reset the filter for other settings
	filter { }

	outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

function includeGLFW()
	includedirs "Libraries/GLFW/Include"
end

function linkGLFW()
	libdirs "Libraries/GLFW/lib-vc2022"

	-- static lib should not link against GLFW
	filter "kind:not StaticLib"
		links "glfw3"
	filter {}
end

project "Glad"
    kind "StaticLib"
	location "Libraries/GLAD"
    language "C"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "Libraries/GLAD/include/glad/glad.h",
        "Libraries/GLAD/include/KHR/khrplatform.h",
        "Libraries/GLAD/src/glad.c"
    }

    includedirs
    {
        "Libraries/GLAD/include"
    }

	includeGLFW()
	linkGLFW()
    
    filter "system:windows"
        systemversion "latest"

		filter {}

project "Imgui"
	kind "StaticLib"
	location "Libraries/Imgui"
	language "C++"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"Libraries/Imgui/include/**.h",
		"Libraries/Imgui/src/**.cpp",
	}

	includedirs
	{
		"Libraries/Imgui/include"
	}

	includeGLFW();
	linkGLFW();
	
	filter "system:windows"
		systemversion "latest"
		
	filter {}

project "stb_image"
	kind "StaticLib"
	location "Libraries/stb_image"
	language "C++"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"Libraries/stb_image/**.h",
		"Libraries/stb_image/**.cpp"
	}

	includedirs
	{
		"Libraries/stb_image"
	}
	
	filter "system:windows"
		systemversion "latest"
		
	filter {}

project "Collie"
	location "Collie"
	kind "StaticLib"

	 -- pchheader "hbpch.h"
     -- pchsource "Collie/src/hbpch.cpp"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("obj/" .. outputdir .. "/%{prj.name}")

	files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

	includedirs
	{
		"Collie/src",
		"Libraries/GLAD/include",
		"Libraries/Imgui/include",
		"Libraries/stb_image"
	}

	links
	{
		"Glad",
		"Imgui"
	}

	includeGLFW()

	filter {}

    function useCollie()
        includedirs "Collie/src"
        links "Collie"
		includeGLFW()
        linkGLFW()
    end

project "CollieEditor"
	location "CollieEditor"
    kind "ConsoleApp"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("obj/" .. outputdir .. "/%{prj.name}")

	files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

	includedirs
	{
		"CollieEditor/src",
		"Libraries/GLAD/include",
		"Libraries/Imgui/include",
		"Libraries/stb_image"
	}

	links
	{
		"Glad",
		"Imgui",
		"stb_image"
	}

    useCollie()

	filter { "system:windows" }
    	links { "OpenGL32" }
	filter {}