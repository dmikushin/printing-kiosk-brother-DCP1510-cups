cmake_minimum_required(VERSION 3.1)

project(brother-DCP1510-cups LANGUAGES C)

set(PRINTER DCP1510)
set(BASEDIR /opt/brother/Printers/${PRINTER}/)

add_executable(brcupsconfig src/brcupsconfig.c)
target_include_directories(brcupsconfig PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src)

set(SYSTEMD_UNIT_DIR "${CMAKE_INSTALL_PREFIX}/lib/systemd/system/")

install(TARGETS brcupsconfig RUNTIME DESTINATION ${BASEDIR}/cupswrapper/)
install(FILES src/brother_lpdwrapper_DCP1510
	PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ WORLD_READ WORLD_EXECUTE GROUP_READ GROUP_EXECUTE
	DESTINATION /usr/lib/cups/filter/)
install(FILES src/brother-DCP1510-cups-en.ppd DESTINATION /usr/share/cups/model/)
install(CODE "execute_process(COMMAND bash -c \"lpadmin -p DCP1510 -E -v usb://Brother/DCP-1510%20series?serial=E72143M5N116594 -P /usr/share/cups/model/brother-DCP1510-cups-en.ppd && lpadmin -d DCP1510\")")
