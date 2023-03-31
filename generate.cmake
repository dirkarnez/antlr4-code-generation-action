set(ANTLR4_JAR_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/antlr/antlr-4.12.0-complete.jar)
file(DOWNLOAD "https://www.antlr.org/download/antlr-4.12.0-complete.jar" ${ANTLR4_JAR_LOCATION})

set(ANTLR4_TARGETS TypeScript JavaScript Cpp PHP Dart Go Python3 CSharp Swift)
set(ANTLR4_SOURCES ZLexer.g4 ZParser.g4)

file(MAKE_DIRECTORY "generated")

foreach(ANTLR4_SOURCE ${ANTLR4_SOURCES})
    foreach(ANTLR4_TARGET ${ANTLR4_TARGETS})
        file(MAKE_DIRECTORY "generated/${ANTLR4_TARGET}")
        execute_process(
            COMMAND "java" 
                "-jar" 
                "${ANTLR4_JAR_LOCATION}" 
                "-Dlanguage=${ANTLR4_TARGET}" 
                "-visitor"
                "${CMAKE_CURRENT_SOURCE_DIR}/${ANTLR4_SOURCE}"
                WORKING_DIRECTORY "generated/${ANTLR4_TARGET}"
            OUTPUT_STRIP_TRAILING_WHITESPACE)
    endforeach()
endforeach()