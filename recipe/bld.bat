mkdir "%SRC_DIR%"\build
pushd "%SRC_DIR%"\build

cmake -GNinja ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
	-DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
	-DCMAKE_INSTALL_BINDIR=%LIBRARY_BIN% ^
	-DCMAKE_INSTALL_LIBDIR=%LIBRARY_LIB% ^
	-DCMAKE_INSTALL_INCLUDEDIR=%LIBRARY_INC% ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBUILD_SHARED_LIBS=ON ^
      -DCMAKE_POSITION_INDEPENDENT_CODE=ON ^
      -DBUILD_TESTING=ON ^
      ..

if errorlevel 1 exit 1

cmake --build . --config Release --target install
if errorlevel 1 exit 1

cmake --build . --target run_tests
if errorlevel 1 exit 1