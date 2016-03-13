cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
##
## ObjectPoseEstimation CMakeLists File
##
## Copyright (c) 2016, KDuncan
## All Rights Reserved.
##

# Adjust some policies
if(COMMAND cmake_policy)
	if(POLICY CMP0010)
		# Bad variable reference syntax
		cmake_policy(SET CMP0010 NEW) 
	endif()	
endif()

# The only configuration type we're interested in at the moment
#set(CMAKE_CONFIGURATION_TYPES "Release")
project(ObjectPoseEstimation)

# Turn on Solution Folders (Visual Studio)
SET_PROPERTY(GLOBAL PROPERTY USE_FOLDERS ON) 


#=======================================#
# Required Original Headers and Sources #
#=======================================#
set(OPE_INC
	${CMAKE_CURRENT_SOURCE_DIR}/EigenSolver.h
	${CMAKE_CURRENT_SOURCE_DIR}/InertiaCalculations.h
	${CMAKE_CURRENT_SOURCE_DIR}/Minimization.h
	${CMAKE_CURRENT_SOURCE_DIR}/ObjectPoseEstimator.h
	${CMAKE_CURRENT_SOURCE_DIR}/OPECommon.h
	${CMAKE_CURRENT_SOURCE_DIR}/OPESettings.h
	${CMAKE_CURRENT_SOURCE_DIR}/OPEUtils.h
	${CMAKE_CURRENT_SOURCE_DIR}/Plane.h
	${CMAKE_CURRENT_SOURCE_DIR}/PointCloudCapture.h
	${CMAKE_CURRENT_SOURCE_DIR}/SQFitting.h
	${CMAKE_CURRENT_SOURCE_DIR}/SQTypes.h
	${CMAKE_CURRENT_SOURCE_DIR}/TableObjectDetector.h
	${CMAKE_CURRENT_SOURCE_DIR}/TableObjectDetector.hpp
	${CMAKE_CURRENT_SOURCE_DIR}/TableObjectModeler.h
)

set(OPE_IMPL	
	${CMAKE_CURRENT_SOURCE_DIR}/InertiaCalculations.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/Minimization.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/ObjectPoseEstimator.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/OPEMain.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/OPESettings.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/OPEUtils.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/Plane.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/PointCloudCapture.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/SQFitting.cpp
)


#===============#
# Filter Groups #
#===============#
source_group(inc FILES ${OPE_INC})
source_group(src FILES ${OPE_IMPL})


#===========================#
# Third Party Includes etc. #
#===========================#
# Find Eigen
include(FindPkgConfig)
pkg_check_modules( EIGEN eigen3 )
include_directories( ${EIGEN_INCLUDE_DIRS} )

# Find PCL
find_package(PCL 1.5 REQUIRED)
include_directories(${PCL_INCLUDE_DIRS})
link_directories(${PCL_LIBRARY_DIRS})
add_definitions(${PCL_DEFINITIONS})


#=======#
# Build #
#=======#
add_executable(ObjectPoseEstimation ${OPE_IMPL} ${OPE_INC})


#======#
# Link #
#======#
target_link_libraries(ObjectPoseEstimation ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES})


