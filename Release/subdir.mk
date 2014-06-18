################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../InertiaCalculations.cpp \
../Minimization.cpp \
../OPEMain.cpp \
../OPESettings.cpp \
../OPEUtils.cpp \
../ObjectPoseEstimator.cpp \
../Plane.cpp \
../PointCloudCapture.cpp \
../SQFitting.cpp 

OBJS += \
./InertiaCalculations.o \
./Minimization.o \
./OPEMain.o \
./OPESettings.o \
./OPEUtils.o \
./ObjectPoseEstimator.o \
./Plane.o \
./PointCloudCapture.o \
./SQFitting.o 

CPP_DEPS += \
./InertiaCalculations.d \
./Minimization.d \
./OPEMain.d \
./OPESettings.d \
./OPEUtils.d \
./ObjectPoseEstimator.d \
./Plane.d \
./PointCloudCapture.d \
./SQFitting.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/usr/include/pcl-1.7 -I/usr/include/openni -I/usr/include/boost -I/usr/include/eigen3 -I/usr/include/flann -I/usr/include/vtk-5.8 -O3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


