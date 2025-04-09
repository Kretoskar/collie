#pragma once

constexpr uint32_t ASSERT_MAS_LENGTH = 2048;

#ifdef C_DEBUG
    # define ASSERT(condition, message) \
        { \
            if (!(condition)) \
            { \
                char buffer[LOG_TEMPLATE_LENGTH]; \
                sprintf_s(buffer, "[Assert] [File: %s] [Line: %d] ", __FILE__, __LINE__); \
                Collie::Logger::GetInstance().Log(std::move(buffer), Collie::LogVerbosity::Error, message); \
                std::terminate(); \
            } \
        }
#else
    #   define ASSERT(condition, message) {}
#endif