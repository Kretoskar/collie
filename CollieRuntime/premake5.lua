project "CollieRuntime"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files
	{
		"src/**.h",
		"src/**.cpp"
	}

	includedirs
	{
		"%{wks.location}/CollieCore/src",
		"%{wks.location}/CollieCore/vendor",
	}

	links
	{
		"CollieCore"
	}

    filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines "C_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "C_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "C_DIST"
		runtime "Release"
		optimize "on"