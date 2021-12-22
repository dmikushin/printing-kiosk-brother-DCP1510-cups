cmake_minimum_required(VERSION 3.1)

project(brother-DCP1510-cups LANGUAGES C)

set(PRINTER DCP1510)
set(BASEDIR /opt/brother/Printers/${PRINTER}/)

add_executable(brcupsconfig src/brcupsconfig.c)
target_include_directories(brcupsconfig PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src)

set(SYSTEMD_UNIT_DIR "${CMAKE_INSTALL_PREFIX}/lib/systemd/system/")

install(TARGETS brcupsconfig RUNTIME DESTINATION ${BASEDIR}/cupswrapper/)
install(FILES src/brother_lpdwrapper_DCP1510 DESTINATION /usr/lib/cups/filter/)
install(FILES src/brother-DCP1510-cups-en.ppd DESTINATION /usr/share/cups/model/)
install(CODE "execute_process(COMMAND lpadmin -p DCP1510 -E -v usb://dev/usb/lp0 -P /usr/share/cups/model/brother-DCP1510-cups-en.ppd)")
