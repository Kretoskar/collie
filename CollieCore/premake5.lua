project "CollieCore"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    -- will make MD for release and dist and MDd for debug
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "PCH.h"
    pchsource "src/PCH.cpp"

    files
	{
		"src/**.h",
		"src/**.cpp",
		--"vendor/stb_image/**.h",
		--"vendor/stb_image/**.cpp",
		--"vendor/glm/glm/**.hpp",
		--"vendor/glm/glm/**.inl",

		--"vendor/ImGuizmo/ImGuizmo.h",
		--"vendor/ImGuizmo/ImGuizmo.cpp"
	}

    defines
	{
		"_CRT_SECURE_NO_WARNINGS",
		"GLFW_INCLUDE_NONE"
	}


    includedirs
	{
		"src",
	}

	links
	{
		--"GLFW",
		--"Glad",
		--"ImGui",
	}

    filter "system:windows"
		systemversion "latest"

		defines
		{
		}

		links
		{
			--"%{Library.WinSock}",
			--"%{Library.WinMM}",
			--"%{Library.WinVersion}",
			--"%{Library.BCrypt}",
		}

    filter "configurations:Debug"
		defines "C_DEBUG"
		runtime "Debug"
		symbols "on"

		links
		{
			--"%{Library.ShaderC_Debug}",
			--"%{Library.SPIRV_Cross_Debug}",
			--"%{Library.SPIRV_Cross_GLSL_Debug}"
		}

    filter "configurations:Release"
		defines "C_RELEASE"
		runtime "Release"
		optimize "on"

		links
		{
			--"%{Library.ShaderC_Release}",
			--"%{Library.SPIRV_Cross_Release}",
			--"%{Library.SPIRV_Cross_GLSL_Release}"
		}

	filter "configurations:Dist"
		defines "C_DIST"
		runtime "Release"
		optimize "on"

		links
		{
			--"%{Library.ShaderC_Release}",
			--"%{Library.SPIRV_Cross_Release}",
			--"%{Library.SPIRV_Cross_GLSL_Release}"
		}