/*
 * mpu6050.c
 *
 *  Created on: Oct 1, 2023
 *      Author: valiha
 */
#include <mpu6050.h>
#include <stdio.h>
#include <main.h>

extern I2C_HandleTypeDef hi2c1;

void mpu6050_init()
{
	uint16_t addr = (DEVICE_ADDRESS << 1);

	HAL_StatusTypeDef ret = HAL_I2C_IsDeviceReady(&hi2c1, addr + 0, 1, 100);
	if (ret == HAL_OK)
	{
	  printf("the device is ready");
	}
	else
	{
	  printf("the device is not ready");
	}

	uint8_t temp_data = FS_GYRO_500;
	ret = HAL_I2C_Mem_Write(&hi2c1, addr + 0, REG_CONFIG_GYRO, 1, &temp_data, 1, 100);
	if (ret == HAL_OK)
	{
	  printf("configuring gyroscope");
	}
	else
	{
	  printf("failed to configure gyroscope");
	}

	temp_data = FS_ACC_4G;
	ret = HAL_I2C_Mem_Write(&hi2c1, addr + 0, REG_CONFIG_ACC, 1, &temp_data, 1, 100);
	if (ret == HAL_OK)
	{
	  printf("configuring accelerometer");
	}
	else
	{
	  printf("failed to configure accelerometer");
	}

	temp_data = 0;
	ret = HAL_I2C_Mem_Write(&hi2c1, addr + 0, REG_USR_CTRL, 1, &temp_data, 1, 100);
	if (ret == HAL_OK)
	{
	  printf("exiting from sleep mode");
	}
	else
	{
	  printf("failed to exit from sleep mode");
	}
}

void mpu6050_read()
{
	uint16_t addr = (DEVICE_ADDRESS << 1);
	uint8_t data[2];
	int16_t x_acc;

	HAL_I2C_Mem_Read(&hi2c1, addr + 1, REG_DATA, 1, data, 2, 100);
	x_acc = ((int16_t)data[0] <<8) + data[1];
	printf("x axis acceleration: %d \n", x_acc);

}

